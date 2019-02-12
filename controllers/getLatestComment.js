const mysql = require('../middleware/mysql');
const date_parser = require('../middleware/date_parser');

module.exports = async (ctx) =>{
    let result = await mysql('comment').select({id:'cid'},{comment:'content'},{postTime:'create_time'},{passageID:'aid'}).orderBy('cid','desc').limit(2);
    for (let i=0; i<result.length; i++) {
        result[i].postTime = date_parser(result[i].postTime);
    }
    ctx.body = result;
};
