const mysql = require('../middleware/mysql');
const date_parser = require('../middleware/date_parser');

module.exports = async (ctx) =>{

    let result = await mysql('article').join('articleread', 'article.aid', 'articleread.aid').select('title',{id:'article.aid'},{coverPicture:'cover'},{abstract:'shortcontent'},'type','date').orderBy('readcount','desc').limit(4);

    for (let i=0; i<result.length; i++) {
        result[i].coverPicture = eval(result[i].coverPicture)[0];
        result[i].date = date_parser(result[i].date);
    }

    ctx.body = result;

};
