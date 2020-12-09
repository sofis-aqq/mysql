-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2020 às 13:02
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `codCargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`codCargo`, `cargo`) VALUES
(1, 'Professor'),
(2, 'Coord Pedagógico'),
(3, 'Diretor'),
(4, 'Coordenador ETIM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codFuncionario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codFuncionario`, `nome`, `dataEntrada`, `dataSaida`) VALUES
(1, 'Mariazinha', '1980-02-15', '2002-08-19'),
(2, 'Joãozinho', '2020-11-02', '0000-00-00'),
(3, 'Thiago Fritz', '2020-02-29', '2020-07-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario_cargo`
--

CREATE TABLE `funcionario_cargo` (
  `codFuncionario` int(11) NOT NULL,
  `codCargo` int(11) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario_cargo`
--

INSERT INTO `funcionario_cargo` (`codFuncionario`, `codCargo`, `dataEntrada`, `dataSaida`) VALUES
(1, 1, '1980-02-15', '0000-00-00'),
(1, 2, '2016-07-08', '0000-00-00'),
(3, 3, '2012-08-15', '0000-00-00'),
(3, 2, '2013-08-09', '2016-08-07'),
(3, 1, '2011-02-25', '0000-00-00'),
(2, 4, '2015-02-13', '0000-00-00'),
(2, 2, '2016-07-08', '0000-00-00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`codCargo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codFuncionario`);

--
-- Índices para tabela `funcionario_cargo`
--
ALTER TABLE `funcionario_cargo`
  ADD KEY `codFuncionario` (`codFuncionario`),
  ADD KEY `codCargo` (`codCargo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionario_cargo`
--
ALTER TABLE `funcionario_cargo`
  ADD CONSTRAINT `funcionario_cargo_ibfk_1` FOREIGN KEY (`codCargo`) REFERENCES `cargos` (`codCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `funcionario_cargo_ibfk_2` FOREIGN KEY (`codFuncionario`) REFERENCES `funcionario` (`codFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
