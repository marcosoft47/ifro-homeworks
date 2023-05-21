-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 31-Out-2021 às 02:51
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_carros`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mod_fab` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cor` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `placa` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id`, `marca`, `modelo`, `descricao`, `mod_fab`, `cor`, `placa`, `valor`) VALUES
(1, 'Ford', 'Ka', '1.0 MPI 8V FLEX 2P MANUAL', '2013/2013', 'branco', 'GHF9845', 18000),
(2, 'Toyota', 'Corola', '1.8 SE-G 16V FLEX 4P AUTOMÃTICO', '2007/2008', 'preto', 'KZY4638', 38000),
(3, 'DMC', 'Delorean', '2P GASOLINA AUTOMÃTICO', '1966/1967', 'preto', 'ABC1234', 3000),
(5, 'Volskwagen', 'Fusca', '2P GASOLINA', '1966/1967', 'preto', 'ABC1234', 3000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
