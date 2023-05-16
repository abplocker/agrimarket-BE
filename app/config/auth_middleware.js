var jwt = require('../config/security');
let isAuth = async function(req, res, next) {
    var token = req.headers.authorization;
    if (token) {
        try {
            var authData = await jwt.checkAccessToken(token);
            req.auth = authData;
            next();
        } catch (error) {
            return res.status(401).send({Message:"Invalid token",Error: error})
        }
    }
    else{
        return res.status(401).send("Need a token");
    }
}

/////////////////////////////

module.exports = {
    isAuth:isAuth,
};