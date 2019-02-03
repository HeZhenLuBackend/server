const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{

    const passageID = ctx.request.body.passageID;

    let results = await mysql('article')
        .select('title',{newsSource:'newssource'},{newsClass:'type'},{postTime:'date'},{picUrls:'cover'},'content')
        .where('aid', passageID);

    let keywords = await mysql('keyword')
        .select('kvalue')
        .where('aid', passageID);

    let result = results[0];

    result.postTime = dateParser(result.postTime);

    result.picUrls = eval(result.picUrls);
    result.keywords = [];

    for (let i=0; i<keywords.length; i++) {
        if (keywords[i]) {
            result.keywords.push(keywords[i].kvalue);
        }
    }

    ctx.body = result;

    let readcounts = await mysql('articleread').select('readcount').where('aid', passageID);

    await mysql('articleread').where('aid', passageID)
        .update({
            readcount: readcounts[0].readcount + 1,
            thisKeyIsSkipped: undefined
        });

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
