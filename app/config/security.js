const jsonwebtoken = require('jsonwebtoken');
const jwt = require('./JWT');
const db = require('../config/mysql');

// Create a token
let createAccessToken = function (user) {
    return new Promise(function (resolve, reject) {
        jsonwebtoken.sign({ data: user }, jwt.ACCESS_TOKEN, {
            algorithm: 'HS256',
            expiresIn: jwt.ACCESS_TOKEN_LIFETIME,
        },
            function (err, newToken) {
                if (err) {
                    return reject(err);
                } else {
                    return resolve(newToken);
                }
            }
        );
    });
};
//////////////////////////////////////////////////////
let checkAccessToken = function (token) {
    return new Promise(function (resolve, reject) {
        jsonwebtoken.verify(token, jwt.ACCESS_TOKEN,
            function (err, decoded) {
                if (err) {
                    return reject(err);
                } else {
                    return resolve(decoded);
                }
            }
        );
    });
};
////////////////////////////////////////////////////
let createRefreshToken = function (user) {
    return new Promise(function (resolve, reject) {
        jsonwebtoken.sign({ data: user }, jwt.REFRESH_TOKEN, {
            algorithm: 'HS256',
            expiresIn: jwt.REFRESH_TOKEN_LIFETIME,
        },
            function (err, newToken) {
                if (err) {
                    return reject(err);
                } else {
                    db.query("UPDATE users SET RefreshToken=? WHERE UserID =?", [newToken, user.UserID]);
                    return resolve(newToken);
                }
            }
        );
    });
};
/////////////////////////////////////////////
let checkRefreshToken = function (token) {
    return new Promise(function (resolve, reject) {
        jsonwebtoken.verify(token, jwt.REFRESH_TOKEN,
            function (err, decoded) {
                if (err) {
                    return reject(err);
                } else {
                    db.query("SELECT * FROM users WHERE UserID = ? AND RefreshToken=?", [decoded.data.UserID,token], function (err, user) {
                        if (err || user.length == 0){
                            db.query("UPDATE users SET RefreshToken = NULL WHERE UserID =?",[decoded.data.UserID])
                            return reject("Không tồn tại refresh token trong database, vui lòng đăng nhập lại")
                        }
                        else
                            return resolve(decoded);
                    });
                }
            }
        );
    });
};
//////////////////////////////////////////////////////////
let refreshAccessToken = async function (refreshToken) {
    const user = await checkRefreshToken(refreshToken);
    const accessToken = createAccessToken(user);
    return accessToken;
}


module.exports = {
    createAccessToken: createAccessToken,
    refreshAccessToken: refreshAccessToken,
    createRefreshToken: createRefreshToken,
    checkAccessToken: checkAccessToken,
    checkRefreshToken:checkRefreshToken,
}