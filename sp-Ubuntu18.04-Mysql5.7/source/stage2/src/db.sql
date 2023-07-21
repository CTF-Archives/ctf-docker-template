SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `ctftraining`;
CREATE DATABASE ctftraining;
USE ctftraining;

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT news(title,content,time) VALUES ('dog','The domestic dog (Canis lupus familiaris when considered a subspecies of the wolf or Canis familiaris when considered a distinct species)[4] is a member of the genus Canis (canines), which forms part of the wolf-like canids,[5] and is the most widely abundant terrestrial carnivore.',unix_timestamp(now()));
INSERT news(title,content,time) VALUES ('cat','The cat or domestic cat (Felis catus) is a small carnivorous mammal.[1][2] It is the only domesticated species in the family Felidae.[4] The cat is either a house cat, kept as a pet, or a feral cat, freely ranging and avoiding human contact.',unix_timestamp(now()));
INSERT news(title,content,time) VALUES ('bird','Birds, also known as Aves, are a group of endothermic vertebrates, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.',unix_timestamp(now()));
INSERT news(title,content,time) VALUES ('flag','Flag is in the database but not here.',unix_timestamp(now()));


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `ip` varchar(50) NOT NULL DEFAULT '127.0.0.1',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT users (username,password,ip,time) VALUES ('admin','21232f297a57a5a743894a0e4a801fc3','127.0.0.1',unix_timestamp(now()));
INSERT users (username,password,ip,time) VALUES ('guest','084e0343a0486ff05530df6c705c8bb4','127.0.0.1',unix_timestamp(now()));
INSERT users (username,password,ip,time) VALUES ('virink','a4346e75cc1dd161a8d57f3b2d5d82d0','127.0.0.1',unix_timestamp(now()));



DROP TABLE IF EXISTS `FLAG_TABLE`;
CREATE TABLE `FLAG_TABLE` (
  `FLAG_COLUMN` varchar(128) NOT NULL DEFAULT 'not_flag'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
