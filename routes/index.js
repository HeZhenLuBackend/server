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

router.get(url.prefix + '/passage/all', controllers.getAllPassage);

router.get(url.prefix + '/passage/hot', controllers.getHot);

router.post(url.prefix + '/passage/class', controllers.getPassageClass);

router.get(url.prefix + '/passage/latest',controllers.getLatestPassage);

router.post(url.prefix + '/passage/delete', controllers.delPassage);

router.post(url.prefix + '/passage/publish', controllers.addPassage);

router.post(url.prefix + '/passage/detail', controllers.getPassageDetail);

router.post(url.prefix + '/course/class', controllers.getCourseClass);

router.get(url.prefix + '/comment/latest', controllers.getLatestComment);

router.post(url.prefix + '/passage/comments', controllers.getPassageComments);

router.post(url.prefix + '/passage/comment', controllers.addComment);

module.exports = router;
