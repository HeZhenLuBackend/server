const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{

    let result = await mysql('article').select('title',{id:'aid'},{coverPicture:'cover'},'script','type','date').orderBy('aid','desc');

    ctx.body = result;

};
