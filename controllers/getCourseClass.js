const mysql = require('../middleware/mysql');
const bodyParser = require('koa-bodyparser');

module.exports = async (ctx) =>{
    let postData = ctx.request.body;
    let courseClass = postData.class;

    let course = await mysql('course').where({'type':courseClass}).andWhere({'deleted':0})
        .select({courseId:'course.cid'}, {title:'title'}, {courseSource:'coursesource'}, {courseClass:'type'}, {postTime:'date'}, {pictureURL:'cover'},
            {videoURL:'videourl'}, {content:'content'});


    for ( let i = 0; i < course.length; i++) {
        let id = course[i].courseId;
        let keyword = await mysql('course').join('coursekeyword', 'course.cid', 'coursekeyword.cid').where({'course.cid': id})
            .select({kvalue:'kvalue'});
        let a = new Array();
        for (let j = 0; j < keyword.length; j++){
            a.push(keyword[j].kvalue);
        }
        //   passage[i].add(keyword);
        course[i].keywords = a;
        let collectCount = await mysql('course').join('coursecollect', 'course.cid', 'coursecollect.cid').where({'coursecollect.deleted': 0}).andWhere({'course.cid':id});
        let collect = collectCount.length;
        let starCount = await mysql('course').join('coursestar', 'course.cid', 'coursestar.cid').where({'coursestar.deleted': 0}).andWhere({'course.cid':id});
        let star = starCount.length;
        let commentCount = await mysql('course').join('coursecomment', 'course.cid', 'coursecomment.cid').where({'coursecomment.deleted': 0}).andWhere({'course.cid':id});
        //let retjson = await passage.json();
        let comment = commentCount.length;
        course[i].collectCount = collect;
        course[i].likeCount = star;
        course[i].commentCount = comment;
    }
    ctx.body ={
        course
    }

}