/**
 * ajax 服务路由集合
 */
const router = require('koa-router')();
const uploader = require('../middleware/uploader');
const controllers = require('../controllers');

router.get('/api/v1/login', controllers.login);

router.get('/api/v1/addUser', controllers.addUser);

router.get('/api/v1/getUserInfo', controllers.getUserInfo);

module.exports = router;
