//command: node logistics_company_server.js

const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
// const fs = require('fs')
// var parse = require('csv-parse');

app.use(bodyParser.json());
app.use(cors());

const lc_db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'logistics_302'
});

lc_db.connect();

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


app.listen(4000, ()=>{
    console.log('listening port 4000')
});