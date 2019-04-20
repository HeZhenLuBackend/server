const mysql = require('../middleware/mysql');
const date_parser = require('../middleware/date_parser');

module.exports = async (ctx) =>{
    const passageID = ctx.request.body.passageID;

    let comments = await mysql('comment').where({'aid': passageID})
        .select({passageID: 'aid'}, {commentID: 'cid'}, {fatherCommentID: 'parent_cid'}, {user: 'uid'}, {fatherUser: 'parent_uid'}, {content: 'content'},
            {time: 'create_time'});

    for (let i=0; i<comments.length; i++) {
        comments[i].user = (await mysql('user').where({'uid': comments[i].user}).select({email: 'email'}, {nickname: 'nickname'}))[0];
        comments[i].fatherUser = (await mysql('user').where({'uid': comments[i].fatherUser}).select({email: 'email'}, {nickname: 'nickname'}))[0];
        comments[i].time = date_parser(comments[i].time);
    }

    ctx.body = comments;
};
