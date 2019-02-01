const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{

    const aid = ctx.request.body.id;

    try {
        await mysql('article')
            .where({aid: aid})
            .del();
    } catch (e) {
        ctx.body = {
            code: 0,
            msg: e.sqlMessage
        };
        return;
    }

    ctx.body = {
        code: 1,
        msg: '成功'
    };

};
