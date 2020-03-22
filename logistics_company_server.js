//command: node logistics_company_server.js

const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
var path = require('path');
app.use(bodyParser.urlencoded());

app.use(bodyParser.json());
app.use(cors());

const lc_db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'logistics_302'
});

lc_db.connect();

app.get('/', function(req,res){
    res.sendFile(path.join(__dirname + '/index.html'));
})

app.post('/lc/input-order', function(req,res){
    var recieveOrder = new Promise((resolve, reject) => {
        var order=req.body['Order'];
        var customer=req.body['Customer'];
        var paymentAmt = 0
        if (order['cash_on_delivery']=='yes'){
            order['order_item'].forEach(function(item, i) {
                paymentAmt += item['price']
            })
        }
        var deliverySql = `INSERT INTO delivery (ds_order_id,ds_customer_id,customer_name,address,contact_no,cash_on_delivery,payment_amount) 
                        VALUES (${order['order_no']},${customer['customer_no']},'${customer['customer_name']}','${customer['address']}',
                        '${customer['contact_no']}','${order['cash_on_delivery']}',${paymentAmt});`
        lc_db.query(deliverySql, (err, result)=>{
            if(err) throw err;
            var deliveryId = result['insertId']

            order['order_item'].forEach(function(item, i) {
                var itemSql = `INSERT INTO item (delivery_id,ds_product_id,quantity,delivery_status)
                        VALUES (${deliveryId},${item['code']},${item['quantity']},'delivering');`
                lc_db.query(itemSql, (err, result)=>{
                    if(err) throw err;
                    resolve(deliveryId)
                });
            })
        });
    })

    recieveOrder.then(function (deliveryId) {
        res.json({ success: true, delivery_id: deliveryId })
    })
    
});

app.get('/lc/search', function(req,res){
    res.sendFile(path.join(__dirname + '/lc_search.html'));
})

app.get('/lc/search/submit', function(req,res){
    var deliveryId = req.query.deliveryid
    var infoSql = `SELECT * FROM delivery WHERE id = ${deliveryId}`
    var itemSql = `SELECT * FROM item WHERE delivery_id = ${deliveryId}`
    lc_db.query(infoSql, (err, info_res)=>{
        if(err) throw err;
        var info_result = info_res[0]
        if(info_result){
            lc_db.query(itemSql, (err, item_res)=>{
                console.log(item_res)
                if(err) throw err;
                var itemsTableHtml = ''
                item_res.map((v,i) => {
                    itemsTableHtml += 
                        `<tr>
                            <td style="text-align:center">${v['ds_product_id']}</td>
                            <td style="text-align:center">${v['quantity']}</td>
                            <td style="text-align:center">${v['delivery_status']}</td>
                        </tr>`
                })

                var html = `
                <h2>Delivery ID: ${deliveryId}</h2>
                <p>Order ID: ${info_result['ds_order_id']}</p>
                <p>Customer ID: ${info_result['ds_customer_id']}</p>
                <p>Payment Amount: ${info_result['payment_amount']}</p>
                <p>Cash on delivery: ${info_result['cash_on_delivery']}</p>
                <p>Created date: ${info_result['created_date']}</p> <br/>
                <h3>Delivery Status</h3>
                <table>
                    <tr>
                        <th style="width:100px; text-align:center;">Item ID</th>
                        <th style="width:100px; text-align:center">Quantity</th>
                        <th style="width:100px; text-align:center">Status</th>
                    </tr>
                    ${itemsTableHtml}
                </table>
                `
            
                res.set('Content-Type', 'text/html');
                res.send(new Buffer(html));
            })
        }else{
            res.send('No Record');
        }

    })

})


app.listen(4000, ()=>{
    console.log('listening port 4000')
});