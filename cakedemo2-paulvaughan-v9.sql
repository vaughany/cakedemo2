
/*!40000 DROP DATABASE IF EXISTS `cakedemo2`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cakedemo2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `cakedemo2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `comments` VALUES (1,'I feel happy! I feel happy!!',1,1,'2016-01-26 10:52:58','2016-01-26 11:18:28',NULL);
INSERT INTO `comments` VALUES (2,'Oh, just die already...',1,2,'2016-01-26 14:54:08','2016-01-26 14:54:08',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comment_count` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `posts` VALUES (1,'Rumours of my death have been greatly exaggerated','','No, really!',1,2,'2016-01-26 10:52:14','2016-01-26 14:58:35',NULL);
INSERT INTO `posts` VALUES (2,'Something Something Darkside','something-something-darkside','It\'s a Family Guy Star Wars episode!',1,0,'2016-01-26 14:05:06','2016-01-26 15:02:37',NULL);
INSERT INTO `posts` VALUES (3,'Grr!!','grr','Argh!!',1,0,'2016-01-26 15:02:54','2016-01-26 15:04:17',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `tags` VALUES (1,'development','2016-01-26 11:19:23','2016-01-26 11:19:23',NULL);
INSERT INTO `tags` VALUES (2,'narcissistic','2016-01-26 11:19:42','2016-01-26 11:20:06',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) CHARACTER SET ascii NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `post_count` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `users` VALUES (1,'paulvaughan','p@55w0rd','Paul Vaughan','paulvaughan@example.com',3,'2016-01-26 10:51:29','2016-01-26 11:18:08',NULL);
INSERT INTO `users` VALUES (2,'santa','Xm@5','Saint Nicholas','santa@example.com',0,'2016-01-26 13:52:33','2016-01-26 13:52:33',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_key` (`post_id`),
  KEY `tag_key` (`tag_id`),
  CONSTRAINT `posts_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `posts_tags` VALUES (2,2,2,'2016-01-26 14:05:06','2016-01-26 14:05:06');
INSERT INTO `posts_tags` VALUES (3,1,1,'2016-01-26 14:57:59','2016-01-26 14:57:59');
INSERT INTO `posts_tags` VALUES (4,1,2,'2016-01-26 14:58:35','2016-01-26 14:58:35');
INSERT INTO `posts_tags` VALUES (6,3,2,'2016-01-26 15:04:17','2016-01-26 15:04:17');
