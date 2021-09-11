/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ domani /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE domani;

DROP TABLE IF EXISTS projects;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO projects(id,create_time,update_time,name) VALUES(1,'2021-09-11 00:00:00','2021-09-11 00:19:54','Jeevan');