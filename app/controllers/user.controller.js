var User = require('../models/user.model');
var Address = require('../models/address.model');

exports.get_all = function (req, res) {
	User.get_all(function (data) {
		res.send({ result: data });
	});
}

exports.getById = function (req, res) {
	User.getById(req.params.id, function (data) {
        res.send({ user: data });
    });
	Address.getByUserId(req.params.id, function (data) {
        res.send({ address: data });
    });
}

exports.createUser = function (req, res) {
	User.create(req.body, function (data) {
        res.send({ result: data });
    });
}

exports.remove = function (req, res) {
	User.detele(req.body, function (data) {
		res.send({ result: data });
	});
}
exports.update_info = function (req,res){
	User.update_info(req.body, function (data) {
        res.send({ result: data });
    });
}


