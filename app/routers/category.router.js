module.exports = function (router) {

	var categoryRouter = require('../controllers/category.controller');

	router.get('/category/all', categoryRouter.get_all);

	router.post('/category/add', categoryRouter.create);

	router.delete('/category/remove', categoryRouter.remove);

	router.put('/category/update_info',categoryRouter.update_info);
};