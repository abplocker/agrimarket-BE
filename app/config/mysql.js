// Thay đổi với mỗi máy
var mysql = require('mysql2');
var connectionMySql = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "quangthien",
    database: "agrimarket"
});
connectionMySql.connect(function (err) {
    if (err) throw err;
});
module.exports = connectionMySql;