module.exports = function (router) {

	var productRouter = require('../controllers/product_controller');

	router.get('/product/all', productRouter.get_all);

	router.get('/product/category/:id', productRouter.getByCategoryId);

	router.get('/seller/product', productRouter.getBySellerId);

    router.get('/product/detail/:id', productRouter.getDetail);

	router.post('/product/add', productRouter.create);

	router.delete('/product/remove', productRouter.remove);

	router.put('/product/update_info',productRouter.update_info);

	router.put('/product/change_active',productRouter.changeActive);

	router.get('/product/search', productRouter.search);
};