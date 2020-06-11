CREATE DATABASE  IF NOT EXISTS `bookshopbasic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookshopbasic`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookshopbasic
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookcondition`
--

DROP TABLE IF EXISTS `bookcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookcondition` (
  `conditionid` int NOT NULL,
  `condition` varchar(45) NOT NULL,
  PRIMARY KEY (`conditionid`),
  UNIQUE KEY `idbookcondition_UNIQUE` (`conditionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookcondition`
--

LOCK TABLES `bookcondition` WRITE;
/*!40000 ALTER TABLE `bookcondition` DISABLE KEYS */;
INSERT INTO `bookcondition` VALUES (1,'NEW'),(2,'LIKE_NEW'),(3,'USED'),(4,'WORN'),(5,'DAMAGED');
/*!40000 ALTER TABLE `bookcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `printYear` int DEFAULT NULL,
  `info` varchar(150) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Php Programming','fredrick federico','IT Books',2000,'a book that was out of date years before being printed',14.99,'ISBN 0-00-000001-0'),(2,'Java Programming','Georgio Gorgina','IT Books',2019,'useful for legacy systems from 1995',19.99,'ISBN 0-00-000002-0'),(3,'Plumbing','Joe Johnson','Dummy Books',1987,'its just some pipes and fittings, but we will gladly take your money',9.99,'ISBN 0-00-000003-0'),(4,'Animals','Emily Evans','Nature Books',2003,'Meoq! Woof! Guess what your an animal too.....',12.99,'ISBN 0-00-000004-0'),(5,'Trucks','Jimmy Stalone','Mechanics Books',1997,'parts, pictures, and women',14.99,'ISBN 0-00-000005-0'),(6,'Raising Teenagers','Simon Simonns','Parenting Books',2008,'quick run away while you still can! AHHHHhhhhh!!!',4.99,'ISBN 0-00-000006-0'),(7,'To Serve Humans','Ertyshito 100101','Mars',1958,'A through back to the twiglight zone',49.99,'ISBN 0-00-000007-0'),(8,'RAM','Henry Hackerson','IT Books',2007,'download it from our site and you will never have to worry about RAM again',17.95,'ISBN 0-00-000008-0'),(9,'Programming 101','Ninc Ompoo','IT Books',2020,'once you have learned it you can forget it and learn whats really importnat',35.49,'ISBN 0-00-000009-0'),(10,'Yes You Can\'t','Scammy McGee','Useless',1999,'Give money to the guy that coined unmotivational!!! Buy it, never read it, you win',3.99,'ISBN 0-00-000011-0'),(11,'Oninons','Sue Sheph','Cooking The Books',2010,'Every way to add onions to your dishes. Got cereal? Put onion powder in it. Ice Cream? Puree it right in!',19.29,'ISBN 0-00-000021-0'),(12,'LOL','Sheba Littles','Emoji Texts :)',2018,':( 80 :p :0 <3 ;( Right!?!?',11.89,'ISBN 0-00-000031-0'),(13,'Show Tunes','Betty Withers','Rocking Chair',1948,'get off my lawn sonny',3.87,'ISBN 0-00-000041-0'),(14,'Time Traveler','Richie Richards','Scam Books',2842,'I\'m from the future, give me money for vauge prophecies',99.99,'ISBN 0-00-000051-0'),(15,'Blank','You','Diary Printer',2020,'put your own words in it!',4.99,'ISBN 0-00-000061-0'),(16,'ABCs','Becky Whitles','Kids Books',2007,'Teaches kids their abcs, you know after you teach them every letter...',12.49,'ISBN 0-00-000071-0'),(17,'123s','Becky Whitles','Kids Books',2006,'Teach your child about numbers, and then have them write them here instead of on paper',14.99,'ISBN 0-00-000081-0'),(18,'Chicken or Egg','Charlie Conundromus','Table Books',2001,'600 pages on the classic debate that will leave you scratching your head!',9.49,'ISBN 0-00-000091-0'),(19,'Game Design 101','Ricky Rosenburbers','Scam Books',2017,'Make pong and space invaders like it\'s 1969!!!',33.99,'ISBN 0-00-000101-0'),(20,'Lists','Laura Lissy','Table Books',2000,'list and lists and lists of lists all in a list!',14.99,'ISBN 0-00-000201-0');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookseller`
--

DROP TABLE IF EXISTS `bookseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookseller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookseller`
--

LOCK TABLES `bookseller` WRITE;
/*!40000 ALTER TABLE `bookseller` DISABLE KEYS */;
INSERT INTO `bookseller` VALUES (1,'Amazonia','123 Jungle st. AZ 58008','3335558008','amazonia@email.ext'),(2,'Bookies','123 martin luther st. TX 58007','3335551232','bookies@email.ext'),(3,'Rando Guy','123 over there st. CT 08038','8605558008','randoguy@email.ext'),(4,'ebuy','123 online cir. CA 64300','3335453008','ebuy@email.ext'),(5,'Scam Books','1234 main st. po box 43 UT 09808','3587658008','scambooks@email.ext'),(6,'indubidubly','454 franklin st. SD 51108','3325888908','indubidubly@email.ext'),(7,'Dictionaries','999 boring st. DC 34008','399985408','dictionaries@email.ext'),(8,'Little Books','123 small st. AM 58003','3335557708','lilbooks@email.ext'),(9,'AmazoniaScam','123 Jungles st. AZ 58008','2335558008','amazoniascam@email.ext'),(10,'Knock Offs','43 hole dr. NC 58658','3335402008','knockoffs@email.ext'),(11,'Cheapo','123 broke st. KS 69008','3335551342','cheapo@email.ext');
/*!40000 ALTER TABLE `bookseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstock`
--

DROP TABLE IF EXISTS `bookstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstock` (
  `sellerid` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `conditionid` int NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`sellerid`,`title`,`conditionid`),
  KEY `conditionid_idx` (`conditionid`),
  KEY `sellerid_idx` (`sellerid`),
  CONSTRAINT `conditionid` FOREIGN KEY (`conditionid`) REFERENCES `bookcondition` (`conditionid`),
  CONSTRAINT `sellerid` FOREIGN KEY (`sellerid`) REFERENCES `bookseller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstock`
--

LOCK TABLES `bookstock` WRITE;
/*!40000 ALTER TABLE `bookstock` DISABLE KEYS */;
INSERT INTO `bookstock` VALUES (1,'1',4,349),(1,'2',1,1043),(1,'2',2,12),(1,'2',3,2),(1,'3',2,277),(1,'3',3,14),(1,'4',1,1574),(1,'5',1,118),(1,'5',5,83),(2,'12',2,103),(2,'19',1,304),(6,'11',2,70),(6,'18',4,18),(10,'9',3,4);
/*!40000 ALTER TABLE `bookstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payorder`
--

DROP TABLE IF EXISTS `payorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(75) NOT NULL,
  `total` float NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `purchaseDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payorder`
--

LOCK TABLES `payorder` WRITE;
/*!40000 ALTER TABLE `payorder` DISABLE KEYS */;
INSERT INTO `payorder` VALUES (1,'johnny1',19.99,'77 union st.','apalacha','AK','94323','2020-06-10 12:48:07','john','doe'),(2,'johnny1',14.99,'77 union st.','apalacha','AK','94323','2020-06-10 12:53:14','john','doe'),(3,'johnny1',19.99,'77 union st.','apalacha','AK','94323','2020-06-10 13:00:50','john','doe'),(4,'steven1',22.97,'1 abc st.','klondike','DE','77777','2020-06-10 15:05:56','Steven','McDonald'),(5,'jane1',45.48,'234 bore dr.','Moniqe','AL','23555','2020-06-10 16:21:57','jane','doe'),(6,'steven2',14.99,'12 conners st.','Middletown','CT','06555','2020-06-10 20:26:52','Steven','McDonald'),(7,'steven2',9.99,'12 conners st.','Middletown','CT','06555','2020-06-10 20:27:45','Steven','McDonald');
/*!40000 ALTER TABLE `payorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_accessed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(75) NOT NULL,
  `password` varchar(45) NOT NULL,
  `subscribed` tinyint NOT NULL DEFAULT '0',
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`) /*!80000 INVISIBLE */,
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john','doe','77 union st., apalacha, AK 94323','1015558765','2020-05-08 00:00:00','2020-06-08 09:06:23','johnny1','johnDoe1',1,'johndoe@email.com'),(2,'jane','doe','234 bore dr., Moniqe, AL 23555','1015559999','2020-05-08 00:00:00','2020-06-08 09:06:23','jane1','janeDoe1',0,'janedoe@email.com'),(3,'billy','bob','1 somewhere cir., Gooding, TN 88673','1015552345','2020-05-08 00:00:00','2020-06-08 09:06:23','billy1','billyBob1',0,'billybob@email.com'),(4,'susie','que','10 mazine dr., Hart, KS 79955','1015550909','2020-05-08 00:00:00','2020-06-08 09:06:23','susie1','susieQue1',1,'susieque@email.com'),(5,'jason','luinski','888 charles st., New York, NY 43658','1015559128','2020-05-08 00:00:00','2020-06-08 09:06:23','jason1','jasonLuinski1',0,'jasonluinski@email.com'),(6,'fredrick','erikson','6 abc st., Rocky, PA 54777','1014568765','2020-05-08 00:00:00','2020-06-08 09:06:23','fredrick1','fredrickErikson1',0,'fredrickerikson@email.com'),(7,'Steven','McDonald','1 abc st., klondike, DE 77777','8605554455','2020-06-10 15:04:24','2020-06-10 15:04:24','steven1','steven1234',1,'steveo@gmail.com'),(8,'Steven','McDonald','12 conners st., Middletown, CT 06555','8605554455','2020-06-10 18:41:23','2020-06-10 18:41:23','steven2','steven1234',0,'steveo1@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-10 20:46:25
