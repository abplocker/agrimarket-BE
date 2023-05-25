var Order = require('../models/order_model');
var JWT = require('../config/security');

exports.create = function (req, res) {
    Order.add(req.body, function (data) {
        if (data)
            res.status(200).send({ result: data })
        else
            res.status(400).send({ result: data })
    });
}
exports.addOrderDetail = function (req, res) {
    Order.addOrderDetail(req.body, function (data) {
        if (data)
            res.status(200).send({ result: data })
        else
            res.status(400).send({ result: data })
    });
}
exports.getUserOrders = function (req, res) {
    var token = req.get("Authorization");
    JWT.checkAccessToken(token)
        .then(result => {
            Order.getUserOrders(result.data.UserID, function (data) {
                if (data)
                    res.status(200).send({ result: data })
                else
                    res.status(400).send({ result: data })
            });
        });
}