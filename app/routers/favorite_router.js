module.exports = function (router) {

	var favoriteController = require('../controllers/favorite_controller');

	router.post('/favorite/add', favoriteController.add);

	router.delete('/favorite/remove', favoriteController.remove);
	
};