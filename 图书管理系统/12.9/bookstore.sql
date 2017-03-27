/*
SQLyog Ultimate v8.32 
MySQL - 5.6.34-log : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookstore`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bid` varchar(64) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` double NOT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `cid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `cid` (`cid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `classify` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

/*Table structure for table `classify` */

DROP TABLE IF EXISTS `classify`;

CREATE TABLE `classify` (
  `cid` varchar(64) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classify` */

insert  into `classify`(`cid`,`name`) values ('058f473f53ce41508192d2657b179859','25'),('05e8ba19a2334f4b8718cbdc16631326','97'),('0613e5aa0b104d9294b229c4749ef7d7','112'),('0825b865cf6f42a7a65caee8f52f8911','5'),('095c1a9117544308838a21c833c25b15','都市'),('09a24c7c6e844203a66afaa8ee4a3553','70'),('0b3514bf442f4b31be37a22de60d9671','9'),('0f4a9faaaa214d89875c0180aaa238e5','59'),('0f87738f2f8e46a395bdcd001d559522','74'),('0f92848b478549ffbe0adf4a80ca35a7','62'),('1','悬疑恐怖'),('134c7ca7306d4c86906fd12c99cfdd57','41'),('19c6f78ee5e945a69d7bf9eeac504b0a','94'),('1ab40f9905124b799f3ba6a092d87c11','84'),('1dceb475ae95466d9e3c2d300038a7bc','87'),('1eb753e3c72c4780a35c9d9f946ad275','39'),('1f4548742fc1457eb15e2a86342d7463','119'),('2','古典名著'),('228c085f5c9f4137951c15cc629f0fbd','31'),('22f5e73e1e114f73a491446d14503d55','81'),('2394f3220ae549a1b8c8f5367ef63d92','45'),('24390f6371654ffcb6356b63b2fc485e','68'),('2456de6ec49c4e459ac716d370afc564','32'),('24bbea7dc42b4f68b37bca1bb9bc9ff7','40'),('25020bc1d77147d9adeca06fa2888b91','8'),('267d4aa4655c40b5a7b60bcb7b54bc4f','4'),('2824529153074bf5bcd39ab0df7b304c','82'),('2d2cfca1ab4e406ca608a56517d68b50','117'),('2f0671f07ab041bb8080d5313eb0398b','101'),('3','电脑知识'),('315ee86673144c7d91d3fdef0e4f51e0','104'),('3353536a958146a182ba02bf0768c55f','107'),('34553a87423c4ae8a3954f588c5d293a','22'),('36e62c931ecd46cdb9bc5c5a92432e8b','73'),('3efa233418c248d08ae6c9efe2c3b175','75'),('43a9f97231eb44139d6c059a81756f28','93'),('44b7f63c0cf34ba5b61e3e7861a566b3','90'),('4ab201e3f62e43a285c6f45d5a8f775e','120'),('4c448c19b305446db23aedd64b3951c2','95'),('556c7e04f0fd4af3ab1eddad2e8d32ab','80'),('56a193e8bc5d40c4bebb799c590c3bab','76'),('56f2a57beaab427e8a9b46dcf53b7702','55'),('5c86667fbff34d449cf4778f0cf92cb0','96'),('5dfe6510d8b747a49bd68b7be2f0d9ea','52'),('60e41602f65f401cb2aabb4cdf9481a5','46'),('63c4919a676046b1b15220ef1b38b311','111'),('63ee6422b04c4d888be6d956d99a8cea','47'),('6687a2e2534b4725a21d777abd3a2e96','67'),('66ef1c3fd94247e4b9982d72f06bf115','102'),('70fd95ff91a847ca89df1ca19e621808','110'),('7114584ef460465cb975a93060f48246','17'),('711da49e7ec74347af32a75c54c31b89','113'),('71bf97bb972147e0a0940943c0126f6d','27'),('72fb7ee54c954c0993231af710b9382e','26'),('73eb605f44c340119481dbfdd1512f37','22'),('76b89f18dea5402daf2d4367181c552d','24'),('774a9345425a4dd6b2d655a358bbc9a3','18'),('78737a69e32b4166a74fa2ddb7d63bfc','33'),('788f624a6ed145f89be709c6687a75da','116'),('7a4d7bbceac249c5a54de6821b10e88a','Python'),('7a717b1ca2db47baa5abad2063240a6a','JavaScript'),('7b6710302eeb47cd94f8bfa0b6fd5469','58'),('7fddb4c912e6481f9da316258e068aa1','56'),('802b35d43e614f999ca934c7c0fe5142','79'),('81bc4377a042495abb7368036ca8cdd2','16'),('85a778bd46c74d8b9694d78789381fbd','108'),('867d85f492994933bd10f04f7b3a2148','99'),('8b010823f97940b2ba9dede5f4c9d494','72'),('8c4c7f8a4be945f1a48b8659ec698312','69'),('8c5d92581777472aa1bdabf8651a0ae6','Scala'),('913c6959136e47dd8552fb526ec6abf8','JAVA'),('921ccdd4d5524ee0a5a7ec3ad4e2eca5','64'),('a2aea032154a4e4885187f0f3f26b556','50'),('a2fb9cd42b0a497aaf6a9c455b152c18','C++'),('a33240a9c99f4abe96e0089b266d79f0','42'),('a3553f86517445b09793f27f77350e92','19'),('a9f1d9c69fef4a9081e682dc11972222','92'),('ab77665633f5420290d8e210c33de76d','78'),('ac10324b0a4548a3a8e3a4b752e459be','1'),('ae6db2dfbafc47a4b6efbfc62cca5b39','12'),('aecb486e6a774417a339c088ff66eee5','6'),('aef0f3e6225e40da9bc968dc9665f46a','106'),('b0835a35033f449488b2cba20df92a4b','114'),('b095beb791754dd4a6559ee8bd45c843','61'),('b1a1d935acd549e287d757a8fc27b348','38'),('b39755e8a1504ec793e6b20e0d1b1d0a','66'),('b52a9fabc42a491ea2dbbc087e59d5be','77'),('b85ac7fc3fd8415aa9592bd0be5a86d7','29'),('babb608a0d294d9d9faee3ac188d2760','63'),('bdaac7a8fc864e77846bb2c9c1040a23','105'),('c07a50073356455b8d4edb6b60ae6827','88'),('c486878d32a04bc2abd4d2484f25c10a','.Net'),('c4acb55437b94a90bbf6774df03005be','13'),('c76a100442a0418ebf8d857182c1097c','37'),('d0c4e79a0a9a4764923e1fef20a3eacd','49'),('d14289cea3ca44df9a71e7d41075fada','60'),('d3d6aecd004546a9a1b50b2d90ef3e7f','89'),('d4aaa56db03d43afa0d8a7cb87b05bbd','98'),('d4cdec25b17b4f54bb2ea3841a0ec0c2','57'),('d69f72a1f720494e8885d1b09be717fe','53'),('d7ddf7eea16a4162a5395a565ceabc40','103'),('d890aba67f2d45d8ac42690112d21a54','100'),('d9b88c1789e444ada84bdc6f0e469757','34'),('da241a4ff21b43a7a2ff7425a8523134','54'),('db98b48eb7e14b2ea46d02deb0962a83','86'),('dc325e8d8ac944ed9bdbf19ac7a6c7b3','48'),('ddbcc990676c4bcc8cd9a19f94745027','115'),('de59a98e987e4c16a4b2ff55711617eb','91'),('e21910eef7704dffa1248f0b6796626f','65'),('e25fac2fbed64557b37de10eb9e93a07','51'),('e5863d503ca04330a6a008b5e1de0ce1','109'),('e610f5706bdd4edc9732924cc8e4d17b','35'),('e7e22f0d4e3f4adc8e4cffc52cd61dd2','83'),('ee659adb43f94fd48dd1f0123edbf48e','10'),('ee92f80146734390919009505639e769','71'),('f2b6bd80b1dd4cb9837d9b4b05dad323','7'),('fd61f39f7188475a93e92aef0605c0e0','85'),('fe8eebaed202416d9c407afdd1e4a3c6','118');

/*Table structure for table `details` */

DROP TABLE IF EXISTS `details`;

CREATE TABLE `details` (
  `bid` varchar(64) DEFAULT NULL,
  `oid` varchar(64) DEFAULT NULL,
  KEY `bid` (`bid`),
  KEY `oid` (`oid`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `details` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` varchar(64) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`) values ('0e1c7102-3f2e-4f49-99cc-2e72b99d4aa4','123456','123456','camille'),('49e57bef-6ec6-470b-a309-6bf04049360d','liushuheng','123456','qqqqqq'),('5369bf03-f2af-4cad-b12c-dac81742c3f4','wenleigang','chishi','ssss'),('591c1820-9af3-40b8-89d1-2571f1090efd','yangzhao ','123456','杨召');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
