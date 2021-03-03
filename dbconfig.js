const mysql = require('mysql')
var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database:"dbms_project"
});

module.exports = connection;
