-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: students_management
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `course1` varchar(200) DEFAULT NULL,
  `course2` varchar(200) DEFAULT NULL,
  `course3` varchar(200) DEFAULT NULL,
  `course4` varchar(200) DEFAULT NULL,
  `course5` varchar(200) DEFAULT NULL,
  `course6` varchar(200) NOT NULL,
  `course7` varchar(200) NOT NULL,
  `course8` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_id` (`student_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,4,1,'Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network'),(2,2,1,'Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network'),(3,5,1,'Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network'),(4,6,1,'Probability and Statistics','Computer Network','Economic Survival 2: Business Launch / Internship Experience','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network'),(5,7,1,'Computer Network','Probability and Statistics','Economic Survival 2: Business Launch / Internship Experience','Linear Algebra','Linear Algebra','Object Oriented and Visual Programming','Database System','Server-Side Internet Programming'),(6,8,1,'Probability and Statistics','Economic Survival 2: Business Launch / Internship Experience','Computer Network','Probability and Statistics','Computer Network','Object Oriented and Visual Programming','Economic Survival 2: Business Launch / Internship Experience','Database System'),(7,4,2,'Probability and Statistics','Probability and Statistics','Economic Survival 2: Business Launch / Internship Experience','Linear Algebra','Object Oriented and Visual Programming','Fluency and Speed Development','Database System','Server-Side Internet Programming'),(8,4,3,'Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network','Computer Network');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `semester` int NOT NULL,
  `course1` varchar(200) NOT NULL,
  `score1` double NOT NULL,
  `course2` varchar(200) NOT NULL,
  `score2` double NOT NULL,
  `course3` varchar(200) NOT NULL,
  `score3` double NOT NULL,
  `course4` varchar(200) NOT NULL,
  `score4` double NOT NULL,
  `course5` varchar(200) NOT NULL,
  `score5` double NOT NULL,
  `course6` varchar(200) NOT NULL,
  `score6` double NOT NULL,
  `course7` varchar(200) NOT NULL,
  `score7` double NOT NULL,
  `course8` varchar(200) NOT NULL,
  `score8` double NOT NULL,
  `average` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stu_id` (`student_id`),
  CONSTRAINT `fk_stu_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `date_of_birth` date NOT NULL,
  `Religion` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `father_name` varchar(150) NOT NULL,
  `mother_name` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `image_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2,'Park Jisung','2002-02-02','Catholic','Male','Jisung@gmail.com','46777','idk','idk','Korean','C:\\Users\\Nadine\\OneDrive\\Documents\\Pictures\\Hakuna Matata.jpeg'),(3,'Nadine','2006-11-05','Protestant','Female','nad@gmail.com','0812338847','john doe','jane doe','u can guess','C:\\Users\\Nadine\\OneDrive\\Documents\\Pictures\\Wallpaper 1920x1080 Free Download.jpeg'),(4,'Taehyung','1995-05-11','Protestant','Male','tae@gmail.com','6382902','idk','idk ','korean','C:\\Users\\Nadine\\OneDrive\\Documents\\Pictures\\✨♥️.jpg'),(5,'cha','2025-05-02','Protestant','Female','dwdew','00887','nbvj','mhvjhmhv','bvhf','C:\\Users\\Nadine\\Downloads\\✁.jpeg'),(6,'Mike wheeler','1985-05-09','Protestant','Male','mike1@gmail.com','6372894',' Ted Wheeler',' Karen Wheeler ','2530 Jalan Maple , Hawkins , Indiana','C:\\Users\\Nadine\\Downloads\\Mike Wheeler (16 Days until S3).jpg'),(7,'Dustin Henderson','1971-05-29','Protestant','Male','Dustybun@gmail.com','8725182','Walter Henderson','Claudia Henderson','Hawkins, Indiana','C:\\Users\\Nadine\\Downloads\\⚘「?????? ?????????」.jpg'),(8,'Eleven','1971-06-05','Protestant','Female','el@gmail.com','6536280','Andrew rich','Teresa Ives','Hawkins, Indiana','C:\\Users\\Nadine\\Downloads\\elevennnn.jpg');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28  6:51:42
