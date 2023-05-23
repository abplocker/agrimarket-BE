var Favorite = require('../models/favorite_model');
var JWT = require('../config/security');

exports.get_all = function (req, res) {
  var token = req.get("Authorization");
  JWT.checkAccessToken(token)
    .then(result => {
      Favorite.get_all(result.data.UserID, function (data) {
        res.send({ result: data });
      });
    });
}
exports.add = function (req, res) {
	Favorite.add(req.body, function (data) {
        if(data)
        res.status(200).send({result:data})
        else
        res.status(400).send({result:data})
    });
}
exports.remove = function (req, res) {
	Favorite.remove(req.body, function (data) {
        if(data)
        res.status(200).send({result:data})
        else
        res.status(400).send({result:data})
    });
}