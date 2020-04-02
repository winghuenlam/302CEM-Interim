//https://github.com/LintangWisesa/React_RNative_Express_MySQL/blob/master/Express_Backend/app.js
//command: node department_store_server.js

const express = require('express');
const app = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
const axios = require('axios');
const fs = require('fs')
var parse = require('csv-parse');
var path = require('path');
app.use(bodyParser.urlencoded());

app.use(bodyParser.json());
app.use(cors());
app.set('view engine', 'ejs');

var multer  = require('multer');
const upload = multer({ dest: 'tmp/csv/' });

const ds_db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'depaertment_store_302'
});

ds_db.connect();

app.get('/login', function(req,res){
    res.sendFile(path.join(__dirname + '/login.html'));
})

app.get('/login/submit', function(req,res){
    var username = req.query.username
    var pw = req.query.pw
    if (username!=='admin' || pw !== 'admin'){
        res.render('login_fail');
    }else{
        res.redirect('/');
    }
})

app.get('/', function(req,res){
    res.sendFile(path.join(__dirname + '/index.html'));
})

app.get('/ds/upload', function(req,res){
    res.sendFile(path.join(__dirname + '/ds_upload.html'));
})

app.post('/ds/input-order', upload.single('csvfile'), function(req,res){
    // console.log(req.body)
    var csvfile = req.file
    const csvPromise = new Promise((resolve, reject) => {
        fs.readFile(csvfile.path, (err, fileData) => {
            parse(fileData, {}, function(err, rows) {
            resolve(rows) ;
            });
        });
    })

    csvPromise.then(function (data) {
        var orderId = null;
        var json = {Order:{order_item:[]},
                    Customer:{}
                };
        var order = new Promise((resolve, reject) => {
            var orderSql = `INSERT INTO orders (customer_id, delivery_method, cash_on_delivery) VALUES (${data[1][0]}, '${data[1][1]}', '${data[1][2]}');`;
            ds_db.query(orderSql, (err, result)=>{
                if(err) throw err;
                orderId = result['insertId']
                data.forEach((line, i) => {
                    if(i>0){
                        var productId = line[3];
                        var qty = line[4];
                        
                        ds_db.query(`SELECT price FROM product WHERE id = ${productId};`, (err, result)=>{
                            if(err) throw err;
                            var price = result[0]['price']
                            var productSql = `INSERT INTO order_product (order_id, product_id, quantity, price) VALUES (${orderId}, ${productId}, ${qty}, ${price*qty});`;
                            
                            ds_db.query(productSql, (err, result)=>{
                                if(err) throw err;
                                resolve(orderId)
                                
                            });
                        });
                    }
                }); 
            });
        });

        order.then(function (orderId) {
            var infoSql = `SELECT c.id AS c_id, c.name AS c_name, c.contact_no, c.address, 
            o.id AS o_id, o.order_date, o.delivery_method, o.cash_on_delivery FROM customer c, orders o
            where c.id = o.customer_id and o.id = ${orderId};`
            ds_db.query(infoSql, (err, result)=>{
                if(err) throw err;
                json['Order']['order_no'] = result[0]['o_id']
                json['Order']['order_date'] = result[0]['order_date']
                json['Order']['delivery_method'] = result[0]['delivery_method']
                json['Order']['cash_on_delivery'] = result[0]['cash_on_delivery']
                json['Customer']['customer_no'] = result[0]['c_id']
                json['Customer']['customer_name'] = result[0]['c_name']
                json['Customer']['contact_no'] = result[0]['contact_no']
                json['Customer']['address'] = result[0]['address']
                
                var itemSql = `SELECT p.id AS code, p.name, o.quantity, o.price FROM order_product o, product p
                where o.product_id=p.id and o.order_id = ${orderId};`
                ds_db.query(itemSql, (err, result)=>{
                    if(err) throw err;
                    var results = JSON.parse(JSON.stringify(result));
                    json['Order']['order_item'] = results;

                    axios.post(`http://localhost:4000/lc/input-order`,json,{
                    headers: {
                        'Content-Type': 'application/json'
                    }
                    }).then((response)=> {
                        if (response['data']['success']==true){
                            var updateIdSql = `UPDATE orders SET lc_delivery_id = ${response['data']['delivery_id']} 
                                                WHERE id=${json['Order']['order_no']}`
                            ds_db.query(updateIdSql, (err, result)=>{
                                if(err) throw err;
                            })

                            var totalPrice = 0
                            json['Order']['order_item'].map((v,i) => {
                                totalPrice += v['price']
                            })

                        }else{
                            var html = `Unsuccessful.`
                        }
                        res.render('ds_upload_success', { json: json, response:response, totalPrice:totalPrice });

                    }).catch((error)=> {
                        console.log(error);
                    });
                    
                })
            });
        }).then(function () {
        })
      })
    
});


app.get('/ds/search', function(req,res){
    res.sendFile(path.join(__dirname + '/ds_search.html'));
})

app.get('/ds/search/submit', function(req,res){
    var orderId = req.query.orderid
    console.log(orderId)
    var infoSql = `SELECT c.id AS c_id, c.name AS c_name, o.id AS o_id, o.order_date, o.lc_delivery_id FROM customer c, orders o
                    where c.id = o.customer_id and o.id = ${orderId};`
    var itemSql = `SELECT p.id AS code, p.name, o.quantity, o.price FROM order_product o, product p
                    where o.product_id=p.id and o.order_id = ${orderId};`
    ds_db.query(infoSql, (err, c_res)=>{
        if(err) throw err;
        var c_result = c_res[0]
        if(c_result){
            ds_db.query(itemSql, (err, i_res)=>{
            if(err) throw err;
            var itemsTableHtml = ''
            var totalPrice = 0
            i_res.map((v,i) => {
                totalPrice += v['price']
                itemsTableHtml += 
                    `<tr>
                        <td>${v['name']}</td>
                        <td style="text-align:center">${v['quantity']}</td>
                        <td style="text-align:center">${v['price']}</td>
                    </tr>`
            })

            var html = `
            <h2>Order ID: ${orderId}</h2>
            <p>Delivery ID: ${c_result['lc_delivery_id']}</p>
            <p>Customer: ${c_result['c_name']} (ID: ${c_result['c_id']})</p>
            <p>Order date: ${c_result['order_date']}</p> <br/>
            <h4>Ordered Items</h4>
            <table>
                <tr>
                    <th style="width:200px; text-align:left;">Item</th>
                    <th style="width:100px; text-align:center">Quantity</th>
                    <th style="width:100px; text-align:center">Price</th>
                </tr>
                ${itemsTableHtml}
                <tr>
                    <th></th>
                    <th style="text-align:right">Total Price</th>
                    <th>${totalPrice}</th>
                </tr>
            </table>
            `
        
            // res.set('Content-Type', 'text/html');
            console.log(c_result)
            // res.send(new Buffer(html));
            res.render('ds_search_result', { info:c_result, item:i_res, totalPrice:totalPrice, orderId:orderId });
        })
        }else{
            res.send('No Record');
        }

    })
})

app.listen(3000, ()=>{
    console.log('listening port 3000')
});