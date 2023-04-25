var Product = require('../models/product_model');
var Image = require('../models/image_model');
var JWT = require('../config/security');

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
  var token = req.get("Authorization");
  JWT.checkToken(token)
    .then(result => {
      if (result.data.UserID == req.body.UserID && result.data.Role == 2)
        Product.create(req.body, function (data) {
          res.send({ result: data });
        });
      else
        res.status(401).send(result.data.UserID, req.body.UserID, result.data.Role);
    });
}

exports.remove = function (req, res) {
  Product.detele(req.body, function (data) {
    res.send({ result: data });
  });
}

exports.update_info = function (req, res) {
  var token = req.get("Authorization");
  JWT.checkToken(token)
    .then(result => {
      if (result.data.UserID == req.body.UserID && result.data.Role == 2)
        Product.update_info(req.body, function (data) {
          if (data)
            res.send({ result: data });
          else
            res.status(401).send("Cập nhật thất bại");
        });
      else
        res.status(401).send(result.data.UserID, req.body.UserID, result.data.Role);
    });
}
exports.search = function (req, res) {
  const searchData = req.query.ProductName;
  Product.search(searchData, function (data) {
    res.send({ result: data });
  });
}

