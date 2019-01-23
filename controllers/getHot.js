const mysql = require('../middleware/mysql');

module.exports = async (ctx) =>{
    let result = await mysql('article').select('title',{id:'aid'},{coverPicture:'cover'},'script','type','date');
     result = result.filter((item, index)=>{
         if(index>=4) return 0;
    })
    ctx.body ={
        data:result
    }

}