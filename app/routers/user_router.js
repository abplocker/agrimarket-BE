module.exports = function (router) {

	var userController = require('../controllers/user_controller');
	var favoriteController = require('../controllers/favorite_controller');


	// var JWT = require('../config/security');

	router.get('/user/all', userController.get_all);

	router.get('/user', userController.getById);

	router.post('/user/add', userController.createUser);

	router.delete('/user/remove', userController.remove);

	router.put('/user/update_info',userController.update_info);

	router.get('/favorite',favoriteController.get_all);
	
};