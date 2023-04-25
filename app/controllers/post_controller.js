var Post = require('../models/post_model');

exports.get_all = function (req, res) {
	Post.getAll(function (data) {
		res.send({ result: data });
	});
}
exports.getByPostId = (req, res) => {
	const postId = req.params.postId;
    Post.getByPostId(postId,function(data){
        res.send({ result: data });
    });
}