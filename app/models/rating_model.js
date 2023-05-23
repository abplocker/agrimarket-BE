const db = require('../config/mysql');
Rating.get_all = function (result) {
    db.query("SELECT * FROM product ORDER BY ProductUpdatedAt DESC, ProductCreatedAt DESC", function (err, product) {
        if (err)
            result (err.sqlMessage);
        else{
            result(product);
        }
    });
}
module.exports = Rating;