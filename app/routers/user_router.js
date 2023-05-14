module.exports = function (router) {

	var userController = require('../controllers/user_controller');

	// var JWT = require('../config/security');

	router.get('/user/all', userController.get_all);

	router.get('/user/:id', userController.getById);

	router.post('/user/add', userController.createUser);

	router.delete('/user/remove', userController.remove);

	router.put('/user/update_info',userController.update_info);
	
};