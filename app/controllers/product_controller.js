var Product = require('../models/product_model');
var Image = require('../models/image_model');

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

exports.getDetail = async function (req, res) {
    try {
      const [product, images] = await Promise.all([
        new Promise((resolve, reject) => {
          Product.getDetail(req.params.id, resolve);
        }),
        new Promise((resolve, reject) => {
          Image.getByProductId(req.params.id, resolve);
        })
      ]);
      res.send({ product: product, images: images });
    } catch (err) {
      res.status(500).send({ error: err });
    }
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
exports.search = function (req, res) {
  Product.search(req.body, function (data) {
        res.send({ result: data });
    });
}

