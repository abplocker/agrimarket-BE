const db = require('../config/mysql');
const Favorite = {}
Favorite.get_all = function (id, result) {
    db.query("SELECT * FROM favorite Where UserID =?", id, function (err, favorite) {
        if (err)
            result (null);
        else{
            result(favorite);
        }
    });
}
Favorite.add = function (data, result) {
    db.query("INSERT INTO favorite SET", data, function (err, favorite) {
        if (err)
            result (null);
        else{
            result("Thêm thành công");
        }
    });
}
Favorite.remove = function (data, result) {
    db.query("DELETE FROM favorite Where UserID =? AND ProductID = ?", [data.UserID,data.ProductID], function (err, favorite) {
        if (err)
            result (null);
        else{
            result("Đã xoá thành công");
        }
    });
}
module.exports = Favorite;