/**
 * ajax 服务路由集合
 */
const router = require('koa-router')();
const uploader = require('../middleware/uploader');
const controllers = require('../controllers');
const { url: url } = require('../config');

router.post(url.prefix + '/user/login', controllers.login);

router.post(url.prefix + '/user/identify', controllers.getIdentifyCode);

router.post(url.prefix + '/user/register', controllers.addUser);

router.get(url.prefix + '/getUserInfo', controllers.getUserInfo);

router.get(url.prefix + '/passage/hot', controllers.getHot);

router.post(url.prefix + '/passage/class', controllers.getClass);


module.exports = router;
