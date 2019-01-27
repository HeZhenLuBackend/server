const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{
    let result = await mysql('article').select('title',{id:'aid'},{coverPicture:'cover'},'script','type','date').limit(3);

    ctx.body = result;

};