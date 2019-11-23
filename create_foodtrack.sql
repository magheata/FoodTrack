-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 23, 2019 at 01:44 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `foodtrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `alimento`
--

CREATE TABLE `alimento` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `kcal` int(11) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alimento`
--

INSERT INTO `alimento` (`id`, `nombre`, `kcal`, `fecha_caducidad`) VALUES
(1, 'leche', 120, '2020-01-15'),
(2, 'pan', 300, '2020-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `comida`
--

CREATE TABLE `comida` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_receta` int(11) NOT NULL,
  `tipo_comida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lista_compra`
--

CREATE TABLE `lista_compra` (
  `id` int(11) NOT NULL,
  `id_alimento` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `receta_alimento`
--

CREATE TABLE `receta_alimento` (
  `id_receta` int(11) NOT NULL,
  `id_alimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `id_alimento` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_comida`
--

CREATE TABLE `tipo_comida` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alimento`
--
ALTER TABLE `alimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_receta` (`id_receta`),
  ADD KEY `tipo_comida` (`tipo_comida`);

--
-- Indexes for table `lista_compra`
--
ALTER TABLE `lista_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alimento` (`id_alimento`);

--
-- Indexes for table `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receta_alimento`
--
ALTER TABLE `receta_alimento`
  ADD PRIMARY KEY (`id_receta`,`id_alimento`),
  ADD KEY `id_alimento` (`id_alimento`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alimento` (`id_alimento`);

--
-- Indexes for table `tipo_comida`
--
ALTER TABLE `tipo_comida`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alimento`
--
ALTER TABLE `alimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comida`
--
ALTER TABLE `comida`
  ADD CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`),
  ADD CONSTRAINT `comida_ibfk_2` FOREIGN KEY (`tipo_comida`) REFERENCES `tipo_comida` (`id`);

--
-- Constraints for table `lista_compra`
--
ALTER TABLE `lista_compra`
  ADD CONSTRAINT `lista_compra_ibfk_1` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id`);

--
-- Constraints for table `receta_alimento`
--
ALTER TABLE `receta_alimento`
  ADD CONSTRAINT `receta_alimento_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`),
  ADD CONSTRAINT `receta_alimento_ibfk_2` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id`);
