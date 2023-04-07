var Product = require('../models/product.model');
var Image = require('../models/image.model');

exports.get_all = function (req, res) {
	Product.get_all(function (data) {
		res.send({ result: data });
	});
}

exports.getByCategoryId = function (req, res) {
	Product.getByCategoryId(req.params.id, function (data) {
        res.send({ result: data });
    });
}

exports.getDetail = function (req, res) {
    Product.getDetail(req.params.id, function (data) {
        res.send({ product: data });
    });
    Image.getByProductId(req.params.id, function (data) {
        res.send({ images: data });
    });
}

exports.create = function (req, res) {
	Product.create(req.body, function (data) {
        res.send({ result: data });
    });
}

exports.remove = function (req, res) {
	Product.detele(req.body, function (data) {
		res.send({ result: data });
	});
}
exports.update_info = function (req,res){
	Product.update_info(req.body, function (data) {
        res.send({ result: data });
    });
}


