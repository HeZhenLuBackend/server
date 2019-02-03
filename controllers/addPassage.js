const mysql = require('../middleware/mysql');

module.exports = async (ctx) => {

    const title = ctx.request.body.title,
          abstract = ctx.request.body.abstract,
          content = ctx.request.body.content,
          keyword1 = ctx.request.body.keyword1,
          keyword2 = ctx.request.body.keyword2,
          keyword3 = ctx.request.body.keyword3,
          type = ctx.request.body.type,
          newsSource = ctx.request.body.newsSource,
          picUrls = ctx.request.body.picUrls;

    //检查表单
    if (!title || !abstract || !content || !type) {
        ctx.body = {
            code: 0,
            msg: '缺少信息'
        };
        return;
    }

    //插入数据库
    try {

        let aids = await mysql('article')
            .insert({
                content: content,
                shortcontent: abstract,
                title: title,
                type: type,
                cover: picUrls,
                newssource: newsSource
            }).returning('aid');

        await mysql('articleread').insert({
            aid: aids[0]
        });

        if (keyword1) {
            await mysql('keyword')
                .insert({
                    aid: aids[0],
                    kvalue: keyword1
                });
        }

        if (keyword2) {
            await mysql('keyword')
                .insert({
                    aid: aids[0],
                    kvalue: keyword2
                });
        }

        if (keyword3) {
            await mysql('keyword')
                .insert({
                    aid: aids[0],
                    kvalue: keyword3
                });
        }

        ctx.body = {
            code: 1,
            msg: '成功'
        }

    } catch (e) {
        ctx.body = {
            code: 0,
            msg: e.sqlMessage  //数据库报错信息
        }
    }

};
