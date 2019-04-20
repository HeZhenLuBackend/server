const mysql = require('../middleware/mysql');

module.exports = async (ctx) => {
    const passageID = ctx.request.body.passageID,
          fatherCommentID = ctx.request.body.fatherCommentID,
          user = ctx.request.body.user,
          fatherUser = ctx.request.body.fatherUser,
          content = ctx.request.body.content;

    await mysql('comment')
        .insert({
            parent_cid: fatherCommentID,
            aid: passageID,
            uid: user,
            parent_uid: fatherUser,
            content: content
        });

    ctx.body = {
        code: 1,
        msg: '成功'
    };
};
