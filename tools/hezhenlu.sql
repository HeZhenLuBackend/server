SET NAMES utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone` int(32) NOT NULL DEFAULT 0,
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `uid` int(32) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`,`start_time`),
  KEY `index_uid_deleted` (`uid`, `deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(32) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `shortcontent` varchar(1000),
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `cover` varchar(1000),
  `script` varchar(1000),
  `newssource` varchar(1000),
  `type` varchar(1000),
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aid`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(32) NOT NULL AUTO_INCREMENT,
  `parent_cid` int(32) DEFAULT 0,
  `aid` int(32) NOT NULL,
  `uid` int(32) NOT NULL,
  `parent_uid` int(32) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`),
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `star`;
CREATE TABLE `star` (
  `sid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `aid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sid`),
  KEY `index_uid_aid` (`uid`, `aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `cid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `aid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`),
  KEY `index_uid_aid` (`uid`, `aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `kid` int(32) NOT NULL AUTO_INCREMENT,
  `aid` int(32) NOT NULL,
  `kvalue` varchar(100) NOT NULL,
  PRIMARY KEY (`kid`),
  KEY `index_aid_kvalue` (`aid`, `kvalue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate` (
  `did` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `amount` double NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`did`),
  KEY `index_uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(32) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `cover` varchar(1000),
  `videourl` varchar(1000),
  `coursesource` varchar(1000),
  `type` varchar(1000),
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursecomment`;
CREATE TABLE `coursecomment` (
  `ccid` int(32) NOT NULL AUTO_INCREMENT,
  `parent_ccid` int(32) DEFAULT 0,
  `cid` int(32) NOT NULL,
  `uid` int(32) NOT NULL,
  `parent_uid` int(32) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ccid`),
  KEY `ccid` (`ccid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursestar`;
CREATE TABLE `coursestar` (
  `sid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `cid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sid`),
  KEY `index_uid_cid` (`uid`, `cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursecollect`;
CREATE TABLE `coursecollect` (
  `ccid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `cid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ccid`),
  KEY `index_uid_cid` (`uid`, `cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursekeyword`;
CREATE TABLE `coursekeyword` (
  `kid` int(32) NOT NULL AUTO_INCREMENT,
  `cid` int(32) NOT NULL,
  `kvalue` varchar(100) NOT NULL,
  PRIMARY KEY (`kid`),
  KEY `index_cid_kvalue` (`cid`, `kvalue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





insert into article(content, shortcontent, cover, title, type, script) values
('概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》', '《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。 ', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg', '2017年度报告 | 南大“核真录”1', '年度报告', '稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次'),
('概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》', '《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。 ', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg', '2017年度报告 | 南大“核真录”2', '年度报告', '稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次'),
('概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》', '《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。 ', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg', '2017年度报告 | 南大“核真录”3', '年度报告', '稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次'),
('概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》', '《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。 ', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg', '2017年度报告 | 南大“核真录”4', '年度报告', '稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次'),
('概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》', '《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。 ', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg', '2017年度报告 | 南大“核真录”5', '年度报告', '稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次');


insert into course(content, cover, title, videourl, type, coursesource) values
(
'概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg',
'2017年度报告 | 南大“核真录”1',
'https://v.youku.com/v_show/id_XMzA5MTIzNTU0MA==.html?spm=a2h0k.11417342.soresults.dtitle',
'种类1',
'优酷'),
(
'概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg',
'2017年度报告 | 南大“核真录”1',
'https://v.youku.com/v_show/id_XMzA5MTIzNTU0MA==.html?spm=a2h0k.11417342.soresults.dtitle',
'种类1',
'优酷'),(
'概况 2017年10月郑佳雯老师上《媒介案例分析》课程时，开设了《NJU核真录》新闻公众号，在微信平台发布。该公众号也是2017年春季学期《融合媒介报道》课程的延伸。该公众号致力于探索在“后真相”时代，新闻行业从事“事实核查”的理念与实践，审视新闻专业主义在这个时代的价值。事实核查旨在评估中国媒体新闻报道中的事实性陈述的准确性。所有的事实核查均由学生独立完成。授课老师为其提供指导。    参与学生 《NJU核真录》创办至今两个月，陆续招募学生加入。目前编辑部日常有22人，其中包括三个非南大学生，分别驻上海和北京。参与编辑部的大多数学生是人文大类一年级同学，也有2016实验班的大二同学、新传院的研究生，以及外语学院、商学院等外院系的学生。    作品数 从2017年10月16日创刊至今，核真录对一系列引起社会广泛关注的新闻事件进行事实核查，共刊发20篇稿件。稿件内容涉足广泛，对新闻的反应敏捷及时，学生采访扎实，写作质量高，很多篇稿件产生了良好的社会效应，文章阅读量最高达到25000次，多篇文章的阅读量在8000-10000次以上。    其中有影响的作品包括：  《核真|走访武警训练基地，解密“南京咳嗽”六大疑云》  《核真|南大有野猪？照片是真的，视频是假的》  《核真|全球雾霾最严重城市的四大事实》  《核真|三原色“疑点核查”修改判定，“你相信吗”调查结果发布》  《核真|争分夺秒168小时，过去的七天发生了什么》  《核真|红黄蓝事件十大疑云，一分钟帮你解密真实与谎言》  《核真|刘强东真是“业界良心”？京东快递员工资真的高出同行50%吗？》',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548578486715&di=b0ef5a6c22195018e8c69cc90600d8f6&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FMLmkAa4Zrsem0RMFepUOpyAWUueRzV9KN8KuLbhTEnPTXYP6uDhWLgVichcTOOzBc0iaWyormFuLW67MzqRibQc3g%2F640%3Fwx_fmt%3Djpeg',
'2017年度报告 | 南大“核真录”1',
'https://v.youku.com/v_show/id_XMzA5MTIzNTU0MA==.html?spm=a2h0k.11417342.soresults.dtitle',
'种类1',
'优酷');


insert into comment(aid, uid, parent_uid, content) values
(1, 1, 1, '这是一条最新的评论内容1'),
(1, 1, 1, '这是一条最新的评论内容2'),
(1, 1, 1, '这是一条最新的评论内容3'),
(1, 1, 1, '这是一条最新的评论内容4'),
(1, 1, 1, '这是一条最新的评论内容5');
