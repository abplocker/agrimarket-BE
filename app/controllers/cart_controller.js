var Cart = require('../models/cart_model');

exports.getByUserId = function (req, res) {
	Cart.getByUserId(req.params.userID, function (data) {
        res.send({ result: data });
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
    Cart.changeQuantity(req.body,function (data) {
        res.send({ result: data });
    });
}

exports.remove = function (req, res) {
	Cart.detele(req.body, function (data) {
		res.send({ result: data });
	});
}
exports.update_info = function (req,res){
	Cart.update_info(req.body, function (data) {
        res.send({ result: data });
    });
}


