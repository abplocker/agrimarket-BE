const db = require('../config/mysql');
const Order = {}
Order.add = function (data,result) {
    db.query("INSERT INTO orders SET ?", data, function (err, results) {
        if (err) {
            result(err);
        } else {
            result(results);
        }
    });
}
Order.addOrderDetail = function (data,result) {
    db.query("INSERT INTO orderdetail SET ?", data, function (err, results) {
        if (err) {
            result(err);
        } else {
            result(results);
        }
    });
}
Order.getByUserID = function (id,result) {
    db.query("SELECT * FROM post WHERE PostId = ?",postId,function(err,post){
        if (err || post.length == 0)
            result (err);
        else
            result(post[0]);
    });
}
module.exports = Order;