var Product = require('../models/product_model');
var Image = require('../models/image_model');
var JWT = require('../config/security');

exports.getByProductId = function (req, res) {
  Product.getBySellerId(req.headers.seller, function (data) {
    res.send({ result: data });
  });
}
