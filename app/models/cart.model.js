const db = require('../mysql');
const CartItem = function (cartitem) {
    this.CartItemId = cartitem.CartItemId;
    this.UserId = cartitem.UserId;
    this.ProductId = cartitem.ProductId;
    this.Quantity = cartitem.Quantity;
    this.SumPrice = cartitem.SumPrice;
}

CartItem.getByUserId = function (id, result) {
    db.query("SELECT * FROM cartitem WHERE UserId = ?", id, function (err, cartitem) {
        if (err || cartitem.length == 0)
            throw err;
        else
            result(cartitem);
    });
}

CartItem.addCartItem = function (data, result) {
    db.query("INSERT INTO cartitem SET ?", data, function (err, cartitem) {
        if (err) {
            throw err;
        }
        else
            result({ id: cartitem.CartID,...data });
    });
}
// Add 1 similar product in cart so use PUT in controller b/c just update quantity cartitem
/*
    {
        "ProductId": "",
        "Quantity": "",
        "ProductPrice": ""
    }
*/
// Cần xem lại
CartItem.addOneCartItem = function (data, result){
    db.query("UPDATE cartitem SET Quantity = Quantity + 1, SumPrice = ? WHERE ProductID =?" 
    ,[data.ProductPrice * data.Quantity,data.ProductId]
    ,function (err, cartitem) {
        if (err) {
            throw err;
        }
        else
            result({ id: cartitem.CartID,...data });
    });
}

CartItem.detele = function (data, result) {
    db.query("DELETE FROM cartitem WHERE CartId =?", data.CartID, function (err) {
        if (err) {
            throw err;
        }
        else
            result("Đã xoá thành công");
    });
}

CartItem.update_info = function (data, result) {
    db.query("UPDATE cartitem SET FullName =?, Email =?, Phone=?, Avatar=? WHERE CartId =?", 
    [data.FullName,data.Email,data.Phone,data.Avatar,data.CartID], function (err, cartitem) {
        if (err) {
            throw err;
        }
        else
            result({ id: cartitem.CartID, ...data });
    });
}
module.exports = CartItem;