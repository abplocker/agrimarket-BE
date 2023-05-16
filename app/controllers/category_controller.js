var Category = require('../models/category_model');
exports.get_all = function (req, res) {
	Category.get_all(function (data) {
		res.send({ result: data });
	});
}

//

exports.create = function (req, res) {
	Category.create(req.body, function (data) {
        res.send({ result: data });
    });
}

//

exports.remove = function (req, res) {
	Category.detele(req.body, function (data) {
		res.send({ result: data });
	});
}

//

exports.update_info = function (req,res){
	Category.update_info(req.body, function (data) {
        res.send({ result: data });
    });
}


