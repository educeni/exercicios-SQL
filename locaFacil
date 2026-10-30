-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql312.infinityfree.com
-- Tempo de geração: 22/10/2026 às 09:03
-- Versão do servidor: 11.4.13-MariaDB
-- Versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_43244596_LocaFacil`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Aluga`
--

CREATE TABLE `Aluga` (
  `CodAlu` int(11) NOT NULL,
  `Data_inicial` date DEFAULT NULL,
  `Data_final` date DEFAULT NULL,
  `CodCar` int(11) NOT NULL,
  `CodCli` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Carro`
--

CREATE TABLE `Carro` (
  `CodCar` int(11) NOT NULL,
  `Placa` varchar(8) NOT NULL,
  `Cor` varchar(15) DEFAULT NULL,
  `Modelo` varchar(20) DEFAULT NULL,
  `Ano` int(11) DEFAULT NULL,
  `Diaria` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `Carro`
--

INSERT INTO `Carro` (`CodCar`, `Placa`, `Cor`, `Modelo`, `Ano`, `Diaria`) VALUES
(1, '12301', 'roxo', 'porsche', 2012, 200);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `CodCli` int(11) NOT NULL,
  `Nome` char(50) NOT NULL,
  `CNH` char(11) NOT NULL,
  `Endereco` char(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `esportivo`
--

CREATE TABLE `esportivo` (
  `Velocidade` double DEFAULT NULL,
  `CodCar` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `esportivo`
--

INSERT INTO `esportivo` (`Velocidade`, `CodCar`) VALUES
(600, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Sedan`
--

CREATE TABLE `Sedan` (
  `Passageiros` int(11) DEFAULT NULL,
  `CodCar` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Telefone`
--

CREATE TABLE `Telefone` (
  `Telefone_PK` int(11) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `CodCli` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Aluga`
--
ALTER TABLE `Aluga`
  ADD PRIMARY KEY (`CodAlu`),
  ADD KEY `CodCar` (`CodCar`),
  ADD KEY `CodCli` (`CodCli`);

--
-- Índices de tabela `Carro`
--
ALTER TABLE `Carro`
  ADD PRIMARY KEY (`CodCar`),
  ADD UNIQUE KEY `Placa` (`Placa`);

--
-- Índices de tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`CodCli`),
  ADD UNIQUE KEY `CNH` (`CNH`);

--
-- Índices de tabela `esportivo`
--
ALTER TABLE `esportivo`
  ADD KEY `CodCar` (`CodCar`);

--
-- Índices de tabela `Sedan`
--
ALTER TABLE `Sedan`
  ADD KEY `CodCar` (`CodCar`);

--
-- Índices de tabela `Telefone`
--
ALTER TABLE `Telefone`
  ADD PRIMARY KEY (`Telefone_PK`),
  ADD KEY `CodCli` (`CodCli`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `Aluga`
--
ALTER TABLE `Aluga`
  MODIFY `CodAlu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Carro`
--
ALTER TABLE `Carro`
  MODIFY `CodCar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `CodCli` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
