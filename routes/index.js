/**
 * ajax 服务路由集合
 */
const router = require('koa-router')();
const uploader = require('../middleware/uploader');
const controllers = require('../controllers');
const { url: url } = require('../config')

router.get(url.prefix + '/login', controllers.login);

router.get(url.prefix + '/addUser', controllers.addUser);

router.get(url.prefix + '/getUserInfo', controllers.getUserInfo);

module.exports = router;
