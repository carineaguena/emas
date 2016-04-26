SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `areas` (
`id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

INSERT INTO `areas` (`id`, `nome`, `id_evento`, `id_categoria`) VALUES
(7, 'Ciências Agrárias - Fitotecnia', 1, 1),
(8, 'Ciências Agrárias - Zootecnia', 1, 1),
(9, 'Ciências Biológicas; Ciências da Saúde', 1, 1),
(10, 'Ciências Exatas e da Terra; Engenharias', 1, 1),
(11, 'Ciências Humanas; Ciências Sociais Aplicadas; Linguística, Letras e Artes; Multidisciplinar', 1, 1),
(12, 'Comunicação', 1, 2),
(13, 'Cultura', 1, 2),
(14, 'Educação', 1, 2),
(15, 'Direitos Humanos', 1, 2),
(16, 'Meio Ambiente', 1, 2),
(17, 'Saúde', 1, 2),
(18, 'Tecnologia', 1, 2),
(19, 'Trabalho', 1, 2);

CREATE TABLE IF NOT EXISTS `arquivos_trabalho` (
`id` int(11) NOT NULL,
  `data_submissao` date DEFAULT NULL,
  `hora_submissao` time DEFAULT NULL,
  `extensao_arquivo` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_trabalho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `autores` (
`id` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_trabalho` int(11) NOT NULL,
  `id_instituicao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `categorias` (
`id` int(11) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

INSERT INTO `categorias` (`id`, `descricao`, `id_evento`) VALUES
(1, 'Pesquisa', 1),
(2, 'Extensão', 1);

CREATE TABLE IF NOT EXISTS `eventos` (
`id` int(11) NOT NULL,
  `nome` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `eventos` (`id`, `nome`, `data_inicio`, `data_termino`) VALUES
(1, 'VI FICE - Feira de Iniciação Científica e Extensão 2015', '2015-09-02', '2015-09-03');

CREATE TABLE IF NOT EXISTS `formatos` (
`id` int(11) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_modalidade` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

INSERT INTO `formatos` (`id`, `descricao`, `id_evento`, `id_modalidade`) VALUES
(1, 'Estande', 1, 2),
(2, 'Painel', 1, 2);

CREATE TABLE IF NOT EXISTS `instituicoes` (
`id` int(11) NOT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `instituicoes` (`id`, `nome`) VALUES
(1, 'IFC-Camboriú');

CREATE TABLE IF NOT EXISTS `modalidades` (
`id` int(11) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

INSERT INTO `modalidades` (`id`, `descricao`, `id_evento`) VALUES
(1, 'Apresentação Oral', 1),
(2, 'Pôster', 1);

CREATE TABLE IF NOT EXISTS `municipios` (
`id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=296 ;

INSERT INTO `municipios` (`id`, `nome`, `uf`) VALUES
(1, 'Abdon Batista\n', 'SC'),
(2, 'Abelardo Luz\n', 'SC'),
(3, 'Agrolândia\n', 'SC'),
(4, 'Agronômica\n', 'SC'),
(5, 'Água Doce\n', 'SC'),
(6, 'Águas de Chapecó\n', 'SC'),
(7, 'Águas Frias\n', 'SC'),
(8, 'Águas Mornas\n', 'SC'),
(9, 'Alfredo Wagner\n', 'SC'),
(10, 'Alto Bela Vista\n', 'SC'),
(11, 'Anchieta\n', 'SC'),
(12, 'Angelina\n', 'SC'),
(13, 'Anita Garibaldi\n', 'SC'),
(14, 'Anitápolis\n', 'SC'),
(15, 'Antônio Carlos\n', 'SC'),
(16, 'Apiúna\n', 'SC'),
(17, 'Arabutã\n', 'SC'),
(18, 'Araquari\n', 'SC'),
(19, 'Araranguá\n', 'SC'),
(20, 'Armazém\n', 'SC'),
(21, 'Arroio Trinta\n', 'SC'),
(22, 'Arvoredo\n', 'SC'),
(23, 'Ascurra\n', 'SC'),
(24, 'Atalanta\n', 'SC'),
(25, 'Aurora\n', 'SC'),
(26, 'Balneário Arroio do Silva\n', 'SC'),
(27, 'Balneário Barra do Sul\n', 'SC'),
(28, 'Balneário Camboriú\n', 'SC'),
(29, 'Balneário Gaivota\n', 'SC'),
(30, 'Balneário Piçarras\n', 'SC'),
(31, 'Balneário Rincão\n', 'SC'),
(32, 'Bandeirante\n', 'SC'),
(33, 'Barra Bonita\n', 'SC'),
(34, 'Barra Velha\n', 'SC'),
(35, 'Bela Vista do Toldo\n', 'SC'),
(36, 'Belmonte\n', 'SC'),
(37, 'Benedito Novo\n', 'SC'),
(38, 'Biguaçu\n', 'SC'),
(39, 'Blumenau\n', 'SC'),
(40, 'Bocaina do Sul\n', 'SC'),
(41, 'Bom Jardim da Serra\n', 'SC'),
(42, 'Bom Jesus\n', 'SC'),
(43, 'Bom Jesus do Oeste\n', 'SC'),
(44, 'Bom Retiro\n', 'SC'),
(45, 'Bombinhas\n', 'SC'),
(46, 'Botuverá\n', 'SC'),
(47, 'Braço do Norte\n', 'SC'),
(48, 'Braço do Trombudo\n', 'SC'),
(49, 'Brunópolis\n', 'SC'),
(50, 'Brusque\n', 'SC'),
(51, 'Caçador\n', 'SC'),
(52, 'Caibi\n', 'SC'),
(53, 'Calmon\n', 'SC'),
(54, 'Camboriú\n', 'SC'),
(55, 'Campo Alegre\n', 'SC'),
(56, 'Campo Belo do Sul\n', 'SC'),
(57, 'Campo Erê\n', 'SC'),
(58, 'Campos Novos\n', 'SC'),
(59, 'Canelinha\n', 'SC'),
(60, 'Canoinhas\n', 'SC'),
(61, 'Capão Alto\n', 'SC'),
(62, 'Capinzal\n', 'SC'),
(63, 'Capivari de Baixo\n', 'SC'),
(64, 'Catanduvas\n', 'SC'),
(65, 'Caxambu do Sul\n', 'SC'),
(66, 'Celso Ramos\n', 'SC'),
(67, 'Cerro Negro\n', 'SC'),
(68, 'Chapadão do Lageado\n', 'SC'),
(69, 'Chapecó\n', 'SC'),
(70, 'Cocal do Sul\n', 'SC'),
(71, 'Concórdia\n', 'SC'),
(72, 'Cordilheira Alta\n', 'SC'),
(73, 'Coronel Freitas\n', 'SC'),
(74, 'Coronel Martins\n', 'SC'),
(75, 'Correia Pinto\n', 'SC'),
(76, 'Corupá\n', 'SC'),
(77, 'Criciúma\n', 'SC'),
(78, 'Cunha Porã\n', 'SC'),
(79, 'Cunhataí\n', 'SC'),
(80, 'Curitibanos\n', 'SC'),
(81, 'Descanso\n', 'SC'),
(82, 'Dionísio Cerqueira\n', 'SC'),
(83, 'Dona Emma\n', 'SC'),
(84, 'Doutor Pedrinho\n', 'SC'),
(85, 'Entre Rios\n', 'SC'),
(86, 'Ermo\n', 'SC'),
(87, 'Erval Velho\n', 'SC'),
(88, 'Faxinal dos Guedes\n', 'SC'),
(89, 'Flor do Sertão\n', 'SC'),
(90, 'Florianópolis\n', 'SC'),
(91, 'Formosa do Sul\n', 'SC'),
(92, 'Forquilhinha\n', 'SC'),
(93, 'Fraiburgo\n', 'SC'),
(94, 'Frei Rogério\n', 'SC'),
(95, 'Galvão\n', 'SC'),
(96, 'Garopaba\n', 'SC'),
(97, 'Garuva\n', 'SC'),
(98, 'Gaspar\n', 'SC'),
(99, 'Governador Celso Ramos\n', 'SC'),
(100, 'Grão Pará\n', 'SC'),
(101, 'Gravatal\n', 'SC'),
(102, 'Guabiruba\n', 'SC'),
(103, 'Guaraciaba\n', 'SC'),
(104, 'Guaramirim\n', 'SC'),
(105, 'Guarujá do Sul\n', 'SC'),
(106, 'Guatambú\n', 'SC'),
(107, 'Herval d`Oeste\n', 'SC'),
(108, 'Ibiam\n', 'SC'),
(109, 'Ibicaré\n', 'SC'),
(110, 'Ibirama\n', 'SC'),
(111, 'Içara\n', 'SC'),
(112, 'Ilhota\n', 'SC'),
(113, 'Imaruí\n', 'SC'),
(114, 'Imbituba\n', 'SC'),
(115, 'Imbuia\n', 'SC'),
(116, 'Indaial\n', 'SC'),
(117, 'Iomerê\n', 'SC'),
(118, 'Ipira\n', 'SC'),
(119, 'Iporã do Oeste\n', 'SC'),
(120, 'Ipuaçu\n', 'SC'),
(121, 'Ipumirim\n', 'SC'),
(122, 'Iraceminha\n', 'SC'),
(123, 'Irani\n', 'SC'),
(124, 'Irati\n', 'SC'),
(125, 'Irineópolis\n', 'SC'),
(126, 'Itá\n', 'SC'),
(127, 'Itaiópolis\n', 'SC'),
(128, 'Itajaí\n', 'SC'),
(129, 'Itapema\n', 'SC'),
(130, 'Itapiranga\n', 'SC'),
(131, 'Itapoá\n', 'SC'),
(132, 'Ituporanga\n', 'SC'),
(133, 'Jaborá\n', 'SC'),
(134, 'Jacinto Machado\n', 'SC'),
(135, 'Jaguaruna\n', 'SC'),
(136, 'Jaraguá do Sul\n', 'SC'),
(137, 'Jardinópolis\n', 'SC'),
(138, 'Joaçaba\n', 'SC'),
(139, 'Joinville\n', 'SC'),
(140, 'José Boiteux\n', 'SC'),
(141, 'Jupiá\n', 'SC'),
(142, 'Lacerdópolis\n', 'SC'),
(143, 'Lages\n', 'SC'),
(144, 'Laguna\n', 'SC'),
(145, 'Lajeado Grande\n', 'SC'),
(146, 'Laurentino\n', 'SC'),
(147, 'Lauro Muller\n', 'SC'),
(148, 'Lebon Régis\n', 'SC'),
(149, 'Leoberto Leal\n', 'SC'),
(150, 'Lindóia do Sul\n', 'SC'),
(151, 'Lontras\n', 'SC'),
(152, 'Luiz Alves\n', 'SC'),
(153, 'Luzerna\n', 'SC'),
(154, 'Macieira\n', 'SC'),
(155, 'Mafra\n', 'SC'),
(156, 'Major Gercino\n', 'SC'),
(157, 'Major Vieira\n', 'SC'),
(158, 'Maracajá\n', 'SC'),
(159, 'Maravilha\n', 'SC'),
(160, 'Marema\n', 'SC'),
(161, 'Massaranduba\n', 'SC'),
(162, 'Matos Costa\n', 'SC'),
(163, 'Meleiro\n', 'SC'),
(164, 'Mirim Doce\n', 'SC'),
(165, 'Modelo\n', 'SC'),
(166, 'Mondaí\n', 'SC'),
(167, 'Monte Carlo\n', 'SC'),
(168, 'Monte Castelo\n', 'SC'),
(169, 'Morro da Fumaça\n', 'SC'),
(170, 'Morro Grande\n', 'SC'),
(171, 'Navegantes\n', 'SC'),
(172, 'Nova Erechim\n', 'SC'),
(173, 'Nova Itaberaba\n', 'SC'),
(174, 'Nova Trento\n', 'SC'),
(175, 'Nova Veneza\n', 'SC'),
(176, 'Novo Horizonte\n', 'SC'),
(177, 'Orleans\n', 'SC'),
(178, 'Otacílio Costa\n', 'SC'),
(179, 'Ouro\n', 'SC'),
(180, 'Ouro Verde\n', 'SC'),
(181, 'Paial\n', 'SC'),
(182, 'Painel\n', 'SC'),
(183, 'Palhoça\n', 'SC'),
(184, 'Palma Sola\n', 'SC'),
(185, 'Palmeira\n', 'SC'),
(186, 'Palmitos\n', 'SC'),
(187, 'Papanduva\n', 'SC'),
(188, 'Paraíso\n', 'SC'),
(189, 'Passo de Torres\n', 'SC'),
(190, 'Passos Maia\n', 'SC'),
(191, 'Paulo Lopes\n', 'SC'),
(192, 'Pedras Grandes\n', 'SC'),
(193, 'Penha\n', 'SC'),
(194, 'Peritiba\n', 'SC'),
(195, 'Pescaria Brava\n', 'SC'),
(196, 'Petrolândia\n', 'SC'),
(197, 'Pinhalzinho\n', 'SC'),
(198, 'Pinheiro Preto\n', 'SC'),
(199, 'Piratuba\n', 'SC'),
(200, 'Planalto Alegre\n', 'SC'),
(201, 'Pomerode\n', 'SC'),
(202, 'Ponte Alta\n', 'SC'),
(203, 'Ponte Alta do Norte\n', 'SC'),
(204, 'Ponte Serrada\n', 'SC'),
(205, 'Porto Belo\n', 'SC'),
(206, 'Porto União\n', 'SC'),
(207, 'Pouso Redondo\n', 'SC'),
(208, 'Praia Grande\n', 'SC'),
(209, 'Presidente Castello Branco\n', 'SC'),
(210, 'Presidente Getúlio\n', 'SC'),
(211, 'Presidente Nereu\n', 'SC'),
(212, 'Princesa\n', 'SC'),
(213, 'Quilombo\n', 'SC'),
(214, 'Rancho Queimado\n', 'SC'),
(215, 'Rio das Antas\n', 'SC'),
(216, 'Rio do Campo\n', 'SC'),
(217, 'Rio do Oeste\n', 'SC'),
(218, 'Rio do Sul\n', 'SC'),
(219, 'Rio dos Cedros\n', 'SC'),
(220, 'Rio Fortuna\n', 'SC'),
(221, 'Rio Negrinho\n', 'SC'),
(222, 'Rio Rufino\n', 'SC'),
(223, 'Riqueza\n', 'SC'),
(224, 'Rodeio\n', 'SC'),
(225, 'Romelândia\n', 'SC'),
(226, 'Salete\n', 'SC'),
(227, 'Saltinho\n', 'SC'),
(228, 'Salto Veloso\n', 'SC'),
(229, 'Sangão\n', 'SC'),
(230, 'Santa Cecília\n', 'SC'),
(231, 'Santa Helena\n', 'SC'),
(232, 'Santa Rosa de Lima\n', 'SC'),
(233, 'Santa Rosa do Sul\n', 'SC'),
(234, 'Santa Terezinha\n', 'SC'),
(235, 'Santa Terezinha do Progresso\n', 'SC'),
(236, 'Santiago do Sul\n', 'SC'),
(237, 'Santo Amaro da Imperatriz\n', 'SC'),
(238, 'São Bento do Sul\n', 'SC'),
(239, 'São Bernardino\n', 'SC'),
(240, 'São Bonifácio\n', 'SC'),
(241, 'São Carlos\n', 'SC'),
(242, 'São Cristovão do Sul\n', 'SC'),
(243, 'São Domingos\n', 'SC'),
(244, 'São Francisco do Sul\n', 'SC'),
(245, 'São João Batista\n', 'SC'),
(246, 'São João do Itaperiú\n', 'SC'),
(247, 'São João do Oeste\n', 'SC'),
(248, 'São João do Sul\n', 'SC'),
(249, 'São Joaquim\n', 'SC'),
(250, 'São José\n', 'SC'),
(251, 'São José do Cedro\n', 'SC'),
(252, 'São José do Cerrito\n', 'SC'),
(253, 'São Lourenço do Oeste\n', 'SC'),
(254, 'São Ludgero\n', 'SC'),
(255, 'São Martinho\n', 'SC'),
(256, 'São Miguel da Boa Vista\n', 'SC'),
(257, 'São Miguel do Oeste\n', 'SC'),
(258, 'São Pedro de Alcântara\n', 'SC'),
(259, 'Saudades\n', 'SC'),
(260, 'Schroeder\n', 'SC'),
(261, 'Seara\n', 'SC'),
(262, 'Serra Alta\n', 'SC'),
(263, 'Siderópolis\n', 'SC'),
(264, 'Sombrio\n', 'SC'),
(265, 'Sul Brasil\n', 'SC'),
(266, 'Taió\n', 'SC'),
(267, 'Tangará\n', 'SC'),
(268, 'Tigrinhos\n', 'SC'),
(269, 'Tijucas\n', 'SC'),
(270, 'Timbé do Sul\n', 'SC'),
(271, 'Timbó\n', 'SC'),
(272, 'Timbó Grande\n', 'SC'),
(273, 'Três Barras\n', 'SC'),
(274, 'Treviso\n', 'SC'),
(275, 'Treze de Maio\n', 'SC'),
(276, 'Treze Tílias\n', 'SC'),
(277, 'Trombudo Central\n', 'SC'),
(278, 'Tubarão\n', 'SC'),
(279, 'Tunápolis\n', 'SC'),
(280, 'Turvo\n', 'SC'),
(281, 'União do Oeste\n', 'SC'),
(282, 'Urubici\n', 'SC'),
(283, 'Urupema\n', 'SC'),
(284, 'Urussanga\n', 'SC'),
(285, 'Vargeão\n', 'SC'),
(286, 'Vargem\n', 'SC'),
(287, 'Vargem Bonita\n', 'SC'),
(288, 'Vidal Ramos\n', 'SC'),
(289, 'Videira\n', 'SC'),
(290, 'Vitor Meireles\n', 'SC'),
(291, 'Witmarsum\n', 'SC'),
(292, 'Xanxerê\n', 'SC'),
(293, 'Xavantina\n', 'SC'),
(294, 'Xaxim\n', 'SC'),
(295, 'Zortéa\n', 'SC');

CREATE TABLE IF NOT EXISTS `submissores` (
`id` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senha` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `id_instituicao` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

INSERT INTO `submissores` (`id`, `nome`, `email`, `senha`, `data_cadastro`, `ultimo_acesso`, `id_instituicao`, `id_municipio`) VALUES
(4, 'Reginaldo Rubens da Silva', 'reginaldorubens@gmail.com', '$2y$10$cU.4v5XzNK2OnVr4ZyYJQe0vBcQ9nMBPoS7JgU7mA823SUGr8MDrW', '2015-05-10', '2015-05-10 03:00:00', 1, 54);

CREATE TABLE IF NOT EXISTS `tipos_trabalho` (
`id` int(11) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

INSERT INTO `tipos_trabalho` (`id`, `descricao`, `id_evento`) VALUES
(1, 'Trabalho completo', 1),
(2, 'Trabalho em andamento', 1);

CREATE TABLE IF NOT EXISTS `trabalhos` (
`id` int(11) NOT NULL,
  `titulo` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resumo` text COLLATE utf8_unicode_ci,
  `nome_orientador` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_orientador` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_coorientador1` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_coorientador1` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_coorientador2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_coorientador2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_submissor` int(11) NOT NULL,
  `selecionado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_formato` int(11) NOT NULL,
  `id_modalidade` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `usuarios` (
`id` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `usuarios` (`id`, `nome`, `login`, `senha`, `email`, `data_cadastro`, `ultimo_acesso`, `status`) VALUES
(1, 'Reginaldo Rubens da Silva', 'reginaldo', '$2y$10$kXV7kJ86ta0x.6x8YuvKpOHMSNYAkq8vNFgQtJDyjxcTc9xhR7zuS', 'reginaldorubens@gmail.com', '2015-05-05', NULL, 'A');


ALTER TABLE `areas`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_areas_eventos1_idx` (`id_evento`), ADD KEY `id_categoria` (`id_categoria`);

ALTER TABLE `arquivos_trabalho`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_arquivos_trabalho_trabalhos1_idx` (`id_trabalho`);

ALTER TABLE `autores`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_autores_trabalhos1_idx` (`id_trabalho`), ADD KEY `fk_autores_instituicoes1_idx` (`id_instituicao`);

ALTER TABLE `categorias`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_categorias_eventos1_idx` (`id_evento`);

ALTER TABLE `eventos`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `formatos`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_formatos_eventos1_idx` (`id_evento`), ADD KEY `id_modalidade` (`id_modalidade`);

ALTER TABLE `instituicoes`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `modalidades`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_modalidades_eventos1_idx` (`id_evento`);

ALTER TABLE `municipios`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `submissores`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_submissores_instituicoes_idx` (`id_instituicao`), ADD KEY `fk_submissores_municipios1_idx` (`id_municipio`);

ALTER TABLE `tipos_trabalho`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tipos_trabalho_eventos1_idx` (`id_evento`);

ALTER TABLE `trabalhos`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_trabalhos_submissores1_idx` (`id_submissor`), ADD KEY `fk_trabalhos_eventos1_idx` (`id_evento`), ADD KEY `fk_trabalhos_areas1_idx` (`id_area`), ADD KEY `fk_trabalhos_formatos1_idx` (`id_formato`), ADD KEY `fk_trabalhos_modalidades1_idx` (`id_modalidade`), ADD KEY `fk_trabalhos_tipos_trabalho1_idx` (`id_tipo`), ADD KEY `fk_trabalhos_categorias1_idx` (`id_categoria`);

ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `login_UNIQUE` (`login`);


ALTER TABLE `areas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
ALTER TABLE `arquivos_trabalho`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `autores`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `categorias`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `eventos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `formatos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `instituicoes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `modalidades`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `municipios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=296;
ALTER TABLE `submissores`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
ALTER TABLE `tipos_trabalho`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `trabalhos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `usuarios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;

ALTER TABLE `areas`
ADD CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
ADD CONSTRAINT `fk_areas_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `arquivos_trabalho`
ADD CONSTRAINT `fk_arquivos_trabalho_trabalhos1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `autores`
ADD CONSTRAINT `fk_autores_instituicoes1` FOREIGN KEY (`id_instituicao`) REFERENCES `instituicoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_autores_trabalhos1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `categorias`
ADD CONSTRAINT `fk_categorias_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `formatos`
ADD CONSTRAINT `fk_formatos_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_formatos_modalidades` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id`);

ALTER TABLE `modalidades`
ADD CONSTRAINT `fk_modalidades_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `submissores`
ADD CONSTRAINT `fk_submissores_instituicoes` FOREIGN KEY (`id_instituicao`) REFERENCES `instituicoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_submissores_municipios1` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `tipos_trabalho`
ADD CONSTRAINT `fk_tipos_trabalho_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `trabalhos`
ADD CONSTRAINT `fk_trabalhos_areas1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_trabalhos_categorias1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_trabalhos_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_trabalhos_formatos1` FOREIGN KEY (`id_formato`) REFERENCES `formatos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_trabalhos_modalidades1` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_trabalhos_submissores1` FOREIGN KEY (`id_submissor`) REFERENCES `submissores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_trabalhos_tipos_trabalho1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_trabalho` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
