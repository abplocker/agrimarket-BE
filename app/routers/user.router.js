module.exports = function (router) {

	var userController = require('../controllers/user.controller');

	router.get('/user/all', userController.get_all);

	router.get('/user/:id', userController.getById);

	router.post('/user/add', userController.createUser);

	router.delete('/user/remove', userController.remove);

	router.put('/user/update_info',userController.update_info);
	
};