const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{
    let result = await mysql('article').select('title',{id:'aid'},{coverPicture:'cover'},'script','type','date').orderBy('aid','desc').limit(3);
    for (let i=0; i<result.length; i++) {
        result[i].coverPicture = JSON.stringify(result[i].coverPicture)[0];
    }
    ctx.body = result;

};
