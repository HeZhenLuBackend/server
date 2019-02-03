const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{

    let result = await mysql('article').join('articleread', 'article.aid', 'articleread.aid').select('title',{id:'aid'},{coverPicture:'cover'},'script','type','date').orderBy('readcount','desc').limit(4);

    for (let i=0; i<result.length; i++) {
        result[i].coverPicture = eval(result[i].coverPicture)[0];
        result[i].date = dateParser(result[i].date);
    }

    ctx.body = result;

};
