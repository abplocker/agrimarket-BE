const db = require('../config/mysql');
const CartItem = function (cartitem) {
    this.CartItemID = cartitem.CartItemID;
    this.UserId = cartitem.UserId;
    this.ProductId = cartitem.ProductId;
    this.Quantity = cartitem.Quantity;
    this.SumPrice = cartitem.SumPrice;
}

CartItem.getByUserId = function (id, result) {
    db.query("SELECT * FROM cartitem WHERE UserId = ?", id, function (err, cartitem) {
        if (err || cartitem.length == 0){
            console.log(err);
            result (err);
        }
        else
            result(cartitem);
    });
}

CartItem.addCartItem = function (data, result) {
    db.query("INSERT INTO cartitem SET ?", data, function (err, cartitem) {
        if (err) {
            result (err.sqlMessage);
        }
        else
            result({ id: cartitem.CartID, ...data });
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
// ---------------------------------Cần xem lại---------------------------------------
CartItem.addOneCartItem = function (data, result) {
    db.query("UPDATE cartitem SET Quantity = Quantity + 1, SumPrice = ? WHERE ProductID =?"
        , [data.ProductPrice * data.Quantity, data.ProductId]
        , function (err, cartitem) {
            if (err) {
                result (err.sqlMessage);
            }
            else
                result({ id: cartitem.CartID, ...data });
        });
}
//-------------------------------------------------------------------------------------


// Thay đổi giá trị số lượng
/*
    TH1: User click tăng 1. Gọi script, truyền change_amount = quantity + 1
    TH2: User click giảm 1. Gọi script, truyền change_amount = quantity - 1
    TH3: User sửa trực tiếp số lượng. Gọi script, truyền change_amount = số lượng user nhập

    Thực thi lệnh UPDATE, gọi đến trigger update_amount
*/  

CartItem.changeQuantity = function (data, result) {
    db.query("UPDATE cartitem SET Quantity =? WHERE CartItemID =?"
        , [data.ChangeAmount,data.CartItemID]
        , function (err, cartitem) {
            if (err || cartitem.affectedRows == 0) {
                result(cartitem);
            }
            else
                result({ id: cartitem.CartItemID, ...data });
        });
}

CartItem.detele = function (data, result) {
    db.query("DELETE FROM cartitem WHERE CartItemID =?", data.CartItemID, function (err,cartitem) {
        if (err || cartitem.affectedRows == 0) {
            result(null);
        }
        else
            result("Đã xoá thành công");
    });
}

// CartItem.update_info = function (data, result) {
//     db.query("UPDATE cartitem SET FullName =?, Email =?, Phone=?, Avatar=? WHERE CartId =?",
//         [data.FullName, data.Email, data.Phone, data.Avatar, data.CartID], function (err, cartitem) {
//             if (err) {
//                 result (err.sqlMessage);
//             }
//             else
//                 result({ id: cartitem.CartID, ...data });
//         });
// }
// CartItem.checkUser = function(data,result){
//     db.query("SELECT * FROM cartitem WHERE UserId = ?", id, function (err, cartitem) {
//         if (err || cartitem.length == 0){
//             console.log(err);
//             result (err);
//         }
//         else
//             result(cartitem);
//     });
// }
module.exports = CartItem;