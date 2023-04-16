module.exports = function (router) {

	var userController = require('../controllers/user_controller');

	var JWT = require('../config/security');

	router.get('/user/all', userController.get_all);

	router.get('/user/:id', userController.getById);

	router.post('/user/add', userController.createUser);

	router.delete('/user/remove', userController.remove);

	router.put('/user/update_info',userController.update_info);
	
	// Test jwt
	router.get('/token', async function (req, res){
		const token = await JWT.createToken(req.body);
		res.send({token: token})
	});

	router.get('/check_token', async function (req, res){
		try {
		const check = await JWT.checkToken(req.body);
		res.send({check: check})
		} catch (error) {
            res.send({error: error})
        }
	});
};