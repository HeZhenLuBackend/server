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
    result.picUrls = eval(result.picUrls);
    result.keywords = [];

    for (let i=0; i<keywords.length; i++) {
        if (keywords[i]) {
            result.keywords.push(keywords[i].kvalue);
        }
    }

    ctx.body = result;

};
