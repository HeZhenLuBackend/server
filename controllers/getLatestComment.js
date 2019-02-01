const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{
    ctx.body = await mysql('comment').select({id:'cid'},{comment:'content'},{postTime:'create_time'},{passageID:'aid'}).orderBy('cid','desc').limit(2);
};
