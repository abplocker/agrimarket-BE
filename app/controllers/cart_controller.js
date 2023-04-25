var Cart = require('../models/cart_model');
var JWT = require('../config/security');

exports.getByUserId = function (req, res) {
    var token = req.get("Authorization");
    JWT.checkToken(token)
        .then(result => {
            Cart.getByUserId(result.data.UserID, function (data) {
                res.send({ result: data });
            });
        });
}

exports.addCartItem = function (req, res) {
    Cart.addCartItem(req.body, function (data) {
        res.send({ result: data });
    });
}
// Not done yet
exports.addOneCartItem = function (req, res) {
    Cart.addOneCartItem(req.body, function (data) {
        res.send({ result: data });
    });
}


exports.changeQuantity = function (req, res) {
    Cart.changeQuantity(req.body, function (data) {
        if (data == null)
            res.status(400).send("Sản phẩm không tồn tại");
        else
            res.status(200).send({ result: data });
    });
}

exports.remove = function (req, res) {
    Cart.detele(req.body, function (data) {
        if (data == null)
            res.status(400).send("Sản phẩm không tồn tại");
        else
            res.status(200).send(data);
    });
}
exports.update_info = function (req, res) {
    Cart.update_info(req.body, function (data) {
        res.send({ result: data });
    });
}


