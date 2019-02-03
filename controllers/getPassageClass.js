const mysql = require('../middleware/mysql');
const bodyParser = require('koa-bodyparser');

module.exports = async (ctx) =>{
  /*  function parsePostData( ctx ) {
        return new Promise((resolve, reject) => {
            try {
                let postdata = "";
                ctx.req.addListener('data', (data) => {
                    postdata += data
                })
                ctx.req.addListener("end",function(){
                    let parseData = parseQueryStr( postdata )
                    resolve( parseData )
                })
            } catch ( err ) {
                reject(err)
            }
        })
    }

// 将POST请求参数字符串解析成JSON
    function parseQueryStr( queryStr ) {
        let queryData = {}
        let queryStrList = queryStr.split('&')
        console.log( queryStrList )
        for ( let [ index, queryStr ] of queryStrList.entries() ) {
            let itemList = queryStr.split('=')
            queryData[ itemList[0] ] = decodeURIComponent(itemList[1])
        }
        return queryData
    }

    var a = parsePostData(ctx);
    var b = parseQueryStr(a);*/
    let postData = ctx.request.body;
    let articleClass = postData.className;
    let passage = await mysql('article').where({'type':articleClass})
        .select({passageId:'article.aid'}, {title:'title'}, {newsSource:'newssource'}, {newsClass:'type'}, {postTime:'date'}, {pictureURL:'cover'},
            {abstract:'shortcontent'});

    for (let i=0; i<passage.length; i++) {
        passage[i].pictureURL = eval(passage[i].pictureURL)[0];
        passage[i].postTime = dateParser(passage[i].postTime);
    }

    for ( let i = 0; i < passage.length; i++) {
        let id = passage[i].passageId;
        let keyword = await mysql('article').join('keyword', 'article.aid', 'keyword.aid').where({'article.aid': id})
            .select({kvalue:'kvalue'});
        let a = new Array();
        for (let j = 0; j < keyword.length; j++){
            a.push(keyword[j].kvalue);
        }
        //   passage[i].add(keyword);
        passage[i].keywords = a;
        let collectCount = await mysql('article').join('collect', 'article.aid', 'collect.aid').where({'collect.deleted': 0}).andWhere({'article.aid':id});
        let collect = collectCount.length;
        let starCount = await mysql('article').join('star', 'article.aid', 'star.aid').where({'star.deleted': 0}).andWhere({'article.aid':id});
        let star = starCount.length;
        let commentCount = await mysql('article').join('comment', 'article.aid', 'comment.aid').where({'comment.deleted': 0}).andWhere({'article.aid':id});
        //let retjson = await passage.json();
        let comment = commentCount.length;
        passage[i].collectCount = collect;
        passage[i].likeCount = star;
        passage[i].commentCount = comment;
    }
    ctx.body ={
        passage
    }

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
