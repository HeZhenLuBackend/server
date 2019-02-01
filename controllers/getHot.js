const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{
    let result = await mysql('article').select('title',{id:'aid'},{coverPicture:'cover'},'script','type','date').orderBy('aid','desc').limit(4);

    for (let i=0; i<result.length; i++) {
        result[i].coverPicture = eval(result[i].coverPicture)[0];
    }
    // for (let i=0; i<result.length; i++) {
    //     result[i].coverPicture = result[i].coverPicture.substr(1,result[i].coverPicture.length - 2);
    //     let array = result[i].coverPicture.split('","');
    //     result[i].coverPicture = array[0];
    // }
    ctx.body = result;

};
