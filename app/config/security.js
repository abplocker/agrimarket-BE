const jsonwebtoken = require('jsonwebtoken');
const jwt = require('./JWT');
// Create a token
let createToken = function (user) {
    return new Promise(function (resolve, reject) {
        jsonwebtoken.sign({ data: user }, jwt.ACCESS_TOKEN,{
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

let checkToken = function (token) {
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

module.exports = {
    createToken:createToken,
    checkToken:checkToken,
}