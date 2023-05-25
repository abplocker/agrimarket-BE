const db = require('../config/mysql');
const Order = {}
Order.add = function (data, result) {
    db.query("INSERT INTO orders SET ?", data, function (err, results) {
        if (err) {
            result(err);
        } else {
            result(results);
        }
    });
}
Order.addOrderDetail = function (data, result) {
    db.query("INSERT INTO orderdetail SET ?", data, function (err, results) {
        if (err) {
            result(err);
        } else {
            result(results);
        }
    });
}

Order.getUserOrders = function (id, result) {
    const query = `
      SELECT orders.OrderID, orders.Status, orderdetail.*, product.ProductImageDefault, product.ProductName
      FROM orders
      INNER JOIN orderdetail ON orders.OrderID = orderdetail.OrderID
      INNER JOIN product ON orderdetail.ProductID = product.ProductID
      WHERE orders.UserID = ?
    `;
    db.query(query, id, function (err, results) {
        if (err || results.length == 0)
            result(err);
        else
            result(results);
    });
};
Order.getSellOrders = function (id, result) {
    const query = `
        SELECT orders.OrderID, orders.Status, orderdetail.*, product.ProductImageDefault,product.ProductName
        FROM orders
        INNER JOIN orderdetail ON orders.OrderID = orderdetail.OrderID
        INNER JOIN product ON orderdetail.ProductID = product.ProductID
        WHERE product.UserID = ?
    `;
    db.query(query, id, function (err, results) {
        if (err || results.length == 0)
            result(err);
        else
            result(results);
    });
};
module.exports = Order;