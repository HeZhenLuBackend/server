const mysql = require('../middleware/mysql');
const jwt = require('jsonwebtoken');
const config = require('../config');

module.exports = async (ctx) => {

    const email = ctx.request.body.email,
          password = ctx.request.body.password;

    if (!email || !password) {
        ctx.body = {
            code: -3,
            msg: '缺少表单信息'
        };
        return;
    }

    const results = await mysql('user').select('uid', 'nickname').where({
        email: email,
        password: password
    });


    if (results.length === 0) {
        ctx.body = {
            code: -1,
            msg: '密码错误或用户不存在'
        };
        return;
    }

    let userInfo = {
        uid: results[0].uid,
        nickname: results[0].nickname
    };

    const token = jwt.sign(userInfo, config.token.secret, {expiresIn: '6h'});


    if (email === 'njuhzl18') {
        ctx.body = {
            code: 2,
            msg: '管理员登录成功',
            token
        };
        return;
    }

    ctx.body = {
        code: 1,
        msg: '登录成功',
        token
    }

};
