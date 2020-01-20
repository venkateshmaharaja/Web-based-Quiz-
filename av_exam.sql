-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2019 at 12:48 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `av_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `usertype`) VALUES
('admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `tid` int(20) NOT NULL,
  `qid` int(20) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `ans1` varchar(250) NOT NULL,
  `ans2` varchar(250) NOT NULL,
  `ans3` varchar(250) NOT NULL,
  `ans4` varchar(250) NOT NULL,
  `correct_ans` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`tid`, `qid`, `question`, `ans1`, `ans2`, `ans3`, `ans4`, `correct_ans`) VALUES
(1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1'),
(1, 2, 'what is yopur name', 'aaa', 'bbb', 'ccc', 'ddd', '2'),
(1, 3, 'fav color ?', 'red', 'blue', 'yellow', 'green', '2'),
(1, 4, 'dogs fav food ?', 'bone', 'biscute', 'chocolate', 'maggi', '1'),
(1, 5, 'sound fav pic ?', 'dog', 'monkey', 'flower', 'cow', '3'),
(2, 31, 'how old are you ? ', '18', '19', '20', '21', '3'),
(2, 32, 'fav animal ?', 'tiger', 'lion', 'elephant', 'monky', '1'),
(2, 33, 'fist programing lang', 'cobal', 'fotran', 'c', 'basic', '4'),
(2, 34, 'system.______.print ?', 'in', 'out', 'on', 'go', '2');

-- --------------------------------------------------------

--
-- Table structure for table `questions_1`
--

CREATE TABLE `questions_1` (
  `tid` int(20) NOT NULL,
  `qid` int(20) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `ans1` varchar(250) NOT NULL,
  `ans2` varchar(250) NOT NULL,
  `ans3` varchar(250) NOT NULL,
  `ans4` varchar(250) NOT NULL,
  `correct_ans` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_1`
--

INSERT INTO `questions_1` (`tid`, `qid`, `question`, `ans1`, `ans2`, `ans3`, `ans4`, `correct_ans`) VALUES
(1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1'),
(1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4'),
(1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4'),
(1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1'),
(1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3'),
(1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4'),
(1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2'),
(1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2'),
(1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2'),
(1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2'),
(1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3'),
(1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2'),
(1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1'),
(1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2'),
(1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2'),
(1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1'),
(1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1'),
(1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4'),
(1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2'),
(1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3'),
(2, 21, 'When an iron nail gets rusted, iron oxide is formed ', 'without any change in the weight of the nail ', 'with decrease in the weight of the nail ', 'with increase in the weight of the nail ', 'without any change in colour or weight of the nail ', '3'),
(2, 22, 'Galvanised iron sheets have a coating of', 'lead ', 'chromium ', 'zinc ', 'tin ', '3'),
(2, 23, 'The group of metals Fe, Co, Ni may best called as', 'transition metals ', 'main group metals ', 'alkali metals ', 'rare metals ', '1'),
(2, 24, 'Heavy water is', 'deuterium oxide ', 'PH7 ', 'rain water ', 'tritium oxide ', '1'),
(2, 25, 'The element common to all acids is', 'hydrogen ', 'carbon ', 'sulphur ', 'oxygen ', '1'),
(2, 26, 'Entomology is the science that studies', 'Behavior of human beings ', 'Insects', 'The origin and history of technical and scientific terms ', 'The formation of rocks ', '2'),
(2, 27, 'Garampani sanctuary is located at ', 'Junagarh, Gujarat ', 'Diphu, Assam ', 'Kohima, Nagaland ', 'Gangtok, Sikkim ', '2'),
(2, 28, 'For which of the following disciplines is Nobel Prize awarded?', 'Physics and Chemistry', 'Physiology or Medicine ', 'Literature, Peace and Economics ', 'All of the above ', '4'),
(2, 29, 'Fastest shorthand writer was', 'Dr. G. D. Bist ', 'J.R.D. Tata ', 'J.M. Tagore ', 'Khudada Khan ', '1'),
(2, 30, 'First human heart transplant operation conducted by Dr. Christiaan Barnard on Louis Washkansky, was conducted in ', '1968', '1967', '1969', '1965', '2'),
(2, 31, 'Golf player Vijay Singh belongs to which country? ', 'USA ', 'Fiji ', 'India ', 'UK ', '2'),
(2, 32, 'First Afghan War took place in ', '1839', '1843', '1833', '1835', '1'),
(2, 33, 'First China War was fought between', 'China and Britain ', 'China and France ', 'China and Egypt ', 'China and Greek ', '1'),
(2, 34, 'Federation Cup, World Cup, Allywyn International Trophy and Challenge Cup are awarded to winners of ', 'Tennis ', 'Volleyball ', 'Basketball', 'Cricket ', '2'),
(2, 35, 'Fire temple is the place of worship of which of the following religion? ', 'Taoism ', 'Judaism ', 'Zoroastrianism (Parsi Religion) ', 'Shintoism ', '3'),
(2, 36, 'Film and TV institute of India is located at ', 'Pune (Maharashtra) ', 'Rajkot (Gujarat) ', 'Pimpri (Maharashtra) ', 'Perambur (Tamilnadu) ', '1'),
(2, 37, 'What is part of a database that holds only one type of information? ', 'Report ', 'Field ', 'Record ', 'File ', '2'),
(2, 38, 'OS\' computer abbreviation usually means ? ', 'Order of Significance ', 'Operating System ', 'Optical Sensor ', 'Open Software ', '2'),
(2, 39, '.MOV\' extension refers usually to what kind of file?', 'Image file ', 'Animation/movie file ', 'Audio file ', 'MS Office document ', '2'),
(2, 40, 'Who developed Yahoo?', 'Dennis Ritchie & Ken Thompson ', 'David Filo & Jerry Yang ', 'Vint Cerf & Robert Kahn ', 'Steve Case & Jeff Bezos ', '2'),
(3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4'),
(3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3'),
(3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2'),
(3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4'),
(3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2'),
(3, 46, 'answer the below questions', '1', '2', '3', '4', '4'),
(3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1'),
(3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3'),
(3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4'),
(3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_history`
--

CREATE TABLE `quiz_history` (
  `id` int(11) NOT NULL,
  `std_name` varchar(250) NOT NULL,
  `aadhar_no` varchar(13) NOT NULL,
  `tid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `ans1` varchar(250) NOT NULL,
  `ans2` varchar(250) NOT NULL,
  `ans3` varchar(250) NOT NULL,
  `ans4` varchar(250) NOT NULL,
  `correct_ans` varchar(250) NOT NULL,
  `your_ans` varchar(250) NOT NULL,
  `mark` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_history`
--

INSERT INTO `quiz_history` (`id`, `std_name`, `aadhar_no`, `tid`, `qid`, `question`, `ans1`, `ans2`, `ans3`, `ans4`, `correct_ans`, `your_ans`, `mark`) VALUES
(1, 'VENKATESH A', '123456789012', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', '1', 0),
(2, 'VENKATESH A', '123456789012', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '1', 1),
(3, 'VENKATESH A', '123456789012', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', '1', 1),
(4, 'VENKATESH A', '123456789012', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '1', 0),
(5, 'VENKATESH A', '123456789012', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', '1', 0),
(6, 'VENKATESH A', '123456789012', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', '1', 0),
(7, 'VENKATESH A', '123456789012', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', '2', 1),
(8, 'VENKATESH A', '123456789012', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '2', 1),
(9, 'VENKATESH A', '123456789012', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', '1', 0),
(10, 'VENKATESH A', '123456789012', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', '1', 0),
(11, 'VENKATESH A', '123456789012', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', '1', 0),
(12, 'VENKATESH A', '123456789012', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '2', 1),
(13, 'VENKATESH A', '123456789012', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', 'A', 0),
(14, 'VENKATESH A', '123456789012', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', 'A', 0),
(15, 'VENKATESH A', '123456789012', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', 'A', 0),
(16, 'VENKATESH A', '123456789012', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', 'A', 0),
(17, 'VENKATESH A', '123456789012', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', 'A', 0),
(18, 'VENKATESH A', '123456789012', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', 'A', 0),
(19, 'VENKATESH A', '123456789012', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', 'A', 0),
(20, 'VENKATESH A', '123456789012', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', 'A', 0),
(21, 'VENKATESH A', '123456789012', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '1', 0),
(22, 'VENKATESH A', '123456789012', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '1', 0),
(23, 'VENKATESH A', '123456789012', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '1', 0),
(24, 'VENKATESH A', '123456789012', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '1', 0),
(25, 'VENKATESH A', '123456789012', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '1', 0),
(26, 'VENKATESH A', '123456789012', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '1', 0),
(27, 'VENKATESH A', '123456789012', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '1', 0),
(28, 'VENKATESH A', '123456789012', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '1', 1),
(29, 'VENKATESH A', '123456789012', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '1', 0),
(30, 'VENKATESH A', '123456789012', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '1', 0),
(31, 'KARTHIK A', '123456789014', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', '1', 0),
(32, 'KARTHIK A', '123456789014', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', '3', 1),
(33, 'KARTHIK A', '123456789014', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', '3', 0),
(34, 'KARTHIK A', '123456789014', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '4', 0),
(35, 'KARTHIK A', '123456789014', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', '1', 1),
(36, 'KARTHIK A', '123456789014', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '4', 0),
(37, 'KARTHIK A', '123456789014', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', '4', 0),
(38, 'KARTHIK A', '123456789014', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', 'A', 0),
(39, 'KARTHIK A', '123456789014', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '3', 0),
(40, 'KARTHIK A', '123456789014', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '4', 0),
(41, 'KARTHIK A', '123456789014', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', '1', 0),
(42, 'KARTHIK A', '123456789014', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', '2', 1),
(43, 'KARTHIK A', '123456789014', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '1', 0),
(44, 'KARTHIK A', '123456789014', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', '1', 0),
(45, 'KARTHIK A', '123456789014', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', '2', 0),
(46, 'KARTHIK A', '123456789014', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', 'A', 0),
(47, 'KARTHIK A', '123456789014', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', 'A', 0),
(48, 'KARTHIK A', '123456789014', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', 'A', 0),
(49, 'KARTHIK A', '123456789014', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', 'A', 0),
(50, 'KARTHIK A', '123456789014', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', 'A', 0),
(51, 'KARTHIK A', '123456789014', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '1', 0),
(52, 'KARTHIK A', '123456789014', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '1', 1),
(53, 'KARTHIK A', '123456789014', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '1', 0),
(54, 'KARTHIK A', '123456789014', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '1', 0),
(55, 'KARTHIK A', '123456789014', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '3', 0),
(56, 'KARTHIK A', '123456789014', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '2', 0),
(57, 'KARTHIK A', '123456789014', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '4', 0),
(58, 'KARTHIK A', '123456789014', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '4', 0),
(59, 'KARTHIK A', '123456789014', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '2', 1),
(60, 'KARTHIK A', '123456789014', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '3', 0),
(61, 'KARTHIK A', '123456789014', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '1', 0),
(62, 'KARTHIK A', '123456789014', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '1', 1),
(63, 'KARTHIK A', '123456789014', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '1', 0),
(64, 'KARTHIK A', '123456789014', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '3', 0),
(65, 'KARTHIK A', '123456789014', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '2', 0),
(66, 'KARTHIK A', '123456789014', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '1', 0),
(67, 'KARTHIK A', '123456789014', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '1', 0),
(68, 'KARTHIK A', '123456789014', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '1', 0),
(69, 'KARTHIK A', '123456789014', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '1', 0),
(70, 'KARTHIK A', '123456789014', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '1', 0),
(71, 'KARTHIK A', '123456789014', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '1', 0),
(72, 'KARTHIK A', '123456789014', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '1', 1),
(73, 'KARTHIK A', '123456789014', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '1', 0),
(74, 'KARTHIK A', '123456789014', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '3', 0),
(75, 'KARTHIK A', '123456789014', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '2', 0),
(76, 'KARTHIK A', '123456789014', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '1', 0),
(77, 'KARTHIK A', '123456789014', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '1', 0),
(78, 'KARTHIK A', '123456789014', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '1', 0),
(79, 'KARTHIK A', '123456789014', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '1', 0),
(80, 'KARTHIK A', '123456789014', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '1', 0),
(81, 'KOKILA', '1234567891', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', '1', 1),
(82, 'KOKILA', '1234567891', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', '2', 0),
(83, 'KOKILA', '1234567891', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '3', 0),
(84, 'KOKILA', '1234567891', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', 'A', 0),
(85, 'KOKILA', '1234567891', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', '2', 0),
(86, 'KOKILA', '1234567891', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '3', 1),
(87, 'KOKILA', '1234567891', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', '4', 0),
(88, 'KOKILA', '1234567891', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '4', 0),
(89, 'KOKILA', '1234567891', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '1', 0),
(90, 'KOKILA', '1234567891', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', 'A', 0),
(91, 'KOKILA', '1234567891', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', 'A', 0),
(92, 'KOKILA', '1234567891', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', 'A', 0),
(93, 'KOKILA', '1234567891', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', 'A', 0),
(94, 'KOKILA', '1234567891', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', 'A', 0),
(95, 'KOKILA', '1234567891', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', 'A', 0),
(96, 'KOKILA', '1234567891', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', 'A', 0),
(97, 'KOKILA', '1234567891', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', 'A', 0),
(98, 'KOKILA', '1234567891', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', 'A', 0),
(99, 'KOKILA', '1234567891', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', 'A', 0),
(100, 'KOKILA', '1234567891', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', 'A', 0),
(101, 'PAVITHRA', '524483744644', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', '3', 0),
(102, 'PAVITHRA', '524483744644', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', '3', 0),
(103, 'PAVITHRA', '524483744644', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', '2', 0),
(104, 'PAVITHRA', '524483744644', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', '2', 1),
(105, 'PAVITHRA', '524483744644', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '4', 0),
(106, 'PAVITHRA', '524483744644', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '1', 0),
(107, 'PAVITHRA', '524483744644', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', '2', 0),
(108, 'PAVITHRA', '524483744644', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', 'A', 0),
(109, 'PAVITHRA', '524483744644', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', 'A', 0),
(110, 'PAVITHRA', '524483744644', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', 'A', 0),
(111, 'PAVITHRA', '524483744644', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', 'A', 0),
(112, 'PAVITHRA', '524483744644', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', 'A', 0),
(113, 'PAVITHRA', '524483744644', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', 'A', 0),
(114, 'PAVITHRA', '524483744644', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', 'A', 0),
(115, 'PAVITHRA', '524483744644', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', 'A', 0),
(116, 'PAVITHRA', '524483744644', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', 'A', 0),
(117, 'PAVITHRA', '524483744644', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', 'A', 0),
(118, 'PAVITHRA', '524483744644', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', 'A', 0),
(119, 'PAVITHRA', '524483744644', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', 'A', 0),
(120, 'PAVITHRA', '524483744644', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', 'A', 0),
(121, 'KOKILA', '1234567891', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '1', 0),
(122, 'KOKILA', '1234567891', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '2', 1),
(123, 'KOKILA', '1234567891', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '2', 0),
(124, 'KOKILA', '1234567891', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '2', 0),
(125, 'KOKILA', '1234567891', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '4', 1),
(126, 'KOKILA', '1234567891', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '2', 0),
(127, 'KOKILA', '1234567891', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '2', 0),
(128, 'KOKILA', '1234567891', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '3', 0),
(129, 'KOKILA', '1234567891', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '2', 1),
(130, 'KOKILA', '1234567891', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '2', 0),
(131, 'PAVITHRA', '524483744644', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '3', 0),
(132, 'PAVITHRA', '524483744644', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '2', 0),
(133, 'PAVITHRA', '524483744644', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '3', 1),
(134, 'PAVITHRA', '524483744644', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '3', 0),
(135, 'PAVITHRA', '524483744644', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '3', 0),
(136, 'PAVITHRA', '524483744644', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '3', 0),
(137, 'PAVITHRA', '524483744644', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '3', 0),
(138, 'PAVITHRA', '524483744644', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '2', 1),
(139, 'PAVITHRA', '524483744644', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '2', 0),
(140, 'PAVITHRA', '524483744644', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '2', 0),
(141, 'PAVITHRA', '524483744644', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', 'A', 0),
(142, 'PAVITHRA', '524483744644', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', 'A', 0),
(143, 'PAVITHRA', '524483744644', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', 'A', 0),
(144, 'PAVITHRA', '524483744644', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', 'A', 0),
(145, 'PAVITHRA', '524483744644', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', 'A', 0),
(146, 'PAVITHRA', '524483744644', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', 'A', 0),
(147, 'PAVITHRA', '524483744644', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', 'A', 0),
(148, 'PAVITHRA', '524483744644', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', 'A', 0),
(149, 'PAVITHRA', '524483744644', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', 'A', 0),
(150, 'PAVITHRA', '524483744644', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', 'A', 0),
(151, 'PAVITHRA', '524483744644', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', 'A', 0),
(152, 'PAVITHRA', '524483744644', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', 'A', 0),
(153, 'PAVITHRA', '524483744644', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', 'A', 0),
(154, 'PAVITHRA', '524483744644', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', 'A', 0),
(155, 'PAVITHRA', '524483744644', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', 'A', 0),
(156, 'PAVITHRA', '524483744644', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', 'A', 0),
(157, 'PAVITHRA', '524483744644', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', 'A', 0),
(158, 'PAVITHRA', '524483744644', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', 'A', 0),
(159, 'PAVITHRA', '524483744644', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', 'A', 0),
(160, 'PAVITHRA', '524483744644', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', 'A', 0),
(161, 'PAVI', '6463855469', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '2', 0),
(162, 'PAVI', '6463855469', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', '3', 0),
(163, 'PAVI', '6463855469', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', '2', 0),
(164, 'PAVI', '6463855469', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', '2', 1),
(165, 'PAVI', '6463855469', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', '3', 0),
(166, 'PAVI', '6463855469', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '3', 0),
(167, 'PAVI', '6463855469', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', '1', 0),
(168, 'PAVI', '6463855469', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', '1', 1),
(169, 'PAVI', '6463855469', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', '1', 0),
(170, 'PAVI', '6463855469', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', '2', 0),
(171, 'PAVI', '6463855469', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', '1', 1),
(172, 'PAVI', '6463855469', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '3', 0),
(173, 'PAVI', '6463855469', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', '3', 1),
(174, 'PAVI', '6463855469', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', '4', 1),
(175, 'PAVI', '6463855469', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', '2', 1),
(176, 'PAVI', '6463855469', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '2', 1),
(177, 'PAVI', '6463855469', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', '3', 0),
(178, 'PAVI', '6463855469', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', '1', 0),
(179, 'PAVI', '6463855469', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '2', 0),
(180, 'PAVI', '6463855469', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', '1', 0),
(181, 'PAVI', '6463855469', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '3', 0),
(182, 'PAVI', '6463855469', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '2', 0),
(183, 'PAVI', '6463855469', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '2', 1),
(184, 'PAVI', '6463855469', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '1', 1),
(185, 'PAVI', '6463855469', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '1', 0),
(186, 'PAVI', '6463855469', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '1', 0),
(187, 'PAVI', '6463855469', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '1', 0),
(188, 'PAVI', '6463855469', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '2', 0),
(189, 'PAVI', '6463855469', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '2', 0),
(190, 'PAVI', '6463855469', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '2', 0),
(191, 'VIJAY', '1231231231', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '1', 1),
(192, 'VIJAY', '1231231231', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', '1', 0),
(193, 'VIJAY', '1231231231', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', '1', 1),
(194, 'VIJAY', '1231231231', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', '2', 0),
(195, 'VIJAY', '1231231231', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '3', 1),
(196, 'VIJAY', '1231231231', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '2', 1),
(197, 'VIJAY', '1231231231', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '2', 1),
(198, 'VIJAY', '1231231231', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', '4', 0),
(199, 'VIJAY', '1231231231', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', '1', 0),
(200, 'VIJAY', '1231231231', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', '1', 0),
(201, 'VIJAY', '1231231231', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', '1', 0),
(202, 'VIJAY', '1231231231', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', '1', 1),
(203, 'VIJAY', '1231231231', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', '1', 0),
(204, 'VIJAY', '1231231231', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', '2', 1),
(205, 'VIJAY', '1231231231', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', '2', 0),
(206, 'VIJAY', '1231231231', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', '1', 0),
(207, 'VIJAY', '1231231231', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', '3', 0),
(208, 'VIJAY', '1231231231', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', '1', 0),
(209, 'VIJAY', '1231231231', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', '1', 0),
(210, 'VIJAY', '1231231231', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '3', 0),
(211, 'VIJAY', '1231231231', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '2', 1),
(212, 'VIJAY', '1231231231', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '1', 0),
(213, 'VIJAY', '1231231231', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '3', 0),
(214, 'VIJAY', '1231231231', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '3', 0),
(215, 'VIJAY', '1231231231', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '1', 1),
(216, 'VIJAY', '1231231231', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '1', 0),
(217, 'VIJAY', '1231231231', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '3', 1),
(218, 'VIJAY', '1231231231', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '1', 0),
(219, 'VIJAY', '1231231231', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '4', 1),
(220, 'VIJAY', '1231231231', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '4', 1),
(221, 'KUMAR', '454548415415', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '1', 0),
(222, 'KUMAR', '454548415415', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', '1', 0),
(223, 'KUMAR', '454548415415', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '1', 0),
(224, 'KUMAR', '454548415415', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', '1', 0),
(225, 'KUMAR', '454548415415', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '3', 0),
(226, 'KUMAR', '454548415415', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', '1', 1),
(227, 'KUMAR', '454548415415', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', '3', 0),
(228, 'KUMAR', '454548415415', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', '2', 0),
(229, 'KUMAR', '454548415415', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', '2', 0),
(230, 'KUMAR', '454548415415', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', '1', 0),
(231, 'KUMAR', '454548415415', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '3', 0),
(232, 'KUMAR', '454548415415', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', '1', 1),
(233, 'KUMAR', '454548415415', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', '1', 1),
(234, 'KUMAR', '454548415415', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', '1', 0),
(235, 'KUMAR', '454548415415', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', '1', 0),
(236, 'KUMAR', '454548415415', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', '1', 0),
(237, 'KUMAR', '454548415415', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', '1', 0),
(238, 'KUMAR', '454548415415', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', '2', 1),
(239, 'KUMAR', '454548415415', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '1', 0),
(240, 'KUMAR', '454548415415', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', '1', 0),
(241, 'KUMAR', '454548415415', 3, 43, 'The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:', '15', '16', '18', '25', '2', '1', 0),
(242, 'KUMAR', '454548415415', 3, 42, 'Two ships are sailing in the sea on the two sides of a lighthouse. The angle of elevation of the top of the lighthouse is observed from the ships are 30° and 45° respectively. If the lighthouse is 100 m high, the distance between the two ships is:', '173 m ', '200 m ', '273 m ', '300 m ', '3', '1', 0),
(243, 'KUMAR', '454548415415', 3, 49, 'In a mixture 60 litres, the ratio of milk and water 2 : 1. If this ratio is to be 1 : 2, then the quantity of water to be further added is:', '20 litres ', '30 litres ', '40 litres', '60 litres ', '4', '4', 1),
(244, 'KUMAR', '454548415415', 3, 50, 'If 0.75 : x :: 5 : 8, then x is equal to:', '1.12', '1.2', '1.25', '1.3', '2', '1', 0),
(245, 'KUMAR', '454548415415', 3, 41, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', '120 metres ', '180 metres ', '324 metres ', '150 metres ', '4', '1', 0),
(246, 'KUMAR', '454548415415', 3, 47, 'BCB, DED, FGF, HIH, ___', 'JKJ ', 'HJH ', 'IJI ', 'JHJ ', '1', '4', 0),
(247, 'KUMAR', '454548415415', 3, 46, 'answer the below questions', '1', '2', '3', '4', '4', '1', 0),
(248, 'KUMAR', '454548415415', 3, 45, 'A, B and C can do a piece of work in 20, 30 and 60 days respectively. In how many days can A do the work if he is assisted by B and C on every third day?', '12 days ', '15 days ', '16 days ', '18 days ', '2', '3', 0),
(249, 'KUMAR', '454548415415', 3, 44, 'What was the day of the week on 28th May, 2006? ', 'Thursday ', 'Friday ', 'Saturday ', 'Sunday ', '4', '3', 0),
(250, 'KUMAR', '454548415415', 3, 48, 'A sum of money is to be distributed among A, B, C, D in the proportion of 5 : 2 : 4 : 3. If C gets Rs. 1000 more than D, what is B\'s share?', 'Rs.500.00', 'Rs.1,500.00', 'Rs.2,000.00', 'None of these ', '3', '1', 0),
(251, 'VICKY', '121212152415', 1, 10, 'Brass gets discoloured in air because of the presence of which of the following gases in air?', 'Oxygen ', 'Hydrogen sulphide ', 'Carbon dioxide ', 'Nitrogen ', '2', '1', 0),
(252, 'VICKY', '121212152415', 1, 5, 'The inert gas which is substituted for nitrogen in the air used by deep sea divers for breathing, is', 'Argon ', 'Xenon', 'Helium ', 'Krypton ', '3', '1', 0),
(253, 'VICKY', '121212152415', 1, 6, 'The gases used in different types of welding would include ', 'oxygen and hydrogen ', 'oxygen, hydrogen, acetylene and nitrogen ', 'oxygen, acetylene and argon ', 'oxygen and acetylene ', '4', '1', 0),
(254, 'VICKY', '121212152415', 1, 2, 'The variety of coal in which the deposit contains recognisable traces of the original plant material is ', 'bitumen ', 'anthracite ', 'lignite ', 'peat ', '4', '1', 0),
(255, 'VICKY', '121212152415', 1, 12, 'Chlorophyll is a naturally occurring chelate compound in which central metal is ', 'copper ', 'magnesium ', 'iron ', 'calcium ', '2', '2', 1),
(256, 'VICKY', '121212152415', 1, 3, 'Tetraethyl lead is used as ', 'pain killer ', 'fire extinguisher ', 'mosquito repellent ', 'petrol additive ', '4', '2', 0),
(257, 'VICKY', '121212152415', 1, 14, 'Which of the following metals forms an amalgam with other metals? ', 'Tin ', 'Mercury ', 'Lead ', 'Zinc', '2', '3', 0),
(258, 'VICKY', '121212152415', 1, 20, 'The hardest substance available on earth is ', 'Gold ', 'Iron ', 'Diamond ', 'Platinum ', '3', '1', 0),
(259, 'VICKY', '121212152415', 1, 19, 'Bromine is a', 'black solid ', 'red liquid ', 'colourless gas ', 'highly inflammable gas ', '2', '1', 0),
(260, 'VICKY', '121212152415', 1, 17, 'Washing soda is the common name for ', 'Sodium carbonate ', 'Calcium bicarbonate ', 'Sodium bicarbonate ', 'Calcium carbonate ', '1', '1', 1),
(261, 'VICKY', '121212152415', 1, 7, 'The property of a substance to absorb moisture from the air on exposure is called ', 'osmosis ', 'deliquescence ', 'efflorescence ', 'desiccation ', '2', '1', 0),
(262, 'VICKY', '121212152415', 1, 16, 'The gas usually filled in the electric bulb is', 'nitrogen ', 'hydrogen ', 'carbon dioxide ', 'oxygen ', '1', '4', 0),
(263, 'VICKY', '121212152415', 1, 18, 'Which of the gas is not known as green house gas? ', 'Methane ', 'Nitrous oxide ', 'Carbon dioxide ', 'Hydrogen ', '4', '1', 0),
(264, 'VICKY', '121212152415', 1, 1, 'sunrise in ?', 'east', 'west', 'north', 'south', '1', '1', 1),
(265, 'VICKY', '121212152415', 1, 8, 'The average salinity of sea water is ', '3.00%', '3.50%', '2.50%', '2.00%', '2', '1', 0),
(266, 'VICKY', '121212152415', 1, 13, 'Which of the following is used in pencils?', 'Graphite ', 'Silicon ', 'Charcoal ', 'Phosphorous ', '1', '1', 1),
(267, 'VICKY', '121212152415', 1, 15, 'Chemical formula for water is', 'NaAlO2 ', 'H2O', 'Al2O3 ', 'CaSiO3 ', '2', '1', 0),
(268, 'VICKY', '121212152415', 1, 9, 'system.______.print ?', 'in', 'out', 'on', 'go', '2', '3', 0),
(269, 'VICKY', '121212152415', 1, 4, 'Which of the following is used as a lubricant? ', 'Graphite ', 'Silica ', 'Iron Oxide ', 'Diamond ', '1', '1', 1),
(270, 'VICKY', '121212152415', 1, 11, 'Which of the following is a non metal that remains liquid at room temperature?', 'Phosphorous', 'Chlorine ', 'Bromine', 'Helium ', '3', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `std_name` varchar(250) NOT NULL,
  `aadhar_no` varchar(13) NOT NULL,
  `dep` varchar(50) NOT NULL,
  `year_of_pass` varchar(5) NOT NULL,
  `colg` varchar(250) NOT NULL,
  `doe` date NOT NULL,
  `mobile_no` bigint(10) NOT NULL,
  `colg_place` varchar(250) NOT NULL,
  `cgpa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `std_name`, `aadhar_no`, `dep`, `year_of_pass`, `colg`, `doe`, `mobile_no`, `colg_place`, `cgpa`) VALUES
(1, 'VENKATESH A', '123456789012', 'MCA', '2019', 'GNC', '2019-12-27', 8015873161, '', 0),
(3, 'KARTHIK A', '123456789014', 'MCA', '2019', 'GNC', '2019-12-27', 1234567890, 'TUTY', 9.9),
(4, 'KOKILA', '1234567891', 'DFAS', '2019', 'SDF', '2019-12-11', 8015873161, 'DSAF', 7),
(5, 'PAVITHRA', '524483744644', 'CSE', '2019', 'MAILAM COLLEGE', '2019-12-10', 4335365365, 'TINDIVANAM', 83),
(6, 'PAVI', '6463855469', 'CSE', '2019', 'NHH', '2019-12-18', 9843887887, 'CHENNAI', 83),
(7, 'VIJAY', '1231231231', 'BE', '2020', 'NEC', '2020-01-13', 9999999999, 'KOVIL', 99),
(8, 'BALAJI', '121212121', 'BE', '2020', 'HHHHKJKJKBB', '2019-10-29', 541321351, 'JHHLJHLHH', 10),
(9, 'VENKAT', '123454678901', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(10, 'VENKAT', '123454678905', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(12, 'KUMAR', '123456789015', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(14, 'KUMAR', '123456789018', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(16, 'KUMAR', '123456789019', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(18, 'KUMAR', '123456789011', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(21, 'KUMAR', '454548415415', 'B.E/B.TECH - ECE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9),
(22, 'VICKY', '121212152415', 'B.E/B.TECH - EEE', '2019', 'GNC', '2019-12-27', 1234567890, 'TUTY', 9.9),
(23, 'LJDMLFNLFN', '215451248545', 'B.E/B.TECH - EEE', '2019', 'GNC', '2019-12-27', 8015873161, 'TUTY', 9.9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `questions_1`
--
ALTER TABLE `questions_1`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `quiz_history`
--
ALTER TABLE `quiz_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aadhar_no` (`aadhar_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `questions_1`
--
ALTER TABLE `questions_1`
  MODIFY `qid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `quiz_history`
--
ALTER TABLE `quiz_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
