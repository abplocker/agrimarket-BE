module.exports = function (router) {

	var cartRouter = require('../controllers/cart_controller');

	router.get('/cart/:userID', cartRouter.getByUserId);

	router.post('/cart/add', cartRouter.addCartItem);

    router.post('/cart/add1', cartRouter.addOneCartItem);

	router.put('/cart/changeQuantity', cartRouter.changeQuantity);

	router.delete('/cart/remove', cartRouter.remove);

	router.put('/cart/update_info',cartRouter.update_info);
};