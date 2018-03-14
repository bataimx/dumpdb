CREATE TABLE IF NOT EXISTS `ecot_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `ecot_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `ecot_weblinks` (`id`,`catid`,`sid`,`title`,`alias`,`url`,`description`,`date`,`hits`,`state`,`checked_out`,`checked_out_time`,`ordering`,`archived`,`approved`,`access`,`params`,`language`,`created`,`created_by`,`created_by_alias`,`modified`,`modified_by`,`metakey`,`metadesc`,`metadata`,`featured`,`xreference`,`publish_up`,`publish_down`) VALUES (1,6,0,'redCOMPONENT Template Club','redcomponent-template-club','http://redcomponent.com/redcomponent/subscription','<p>Buy this template. Single Sale or as part of our Template Club.</p>','0000-00-00 00:00:00',1,1,0,'0000-00-00 00:00:00',1,0,1,1,'{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}','*','2014-02-25 13:29:06.000',75,'','0000-00-00 00:00:00',0,'','','{\"robots\":\"\",\"rights\":\"\"}',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `ecot_weblinks` (`id`,`catid`,`sid`,`title`,`alias`,`url`,`description`,`date`,`hits`,`state`,`checked_out`,`checked_out_time`,`ordering`,`archived`,`approved`,`access`,`params`,`language`,`created`,`created_by`,`created_by_alias`,`modified`,`modified_by`,`metakey`,`metadesc`,`metadata`,`featured`,`xreference`,`publish_up`,`publish_down`) VALUES (2,6,0,'redCOMPONENT.com','redcomponent-com','http://redcomponent.com/','<p>Joomla! extensions, redSHOP, redFORM, redEVENT, redMIGRATOR, and many more! See them all at redCOMPONENT.com</p>','0000-00-00 00:00:00',0,1,0,'0000-00-00 00:00:00',2,0,1,1,'{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}','*','2014-02-25 13:31:34.000',75,'','0000-00-00 00:00:00',0,'','','{\"robots\":\"\",\"rights\":\"\"}',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00');

INSERT INTO `ecot_wf_profiles` (`id`,`name`,`description`,`users`,`types`,`components`,`area`,`device`,`rows`,`plugins`,`published`,`ordering`,`checked_out`,`checked_out_time`,`params`) VALUES (1,'Default','Default Profile for all users','','3,4,5,6,8,7','',0,'desktop,tablet,phone','help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,fontcolor,spacer,clipboard,indent,outdent,lists,sub,sup,textcase,charmap,hr;directionality,fullscreen,print,searchreplace,spacer,table,style,xhtmlxtras;visualaid,visualchars,visualblocks,nonbreaking,anchor,unlink,link,imgmanager,spellchecker,article','formatselect,styleselect,cleanup,fontselect,fontsizeselect,fontcolor,clipboard,lists,textcase,charmap,hr,directionality,fullscreen,print,searchreplace,table,style,xhtmlxtras,visualchars,visualblocks,nonbreaking,anchor,link,imgmanager,spellchecker,article,spellchecker,article,browser,contextmenu,inlinepopups,media,preview,source',1,1,0,'0000-00-00 00:00:00','');
INSERT INTO `ecot_wf_profiles` (`id`,`name`,`description`,`users`,`types`,`components`,`area`,`device`,`rows`,`plugins`,`published`,`ordering`,`checked_out`,`checked_out_time`,`params`) VALUES (2,'Front End','Sample Front-end Profile','','3,4,5','',1,'desktop,tablet,phone','help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;clipboard,searchreplace,indent,outdent,lists,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars,visualblocks;fullscreen,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article','charmap,contextmenu,inlinepopups,help,clipboard,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article,lists,formatselect,styleselect,hr',0,2,0,'0000-00-00 00:00:00','');
INSERT INTO `ecot_wf_profiles` (`id`,`name`,`description`,`users`,`types`,`components`,`area`,`device`,`rows`,`plugins`,`published`,`ordering`,`checked_out`,`checked_out_time`,`params`) VALUES (3,'Blogger','Simple Blogging Profile','','3,4,5,6,8,7','',0,'desktop,tablet,phone','bold,italic,strikethrough,lists,blockquote,spacer,justifyleft,justifycenter,justifyright,spacer,link,unlink,imgmanager,article,spellchecker,fullscreen,kitchensink;formatselect,styleselect,underline,justifyfull,clipboard,removeformat,charmap,indent,outdent,undo,redo,help','link,imgmanager,article,spellchecker,fullscreen,kitchensink,clipboard,contextmenu,inlinepopups,lists,formatselect,styleselect,textpattern',0,3,0,'0000-00-00 00:00:00','{\"editor\":{\"toggle\":\"0\"}}');
INSERT INTO `ecot_wf_profiles` (`id`,`name`,`description`,`users`,`types`,`components`,`area`,`device`,`rows`,`plugins`,`published`,`ordering`,`checked_out`,`checked_out_time`,`params`) VALUES (4,'Mobile','Sample Mobile Profile','','3,4,5,6,8,7','',0,'tablet,phone','undo,redo,spacer,bold,italic,underline,formatselect,spacer,justifyleft,justifycenter,justifyfull,justifyright,spacer,fullscreen,kitchensink;styleselect,lists,spellchecker,article,link,unlink','fullscreen,kitchensink,spellchecker,article,link,inlinepopups,lists,formatselect,styleselect,textpattern',0,4,0,'0000-00-00 00:00:00','{\"editor\":{\"toolbar_theme\":\"mobile\",\"resizing\":\"0\",\"resize_horizontal\":\"0\",\"resizing_use_cookie\":\"0\",\"toggle\":\"0\",\"links\":{\"popups\":{\"default\":\"\",\"jcemediabox\":{\"enable\":\"0\"},\"window\":{\"enable\":\"0\"}}}}}');
INSERT INTO `ecot_wf_profiles` (`id`,`name`,`description`,`users`,`types`,`components`,`area`,`device`,`rows`,`plugins`,`published`,`ordering`,`checked_out`,`checked_out_time`,`params`) VALUES (5,'Markdown','Sample Markdown Profile','','6,7,3,4,5,8','',0,'desktop,tablet,phone','fullscreen,justifyleft,justifycenter,justifyfull,justifyright,link,unlink,imgmanager,styleselect','fullscreen,link,imgmanager,styleselect,inlinepopups,media,textpattern',0,5,0,'0000-00-00 00:00:00','{\"editor\":{\"toolbar_theme\":\"mobile\"}}');