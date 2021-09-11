/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ domani /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE domani;

DROP TABLE IF EXISTS category;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL COMMENT 'Enter Category name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS module;
CREATE TABLE `module` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL COMMENT 'Enter Module name',
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS sub_category;
CREATE TABLE `sub_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL COMMENT 'Enter Sub Category name',
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS vendors;
CREATE TABLE `vendors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL COMMENT 'Enter Vendor name',
  `address` varchar(255) DEFAULT NULL,
  `Account_details` varchar(255) DEFAULT NULL,
  `phone_pe_number` int DEFAULT NULL,
  `gpay_number` int DEFAULT NULL,
  `contact_number` int DEFAULT NULL,
  `email_id` int DEFAULT NULL,
  `logo` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO category(id,create_time,update_time,name) VALUES(1,'2021-09-11 21:30:34','2021-09-11 21:30:34','Raw Material'),(2,'2021-09-11 21:31:10','2021-09-11 21:31:10','Hardware'),(3,'2021-09-11 21:31:54','2021-09-11 21:31:54','Material Transportation'),(4,'2021-09-11 21:31:54','2021-09-11 21:31:54','Employee Transportation'),(5,'2021-09-11 21:32:12','2021-09-11 21:32:12','Labour'),(6,'2021-09-11 21:35:54','2021-09-11 21:35:54','Salary'),(7,'2021-09-11 21:36:34','2021-09-11 21:36:34','Marketing'),(8,'2021-09-11 21:36:51','2021-09-11 21:36:51','JobWork'),(9,'2021-09-11 21:37:02','2021-09-11 21:37:02','OutSourcing'),(10,'2021-09-11 21:37:38','2021-09-11 21:37:38','Maintenance');



INSERT INTO new_trade(stock,price,quantity,id) VALUES('XYZ',99,100,0);

INSERT INTO projects(id,create_time,update_time,name) VALUES(1,'2021-09-11 00:00:00','2021-09-11 00:19:54','Jeevan');


INSERT INTO user(id,username,email,password,department,level) VALUES(1,'test','testing@gmail.com',X'616133366364333462313131386236663538383830396461643139613136316336343462663439626131316532346230643762326365383333343230303634366361663166633434616237613966616365343563376336643765396539366632643361363565396666306538653434366466363639343839636537323933616235303662626634343530343430313833326130333566636233393437353262363862363733316564653865663365613335383164316237656539613366656138',NULL,NULL),(2,'Anand','AnandVadthiya@gmail.com',X'373033346236373039643033666533653633373339323031353532633438656366336334633264646364323532376130643032653431666466383664376235323563303461393038663334316430633335396631346561326263626539653562373238313264346265623131633339613430323839373831666561653862333064383732313561623632313939626463356439393039313164366330333236306330373933623133393835643430303562376535636664666335326134613838','Design',0);