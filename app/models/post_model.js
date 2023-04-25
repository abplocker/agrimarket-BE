const db = require('../config/mysql');
const Post = function (post) {
    this.PostId = post.postId;
    this.Title = post.title;
    this.Content = post.content;
    this.Published_date = post.published_date;
    this.Author = post.author;
}
Post.getAll = function (result){
    db.query("SELECT * FROM post",function(err,post){
        if (err)
            result(err);
        else
            result(post);
    });
}
Post.getByPostId = function (postId,result) {
    db.query("SELECT * FROM post WHERE PostId = ?",postId,function(err,post){
        if (err || post.length == 0)
            result (err);
        else
            result(post[0]);
    });
}
module.exports = Post;