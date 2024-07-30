-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog_db
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS blogs;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf32_bin DEFAULT NULL,
  `content` mediumtext COLLATE utf32_bin,
  `subtitle` varchar(150) COLLATE utf32_bin DEFAULT NULL,
  `imagepath` varchar(200) COLLATE utf32_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES blogs WRITE;
/*!40000 ALTER TABLE blogs DISABLE KEYS */;
INSERT INTO blogs VALUES (2,'Homemade Pizza Night yes','Transform your kitchen into a pizzeria with our homemade pizza night guide. From dough to toppings, we show you how to make the perfect pie.','Create your own pizza masterpiece at home! very good indeed !','besthomemadepizzahero.jpg'),(3,'Family BBQ Favorites','Fire up the grill and enjoy a family BBQ feast!\r\nIt is nice enjoy.','Gather your loved ones for a sizzling BBQ cookout. From juicy burgers to tender ribs, discover our favorite recipes for the grill.','family_bbq.jpg'),(4,'Comforting Soup Recipes','Nothing beats a bowl of homemade soup on a chilly day. Explore our collection of cozy soup recipes, perfect for any occasion.','Warm up with a bowl of comforting soup','boeuf_cuit_aux_herbes_de_provences.jpg'),(6,'Sweet Treats Galore','Satisfy your cravings with our irresistible dessert recipes. From decadent cakes to creamy puddings, we have something for every sweet tooth.','Indulge your sweet tooth with our dessert recipes','burger_aux_produits_frais_de_saison.jpg'),(7,'Weeknight Dinner Solutions','Make dinner time stress-free with our collection of quick and easy recipes. With minimal prep and cook time, you\'ll have a delicious meal on the table in no time.','Quick and easy dinner ideas for busy nights','agneau_accompagne_dune_salade_du-jardin.jpg'),(8,'Vegetarian Delights','Discover the flavors of vegetarian cooking with our mouthwatering recipes. From hearty mains to vibrant sides, there\'s something for everyone to enjoy.','Explore the world of vegetarian cuisine','un_saute_de_concombre_poivron_et_oignon_confits.jpg'),(9,'Baking Basics 101','Learn the essentials of baking with our comprehensive guide. From measuring ingredients to mastering techniques, we\'ll help you become a confident baker.','Master the art of baking with our beginner-friendly guide','pain_facon_sud_ouest_version_mini.jpg'),(10,'Summer Grilling Essentials','Fire up the grill and make the most of summer with our grilling essentials. From marinades to side dishes, we have everything you need for the ultimate BBQ experience.','Get ready for summer BBQ season with our grilling tips','summerbbq.jpg'),(11,'Delicious Pasta Recipe','Try this easy pasta recipe today!','Cook up a delicious bowl of pasta with our simple recipe. Whether you prefer spaghetti, penne, or linguine, we have you covered.','deliciouspasta.jpg');
/*!40000 ALTER TABLE blogs ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'blog_db'
--

--
-- Dumping routines for database 'blog_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-30 13:47:23
