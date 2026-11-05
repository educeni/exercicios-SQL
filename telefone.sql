-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql312.infinityfree.com
-- Tempo de geração: 30/10/2026 às 15:58
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
-- Banco de dados: `if0_43244596_telefone`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cod_cli` tinyint(4) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `dt_nasc` date DEFAULT NULL,
  `nacional` varchar(20) DEFAULT 'Brasil',
  `sexo` enum('M','F') DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `cel` varchar(13) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`cod_cli`, `nome`, `cpf`, `dt_nasc`, `nacional`, `sexo`, `email`, `tel`, `cel`) VALUES
(1, 'eduardo', 123123, '2026-07-01', 'Brasil', 'M', 'eduardohaha123@jobie', '12345', '123'),
(2, 'a', 123, '2026-10-07', 'Brasil', 'M', 'seila@gmail.com', '9999', '1000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas`
--

CREATE TABLE `contas` (
  `num_conta` tinyint(4) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `categ` enum('ESPECIAL','COMUM') DEFAULT NULL,
  `saldo` decimal(9,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `contas`
--

INSERT INTO `contas` (`num_conta`, `tipo`, `categ`, `saldo`) VALUES
(1, 'Corrente', '', '1500.00'),
(2, 'Poupança', '', '3200.50'),
(3, 'Corrente', '', '8500.00'),
(4, 'Poupança', '', '12000.00'),
(5, 'Corrente', '', '750.25'),
(6, 'Poupança', '', '2100.75'),
(7, 'Corrente', '', '450.00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_x_clientes`
--

CREATE TABLE `contas_x_clientes` (
  `id_cxc` tinyint(4) NOT NULL,
  `cod_cli` tinyint(4) DEFAULT NULL,
  `num_conta` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `contas_x_clientes`
--

INSERT INTO `contas_x_clientes` (`id_cxc`, `cod_cli`, `num_conta`) VALUES
(1, 1, 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cli`);

--
-- Índices de tabela `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`num_conta`);

--
-- Índices de tabela `contas_x_clientes`
--
ALTER TABLE `contas_x_clientes`
  ADD PRIMARY KEY (`id_cxc`),
  ADD KEY `cod_cli` (`cod_cli`),
  ADD KEY `num_conta` (`num_conta`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cli` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `num_conta` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `contas_x_clientes`
--
ALTER TABLE `contas_x_clientes`
  MODIFY `id_cxc` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
