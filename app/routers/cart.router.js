module.exports = function (router) {

	var cartRouter = require('../controllers/cart.controller');

	router.get('/cart/:UserID', cartRouter.get_all);

	router.post('/cart/add', cartRouter.addCartItem);

    router.post('/cart/add', cartRouter.addOneCartItem);

	router.delete('/cart/remove', cartRouter.remove);

	router.put('/cart/update_info',cartRouter.update_info);
};