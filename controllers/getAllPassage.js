const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{

    let result = await mysql('article').select('title',{id:'aid'},{coverPicture:'cover'},'shortcontent','type','date').orderBy('aid','desc');
    for (let i=0; i<result.length; i++) {
        result[i].coverPicture = eval(result[i].coverPicture)[0];
        result[i].date = dateParser(result[i].date);
    }
    ctx.body = result;

};


function dateParser(timestamp) {
    var interval = ( Date.parse(new Date()) - Date.parse(timestamp) ) / 1000;

    if (interval < 3600) {
        return '刚刚';
    }
    if ((interval/3600) < 24) {
        return parseInt(interval/3600) + '小时前';
    }
    if ((interval/86400) < 8) {
        return parseInt(interval/86400) + '天前';
    }
    return timestamp.substr(5, 5);
}
