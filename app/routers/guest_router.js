module.exports = function (router) {
	var JWT = require('../config/security');
// Test jwt
	router.get('/token', async function (req, res){
		const token = await JWT.createToken(req.body);
		res.send({token: token})
	});

	router.get('/check_token', async function (req, res){
		try {
		const check = await JWT.checkToken(req.headers.authorization);
		res.send({check: check})
		} catch (error) {
            res.send({error: error})
        }
	});
};