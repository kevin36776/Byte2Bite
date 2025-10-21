-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 21, 2025 at 03:02 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `byte2bite_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL,
  `RestaurantID` int DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `IsActive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `InventoryItems`
--

CREATE TABLE `InventoryItems` (
  `InventoryItemID` int NOT NULL,
  `RestaurantID` int DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `QuantityInStock` int NOT NULL DEFAULT '0',
  `Unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MenuItemIngredients`
--

CREATE TABLE `MenuItemIngredients` (
  `MenuItemID` int NOT NULL,
  `InventoryItemID` int NOT NULL,
  `QuantityNeeded` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MenuItems`
--

CREATE TABLE `MenuItems` (
  `MenuItemID` int NOT NULL,
  `RestaurantID` int DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `MenuItems`
--

INSERT INTO `MenuItems` (`MenuItemID`, `RestaurantID`, `Name`, `Description`, `Price`, `Category`, `IsAvailable`) VALUES
(1, 1, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(2, 1, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(3, 1, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(4, 1, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(5, 1, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(6, 1, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(7, 1, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(8, 1, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(9, 1, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(10, 1, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(11, 1, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(12, 1, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(13, 1, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(14, 1, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(15, 1, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(16, 1, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(17, 1, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(18, 1, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(19, 1, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(20, 1, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(21, 1, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(22, 1, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(23, 1, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(24, 1, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(25, 2, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(26, 2, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(27, 2, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(28, 2, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(29, 2, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(30, 2, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(31, 2, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(32, 2, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(33, 2, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(34, 2, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(35, 2, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(36, 2, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(37, 2, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(38, 2, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(39, 2, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(40, 2, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(41, 2, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(42, 2, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(43, 2, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(44, 2, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(45, 2, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(46, 2, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(47, 2, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(48, 2, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(49, 3, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(50, 3, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(51, 3, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(52, 3, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(53, 3, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(54, 3, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(55, 3, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(56, 3, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(57, 3, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(58, 3, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(59, 3, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(60, 3, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(61, 3, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(62, 3, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(63, 3, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(64, 3, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(65, 3, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(66, 3, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(67, 3, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(68, 3, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(69, 3, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(70, 3, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(71, 3, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(72, 3, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(73, 4, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(74, 4, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(75, 4, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(76, 4, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(77, 4, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(78, 4, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(79, 4, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(80, 4, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(81, 4, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(82, 4, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(83, 4, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(84, 4, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(85, 4, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(86, 4, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(87, 4, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(88, 4, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(89, 4, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(90, 4, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(91, 4, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(92, 4, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(93, 4, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(94, 4, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(95, 4, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(96, 4, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(97, 5, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(98, 5, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(99, 5, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(100, 5, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(101, 5, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(102, 5, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(103, 5, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(104, 5, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(105, 5, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(106, 5, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(107, 5, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(108, 5, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(109, 5, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(110, 5, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(111, 5, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(112, 5, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(113, 5, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(114, 5, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(115, 5, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(116, 5, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(117, 5, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(118, 5, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(119, 5, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(120, 5, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(121, 6, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(122, 6, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(123, 6, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(124, 6, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(125, 6, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(126, 6, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(127, 6, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(128, 6, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(129, 6, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(130, 6, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(131, 6, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(132, 6, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(133, 6, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(134, 6, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(135, 6, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(136, 6, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(137, 6, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(138, 6, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(139, 6, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(140, 6, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(141, 6, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(142, 6, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(143, 6, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(144, 6, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(145, 7, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(146, 7, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(147, 7, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(148, 7, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(149, 7, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(150, 7, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(151, 7, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(152, 7, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(153, 7, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(154, 7, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(155, 7, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(156, 7, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(157, 7, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(158, 7, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(159, 7, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(160, 7, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(161, 7, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(162, 7, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(163, 7, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(164, 7, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(165, 7, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(166, 7, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(167, 7, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(168, 7, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(169, 8, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(170, 8, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(171, 8, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(172, 8, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(173, 8, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(174, 8, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(175, 8, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(176, 8, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(177, 8, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(178, 8, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(179, 8, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(180, 8, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(181, 8, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(182, 8, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(183, 8, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(184, 8, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(185, 8, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(186, 8, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(187, 8, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(188, 8, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(189, 8, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(190, 8, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(191, 8, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(192, 8, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(193, 9, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(194, 9, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(195, 9, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(196, 9, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(197, 9, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(198, 9, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(199, 9, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(200, 9, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(201, 9, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(202, 9, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(203, 9, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(204, 9, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(205, 9, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(206, 9, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(207, 9, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(208, 9, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(209, 9, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(210, 9, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(211, 9, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(212, 9, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(213, 9, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(214, 9, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(215, 9, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(216, 9, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(217, 10, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(218, 10, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(219, 10, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(220, 10, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(221, 10, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(222, 10, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(223, 10, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(224, 10, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(225, 10, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(226, 10, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(227, 10, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(228, 10, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(229, 10, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(230, 10, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(231, 10, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(232, 10, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(233, 10, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(234, 10, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(235, 10, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(236, 10, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(237, 10, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(238, 10, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(239, 10, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(240, 10, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(241, 11, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(242, 11, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(243, 11, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(244, 11, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(245, 11, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(246, 11, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(247, 11, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(248, 11, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(249, 11, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(250, 11, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(251, 11, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(252, 11, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(253, 11, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(254, 11, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(255, 11, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(256, 11, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(257, 11, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(258, 11, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(259, 11, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(260, 11, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(261, 11, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(262, 11, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(263, 11, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(264, 11, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1),
(265, 12, 'Carne Asada Tacos', 'Three tacos with grilled steak, cilantro, and onions on corn tortillas. Served with rice and beans.', 14.99, 'Tacos', 1),
(266, 12, 'Al Pastor Tacos', 'Marinated pork with pineapple, cilantro, and onions on soft corn tortillas.', 13.99, 'Tacos', 1),
(267, 12, 'Carnitas Tacos', 'Slow-cooked pork topped with onions and cilantro, served with tomatillo salsa.', 13.49, 'Tacos', 1),
(268, 12, 'Pollo Asado Tacos', 'Grilled chicken tacos with lettuce, pico de gallo, and chipotle crema.', 12.99, 'Tacos', 1),
(269, 12, 'Barbacoa Tacos', 'Tender shredded beef tacos served with cilantro, onion, and lime.', 13.99, 'Tacos', 1),
(270, 12, 'Fish Tacos', 'Three soft tacos filled with crispy fish, cabbage slaw, and spicy crema.', 14.49, 'Tacos', 1),
(271, 12, 'Shrimp Tacos', 'Grilled shrimp with avocado, cabbage, and chipotle mayo on flour tortillas.', 15.49, 'Tacos', 1),
(272, 12, 'Veggie Tacos', 'Grilled peppers, onions, zucchini, and mushrooms topped with queso fresco.', 12.49, 'Tacos', 1),
(273, 12, 'Birria Tacos', 'Crispy beef tacos with melted cheese, served with consomé for dipping.', 16.49, 'Tacos', 1),
(274, 12, 'Street Tacos Combo', 'Choice of three tacos: asada, pastor, or carnitas. Served with rice and beans.', 15.99, 'Tacos', 1),
(275, 12, 'Classic Beef Burrito', 'Ground beef, rice, beans, cheese, and red enchilada sauce wrapped in a flour tortilla.', 12.99, 'Burritos', 1),
(276, 12, 'Chicken Burrito', 'Grilled chicken, rice, black beans, pico de gallo, and sour cream in a flour tortilla.', 12.49, 'Burritos', 1),
(277, 12, 'Carnitas Burrito', 'Slow-roasted pork with rice, pinto beans, cheese, and verde sauce.', 13.49, 'Burritos', 1),
(278, 12, 'Carne Asada Burrito', 'Marinated steak with cilantro-lime rice, beans, cheese, and guacamole.', 14.99, 'Burritos', 1),
(279, 12, 'Veggie Burrito', 'Grilled veggies, rice, beans, corn, and queso fresco in a spinach tortilla.', 11.99, 'Burritos', 1),
(280, 12, 'Fajita Burrito', 'Grilled steak or chicken with peppers, onions, rice, and melted cheese.', 14.49, 'Burritos', 1),
(281, 12, 'California Burrito', 'Steak, fries, cheese, pico de gallo, and sour cream wrapped in a large tortilla.', 15.99, 'Burritos', 1),
(282, 12, 'Burrito Supreme', 'Beef burrito topped with enchilada sauce, melted cheese, lettuce, tomato, sour cream, and guacamole.', 16.49, 'Burritos', 1),
(283, 12, 'Chorizo Burrito', 'Spicy Mexican sausage with eggs, cheese, and potatoes in a warm flour tortilla.', 13.49, 'Burritos', 1),
(284, 12, 'Wet Burrito', 'Large burrito smothered in red or green sauce and melted cheese, with rice and beans.', 16.99, 'Burritos', 1),
(285, 12, 'Burrito Bowl', 'Deconstructed burrito with choice of protein, rice, beans, veggies, and toppings.', 12.99, 'Bowls', 1),
(286, 12, 'Breakfast Burrito', 'Scrambled eggs, bacon, potatoes, cheese, and pico de gallo wrapped in a warm tortilla.', 10.99, 'Breakfast', 1),
(287, 12, 'Mini Tacos', 'Five mini tacos with your choice of meat, topped with cilantro and onions.', 11.99, 'Tacos', 1),
(288, 12, 'Mi Casa Burrito Combo', 'One large burrito served with a side of rice, refried beans, and small salad.', 15.99, 'Burritos', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `price`, `category`) VALUES
(1, 'Chicken Burrito', 8.00, 'Main'),
(2, 'Chicken Taco', 3.00, 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `OrderItems`
--

CREATE TABLE `OrderItems` (
  `OrderItemID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `MenuItemID` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `PricePerItem` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `RestaurantID` int DEFAULT NULL,
  `OrderTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TotalPrice` decimal(10,2) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `PaymentID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `PaymentTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `TransactionID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Restaurants`
--

CREATE TABLE `Restaurants` (
  `RestaurantID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Restaurants`
--

INSERT INTO `Restaurants` (`RestaurantID`, `Name`, `Address`, `PhoneNumber`) VALUES
(1, 'Mi Casa Chicago North', '1234 W Irving Park Rd, Chicago, IL 60613', '773-555-1010'),
(2, 'Mi Casa Greektown', '456 S Halsted St, Chicago, IL 60607', '312-555-2020'),
(3, 'Mi Casa River North', '789 N Clark St, Chicago, IL 60654', '312-555-3030'),
(4, 'Mi Casa Skokie', '1025 E Dempster St, Skokie, IL 60077', '847-555-4040'),
(5, 'Mi Casa Elmhurst', '250 W North Ave, Elmhurst, IL 60126', '630-555-5050'),
(6, 'Mi Casa Oak Park', '317 W Lake St, Oak Park, IL 60301', '708-555-6060'),
(7, 'Mi Casa Downers Grove', '842 Main St, Downers Grove, IL 60515', '630-555-7070'),
(8, 'Mi Casa Lombard', '210 S Main St, Lombard, IL 60148', '630-555-8080'),
(9, 'Mi Casa Glen Ellyn', '678 Roosevelt Rd, Glen Ellyn, IL 60137', '630-555-9090'),
(10, 'Mi Casa Wicker Park', '1550 N Milwaukee Ave, Chicago, IL 60647', '773-555-1111'),
(11, 'Mi Casa Downtown', '432 W Randolph St, Chicago, IL 60606', '312-555-1212'),
(12, 'Mi Casa Naperville', '920 Ogden Ave, Naperville, IL 60563', '630-555-1313');

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `RestaurantID` (`RestaurantID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `InventoryItems`
--
ALTER TABLE `InventoryItems`
  ADD PRIMARY KEY (`InventoryItemID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `MenuItemIngredients`
--
ALTER TABLE `MenuItemIngredients`
  ADD PRIMARY KEY (`MenuItemID`,`InventoryItemID`),
  ADD KEY `InventoryItemID` (`InventoryItemID`);

--
-- Indexes for table `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD PRIMARY KEY (`MenuItemID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `MenuItemID` (`MenuItemID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `Restaurants`
--
ALTER TABLE `Restaurants`
  ADD PRIMARY KEY (`RestaurantID`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `RoleName` (`RoleName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `CustomerID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `EmployeeID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `InventoryItems`
--
ALTER TABLE `InventoryItems`
  MODIFY `InventoryItemID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MenuItems`
--
ALTER TABLE `MenuItems`
  MODIFY `MenuItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `OrderItems`
--
ALTER TABLE `OrderItems`
  MODIFY `OrderItemID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `PaymentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Restaurants`
--
ALTER TABLE `Restaurants`
  MODIFY `RestaurantID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `RoleID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurants` (`RestaurantID`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`RoleID`);

--
-- Constraints for table `InventoryItems`
--
ALTER TABLE `InventoryItems`
  ADD CONSTRAINT `inventoryitems_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurants` (`RestaurantID`);

--
-- Constraints for table `MenuItemIngredients`
--
ALTER TABLE `MenuItemIngredients`
  ADD CONSTRAINT `menuitemingredients_ibfk_1` FOREIGN KEY (`MenuItemID`) REFERENCES `MenuItems` (`MenuItemID`),
  ADD CONSTRAINT `menuitemingredients_ibfk_2` FOREIGN KEY (`InventoryItemID`) REFERENCES `InventoryItems` (`InventoryItemID`);

--
-- Constraints for table `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurants` (`RestaurantID`);

--
-- Constraints for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`MenuItemID`) REFERENCES `MenuItems` (`MenuItemID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `Restaurants` (`RestaurantID`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
