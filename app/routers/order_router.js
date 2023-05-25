module.exports = function (router) {

	var orderController = require('../controllers/order_controller');

    router.post('/order/add', orderController.create);

    router.post('/order/addDetail', orderController.addOrderDetail);

    router.get('/order', orderController.getUserOrders);

}
