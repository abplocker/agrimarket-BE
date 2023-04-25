module.exports = function (router) {

	var postController = require('../controllers/post_controller');

    router.get('/post/all', postController.get_all);

	router.get('/post/:postId', postController.getByPostId);

	// router.post('/post/add', postController.createPost);

	// router.delete('/post/remove', postController.remove);

	// router.put('/post/update_info',postController.update_info);
}
