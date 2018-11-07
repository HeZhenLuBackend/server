const token_verify = require('../middleware/token_verify');

module.exports = async (ctx) => {

    ctx.body = {
        msg: 'userInfo'
    }
/*
    const token = ctx.header.authorization;

    if (token) {
        // 解密，获取payload
        let payload = await token_verify(token);
        ctx.body = {
            user_info: payload
        }
    } else {
        ctx.body = {
            message: ctx,
            code: -1
        }
    }
*/

};
