-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Nov-2023 às 20:59
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `negocios`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(120) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone_cliente` varchar(13) DEFAULT NULL,
  `CPF` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `senha`, `email`, `telefone_cliente`, `CPF`) VALUES
(14, 'Mateus Artemin', 'senhalegal', 'mateusartemin@gmail.com', '940028322', '11111111111'),
(15, 'Henrique BrazÃ£o', 'coxinha123', 'henriqueb@gmail.com', '942069119', '22222222222'),
(16, 'renata', 'guitar456', 'renata123@gmail.com', '11977989999', '33333333333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `idendereco` int(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `complemento` varchar(244) DEFAULT NULL,
  `numero` varchar(4) DEFAULT NULL,
  `id_end_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `endereco_cliente`
--

INSERT INTO `endereco_cliente` (`idendereco`, `cep`, `rua`, `bairro`, `cidade`, `estado`, `complemento`, `numero`, `id_end_cliente`) VALUES
(38, '0857777', 'Rua alecrin', 'Parque ensolarado', 'SÃ£o Paulo', 'SP', '', '77', 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_estabelecimento`
--

CREATE TABLE `endereco_estabelecimento` (
  `idendereco_estab` int(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `numero` varchar(2) NOT NULL,
  `id_end_estab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estabelecimento`
--

CREATE TABLE `estabelecimento` (
  `idestab` int(11) NOT NULL,
  `nome_loja` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `estabelecimento`
--

INSERT INTO `estabelecimento` (`idestab`, `nome_loja`) VALUES
(1, 'Pizzaria Bella Napoli'),
(2, 'Pizza Palace'),
(3, 'Crunchy Crust Pizzeria'),
(4, 'Fire & Spice Pizzeria'),
(5, 'Sabor Divina Pizzaria'),
(6, 'Pizza Express');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidog`
--

CREATE TABLE `pedidog` (
  `IDPedido` int(11) NOT NULL,
  `IDEstabelecimento` int(11) NOT NULL,
  `IDCliente` int(11) NOT NULL,
  `IDEndereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `nome_produto` varchar(40) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `id_prod_estab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `nome_produto`, `preco`, `id_prod_estab`) VALUES
(1, 'Pizza Margherita', 60, 1),
(2, 'Pizza Pepperoni', 50, 1),
(3, 'Pizza Quatro Queijos', 50, 1),
(4, 'Pizza Frango com Catupiry', 60, 1),
(5, 'Pizza Calabresa', 50, 1),
(6, 'Pizza Portuguesa', 50, 1),
(7, 'Pizza Vegetariana', 60, 1),
(8, 'Pizza Supreme', 70, 1),
(9, 'Pizza Bacon', 60, 1),
(10, 'Pizza Frutos do Mar', 70, 1),
(11, 'Refrigerante Coca-Cola 2L', 10, 1),
(12, 'Refrigerante Coca-Cola 500ml', 5, 1),
(13, 'Refrigerante Sprite', 7, 1),
(14, 'Refrigerante Fanta', 6, 1),
(15, 'Refrigerante Guaraná', 6, 1),
(16, 'Pizza Margherita Especial', 65, 2),
(17, 'Pizza Pepperoni Supreme', 55, 2),
(18, 'Pizza Três Queijos', 50, 2),
(19, 'Pizza Frango Gourmet', 65, 2),
(20, 'Pizza Calabresa Picante', 55, 2),
(21, 'Pizza Mexicana', 50, 2),
(22, 'Pizza Vegana', 65, 2),
(23, 'Pizza Deluxe', 75, 2),
(24, 'Pizza Bacon Explosion', 65, 2),
(25, 'Pizza Frutos do Mar Premium', 75, 2),
(26, 'Refrigerante Pepsi 2L', 8, 2),
(27, 'Refrigerante Pepsi 500ml', 3, 2),
(28, 'Refrigerante 7UP', 6, 2),
(29, 'Refrigerante Mirinda', 4, 2),
(30, 'Refrigerante Soda Limonada', 5, 2),
(31, 'Pizza Margherita Gourmet', 75, 3),
(32, 'Pizza Pepperoni Deluxe', 65, 3),
(33, 'Pizza Quatro Queijos Premium', 65, 3),
(34, 'Pizza Frango com Catupiry Especial', 75, 3),
(35, 'Pizza Calabresa Artesanal', 65, 3),
(36, 'Pizza Portuguesa Exclusiva', 65, 3),
(37, 'Pizza Vegetariana Sofisticada', 75, 3),
(38, 'Pizza Supreme Elegante', 85, 3),
(39, 'Pizza Bacon Premium', 75, 3),
(40, 'Pizza Frutos do Mar Luxuosa', 85, 3),
(41, 'Refrigerante Premium Cola 2L', 25, 3),
(42, 'Refrigerante Premium Cola 500ml', 20, 3),
(43, 'Refrigerante Elegance Sprite', 22, 3),
(44, 'Refrigerante Fanta Delight', 21, 3),
(45, 'Refrigerante Guaraná Select', 21, 3),
(46, 'Pizza Margherita Popular', 40, 4),
(47, 'Pizza Pepperoni Clássica', 30, 4),
(48, 'Pizza Quatro Queijos Tradicional', 30, 4),
(49, 'Pizza Frango Simples', 40, 4),
(50, 'Pizza Calabresa Tradicional', 30, 4),
(51, 'Pizza Portuguesa Simples', 30, 4),
(52, 'Pizza Vegetariana Básica', 40, 4),
(53, 'Pizza Suprema Econômica', 50, 4),
(54, 'Pizza Bacon Popular', 40, 4),
(55, 'Pizza Frutos do Mar Simples', 50, 4),
(56, 'Refrigerante Genérico Cola 2L', 5, 4),
(57, 'Refrigerante Genérico Cola 500ml', 3, 4),
(58, 'Refrigerante Genérico Limão', 4, 4),
(59, 'Refrigerante Genérico Laranja', 3, 4),
(60, 'Refrigerante Genérico Guaraná', 4, 4),
(61, 'Pizza Especial do Chef', 80, 5),
(62, 'Pizza Exótica de Abacaxi e Presunto', 70, 5),
(63, 'Pizza Sabor Oriental', 70, 5),
(64, 'Pizza de Frutas Tropicais', 80, 5),
(65, 'Pizza de Camarão ao Curry', 70, 5),
(66, 'Pizza de Chocolate e Morango', 65, 5),
(67, 'Pizza de Espinafre e Ricota', 80, 5),
(68, 'Pizza de Berinjela Grelhada', 90, 5),
(69, 'Pizza de Alho-Poró com Queijo de Cabra', 80, 5),
(70, 'Pizza de Banana com Canela', 65, 5),
(71, 'Refri Artesanal de Hibisco', 13, 5),
(72, 'Refri Artesanal de Gengibre e Limão', 10, 5),
(73, 'Refri Artesanal de Pêssego e Manjericão', 11, 5),
(74, 'Refri Artesanal de Tamarindo', 10, 5),
(75, 'Refri Artesanal de Laranja com Cardamomo', 11, 5),
(76, 'Pizza Mista Especial', 60, 6),
(77, 'Pizza de Peito de Peru e Abacaxi', 50, 6),
(78, 'Pizza Caprese com Pesto', 50, 6),
(79, 'Pizza de Frango com Cogumelos', 60, 6),
(80, 'Pizza de Calabresa com Cheddar', 50, 6),
(81, 'Pizza de Presunto Parma e Rúcula', 50, 6),
(82, 'Pizza de Legumes Grelhados', 60, 6),
(83, 'Pizza de Tomate Seco e Azeitonas', 70, 6),
(84, 'Pizza de Quatro Queijos com Ervas Finas', 60, 6),
(85, 'Pizza de Cogumelos Trufados', 70, 6),
(86, 'Refri de Limão Siciliano', 9, 6),
(87, 'Refri de Framboesa', 5, 6),
(88, 'Refri de Maracujá com Manjericão', 7, 6),
(89, 'Refri de Maçã Verde', 6, 6),
(90, 'Refri de Manga e Pimenta', 7, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtospedido`
--

CREATE TABLE `produtospedido` (
  `IDProdPed` int(11) NOT NULL,
  `IDPedido` int(11) NOT NULL,
  `IDProduto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usolog`
--

CREATE TABLE `usolog` (
  `IdUsoLog` int(11) NOT NULL,
  `NameUsoLog` varchar(255) DEFAULT NULL,
  `ot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usolog`
--

INSERT INTO `usolog` (`IdUsoLog`, `NameUsoLog`, `ot`) VALUES
(14, 'Mateus Artemin', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`idendereco`),
  ADD KEY `FK_Endereco_Cliente` (`id_end_cliente`);

--
-- Índices para tabela `endereco_estabelecimento`
--
ALTER TABLE `endereco_estabelecimento`
  ADD PRIMARY KEY (`idendereco_estab`),
  ADD UNIQUE KEY `UQ_End_Loja` (`idendereco_estab`),
  ADD KEY `FK_Endereco_Loja` (`id_end_estab`);

--
-- Índices para tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  ADD PRIMARY KEY (`idestab`);

--
-- Índices para tabela `pedidog`
--
ALTER TABLE `pedidog`
  ADD PRIMARY KEY (`IDPedido`),
  ADD KEY `IDEstabelecimento` (`IDEstabelecimento`),
  ADD KEY `IDCliente` (`IDCliente`),
  ADD KEY `IDEndereco` (`IDEndereco`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`);

--
-- Índices para tabela `produtospedido`
--
ALTER TABLE `produtospedido`
  ADD PRIMARY KEY (`IDProdPed`),
  ADD KEY `IDPedido` (`IDPedido`),
  ADD KEY `IDProduto` (`IDProduto`);

--
-- Índices para tabela `usolog`
--
ALTER TABLE `usolog`
  ADD PRIMARY KEY (`IdUsoLog`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `endereco_estabelecimento`
--
ALTER TABLE `endereco_estabelecimento`
  MODIFY `idendereco_estab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estabelecimento`
--
ALTER TABLE `estabelecimento`
  MODIFY `idestab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pedidog`
--
ALTER TABLE `pedidog`
  MODIFY `IDPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `produtospedido`
--
ALTER TABLE `produtospedido`
  MODIFY `IDProdPed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `FK_Endereco_Cliente` FOREIGN KEY (`id_end_cliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `endereco_estabelecimento`
--
ALTER TABLE `endereco_estabelecimento`
  ADD CONSTRAINT `FK_Endereco_Loja` FOREIGN KEY (`id_end_estab`) REFERENCES `estabelecimento` (`idestab`);

--
-- Limitadores para a tabela `pedidog`
--
ALTER TABLE `pedidog`
  ADD CONSTRAINT `pedidog_ibfk_1` FOREIGN KEY (`IDEstabelecimento`) REFERENCES `estabelecimento` (`idestab`),
  ADD CONSTRAINT `pedidog_ibfk_2` FOREIGN KEY (`IDCliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `pedidog_ibfk_3` FOREIGN KEY (`IDEndereco`) REFERENCES `endereco_cliente` (`idendereco`);

--
-- Limitadores para a tabela `produtospedido`
--
ALTER TABLE `produtospedido`
  ADD CONSTRAINT `produtospedido_ibfk_1` FOREIGN KEY (`IDPedido`) REFERENCES `pedidog` (`IDPedido`),
  ADD CONSTRAINT `produtospedido_ibfk_2` FOREIGN KEY (`IDProduto`) REFERENCES `produtos` (`idproduto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
