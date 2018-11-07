/**
 * ajax 服务路由集合
 */
const router = require('koa-router')();
const uploader = require('../middleware/uploader');
const controllers = require('../controllers');

router.get('/login', controllers.login);

router.get('/addUser', controllers.addUser);

router.get('/getUserInfo', controllers.getUserInfo);

module.exports = router;
