/**
 * ajax 服务路由集合
 */
const router = require('koa-router')();
const uploader = require('../middleware/uploader');
const controllers = require('../controllers');
const { url: url } = require('../config');

router.get(url.prefix + '/user/login', controllers.login);

router.get(url.prefix + '/user/identify', controllers.getIdentifyCode);

router.get(url.prefix + '/user/register', controllers.addUser);

router.get(url.prefix + '/getUserInfo', controllers.getUserInfo);

router.post(url.prefix + '/passage/class', controllers.getClass);

router.get(url.prefix + '/passage/hot', controllers.getHot);


module.exports = router;
