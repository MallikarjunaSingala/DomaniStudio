/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ domani /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE domani;

DROP TABLE IF EXISTS clients;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `name` varchar(255) DEFAULT NULL COMMENT 'Client Name',
  `address` varchar(255) DEFAULT NULL COMMENT 'Client Address',
  `mobile_number` bigint DEFAULT NULL COMMENT 'Client Mobile Number',
  `email` varchar(255) DEFAULT NULL COMMENT 'Client Email',
  `status` varchar(255) DEFAULT NULL COMMENT 'Client Status like Approached etc',
  `lead_type` varchar(255) DEFAULT NULL COMMENT 'How did we got lead',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS new_trade;
CREATE TABLE `new_trade` (
  `stock` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS projects;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_time` datetime DEFAULT NULL COMMENT 'update time',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS user;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` blob,
  `department` varchar(30) DEFAULT NULL,
  `level` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO new_trade(stock,price,quantity,id) VALUES('XYZ',99,100,0);

INSERT INTO projects(id,create_time,update_time,name) VALUES(1,'2021-09-11 00:00:00','2021-09-11 00:19:54','Jeevan');
INSERT INTO user(id,username,email,password,department,level) VALUES(3,'test','testing@gmail.com',X'336164653138393533396465313035386337366563376331313264326138383237633761646336386232383165303634306562626438653830626364306265333539396331323061626266666634306661666132353036353065386566326461623330353937313064323530353839313739336437393861396165333237643730653464643131666332356533313465386133633862303465613832336538666133393264373139363637343464343264393061333064633561383830656662','Helo',0);