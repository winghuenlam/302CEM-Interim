//command: node logistics_company_server.js

const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
const moment = require('moment');
var path = require('path');
app.use(bodyParser.urlencoded());

app.use(bodyParser.json());
app.use(cors());
app.set('view engine', 'ejs');

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
                if(err) throw err;
                res.render('lc_search_result', { info:info_result, item:item_res });
            })
        }else{
            res.send('No Record');
        }
    })
})

app.get('/lc/update', function(req,res){
    res.sendFile(path.join(__dirname + '/lc_update.html'));
})

app.get('/lc/update/submit', function(req,res){
    var deliveryId = req.query.deliveryid
    var status = req.query.status
    const date = moment(Date.now()).format('YYYY-MM-DD');
    console.log(date)
    var deliverSql = `UPDATE delivery SET delivered_date = '${date}' WHERE id = ${deliveryId}`
    var itemSql = `UPDATE item SET delivery_status = '${status}' WHERE delivery_id = ${deliveryId}`
    console.log(itemSql)
    lc_db.query(deliverSql, (err, deli_res)=>{
        if(err) throw err;
        lc_db.query(itemSql, (err, item_res)=>{
            if(err) throw err;
            res.render('lc_update_success', { deliveryId: deliveryId });
        })
    })
})


app.listen(4000, ()=>{
    console.log('listening port 4000')
});