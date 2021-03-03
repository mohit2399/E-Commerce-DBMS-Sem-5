const express = require('express');
// const mysql = require('mysql');
const connection = require('./dbconfig');
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const path  = require('path');

const userRoutes = require('./Routes');
const app = express();


app.set('view engine', 'ejs');
app.set('base', __dirname);

// app.use(cookieParser);
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());
app.use(userRoutes);

connection.connect(function(err){
    if(err) throw err;
    app.listen(8080);
    console.log('Database connected');
})