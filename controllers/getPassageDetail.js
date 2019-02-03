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
            result.push(keywords[i]);
        }
    }

    ctx.body = result;

};
//
// title:"标题",
//     newsSource: "NJU核真录",
//     newsClass: "事实核查",
//     postTime: "2018-12-12 12:30",
//     keyword1:"关键词",
//     keyword2:"关键词",
//     keyword3:"关键词",
//     picUrls:["a.png","b.png","c.png"],
//     content:"文章正文",

//
// DROP TABLE IF EXISTS `article`;
// CREATE TABLE `article` (
//     `aid` int(32) NOT NULL AUTO_INCREMENT,
//     `content` longtext,
//     `shortcontent` varchar(1000),
//     `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
//     `deleted` tinyint(1) NOT NULL DEFAULT 0,
//     `top` tinyint(1) NOT NULL DEFAULT 0,
//     `cover` longtext,
//     `script` varchar(1000),
//     `newssource` varchar(1000),
//     `type` varchar(1000),
//     `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
//     PRIMARY KEY (`aid`),
//     KEY `aid` (`aid`) USING BTREE
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


// DROP TABLE IF EXISTS `keyword`;
// CREATE TABLE `keyword` (
//     `kid` int(32) NOT NULL AUTO_INCREMENT,
//     `aid` int(32) NOT NULL,
//     `kvalue` varchar(100) NOT NULL,
//     PRIMARY KEY (`kid`),
//     KEY `index_aid_kvalue` (`aid`, `kvalue`) USING BTREE
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
