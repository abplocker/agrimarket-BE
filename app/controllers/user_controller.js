var User = require('../models/user_model');
var Address = require('../models/address_model');
var JWT = require('../config/security');
exports.get_all = function (req, res) {
	User.get_all(function (data) {
		res.send({ result: data });
	});
}

exports.getById = async (req, res) => {
	const userId = req.params.id;
	try {
		const [user, address] = await Promise.all([
			new Promise((resolve, reject) => {
				User.getById(userId, (user) => {
					resolve(user);
				});
			}),
			new Promise((resolve, reject) => {
				Address.getByUserId(userId, (address) => {
					resolve(address);
				});
			}),
		]);
		if (user && address) {
			res.send({ user, address });
		}
		else {
			res.status(404).send({ message: 'User not found' });
		}
	} catch (err) {
		console.error(err);
		res.status(500).send('Server Error');
	}
};

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
exports.update_info = function (req, res) {
	User.update_info(req.body, function (data) {
		res.send({ result: data });
	});
}
exports.login = function (req, res) {
	User.check_login(req.body, async function (user) {
		if (user) {
			const token = await JWT.createToken(user)
			res.send(token);
		}
		else {
			res.status(401).send({ message: 'Login failed' });
		}
	});
}