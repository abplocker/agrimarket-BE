const db = require('../config/mysql');
const Category = function (category) {
    this.CategoryId = category.CategoryId;
    this.CategoryName = category.CategoryName;
    this.CategorySlug = category.CategorySlug;
    this.CategoryIcon = category.CatergoryIcon;
    this.CategoryActive = category.CategoryActive;
    this.CategoryCreatedAt = category.CategoryCreatedAt;
    this.CategoryUpdatedAt = category.CategoryUpdatedAt;
    this.UserId = category.UserId;
}

Category.get_all = function (result) {
    db.query("SELECT * FROM category", function (err, category) {
        if (err)
            result (err.sqlMessage);
        else
            result(category);
    });

}

Category.create = function (data, result) {
    db.query("INSERT INTO category SET ?", data, function (err, category) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: category.CategoryID,...data });
    });
}

Category.detele = function (data, result) {
    db.query("DELETE FROM category WHERE CategoryId =?", data.CategoryID, function (err) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result("Đã xoá thành công");
    });
}

Category.update_info = function (data, result) {
    db.query("UPDATE category SET CategoryName =?, CategorySlug =?, CategoryIcon=?, CategoryUpdatedAt=? WHERE CategoryId =?", 
    [data.CategoryName,data.CategorySlug,data.CategoryIcon,data.CategoryUpdatedAt,data.CategoryID], function (err, category) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: category.CategoryID, ...data });
    });
}
module.exports = Category;