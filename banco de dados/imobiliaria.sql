/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : imobiliaria

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-08-11 23:41:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cidades
-- ----------------------------
DROP TABLE IF EXISTS `cidades`;
CREATE TABLE `cidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sigla_estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cidades
-- ----------------------------
INSERT INTO `cidades` VALUES ('1', 'Rio Claro', 'São Paulo', 'SP', '2017-10-21 13:37:31', '2017-10-22 08:46:53');
INSERT INTO `cidades` VALUES ('2', 'São Paulo', 'São Paulo', 'SP', '2017-10-22 16:37:08', '2017-10-22 16:37:08');

-- ----------------------------
-- Table structure for galerias
-- ----------------------------
DROP TABLE IF EXISTS `galerias`;
CREATE TABLE `galerias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imovel_id` int(10) unsigned NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galerias_imovel_id_foreign` (`imovel_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of galerias
-- ----------------------------
INSERT INTO `galerias` VALUES ('1', '1', 'TESTE-GALERIA', 'TESTE', 'img/imoveis/imovel_teste//_img_58641.png', null, null, '2017-10-22 14:29:13');
INSERT INTO `galerias` VALUES ('2', '1', 'TESTE', 'TESTEXXX', 'img/imoveis/teste//_img_94748.png', '1', '2017-10-22 16:40:32', '2017-10-22 16:40:52');
INSERT INTO `galerias` VALUES ('5', '2', 'teste', 'teste', 'img/imoveis/imovel_teste//_img_88006.jpeg', '1', '2017-10-22 17:21:51', '2017-10-22 17:22:12');
INSERT INTO `galerias` VALUES ('6', '2', 'Teste', 'teste', 'img/imoveis/imovel_teste//_img_27789.png', '2', '2017-10-22 17:22:02', '2017-10-22 17:22:21');
INSERT INTO `galerias` VALUES ('7', '2', 'testexx', 'descrição', 'img/imoveis/imovel_teste//_img_68667.jpeg', '3', '2017-10-22 17:22:35', '2017-10-22 17:22:58');
INSERT INTO `galerias` VALUES ('8', '2', 'teste111', 'descrição111', 'img/imoveis/imovel_teste//_img_37625.jpeg', '4', '2017-10-22 17:22:35', '2017-10-22 17:23:15');
INSERT INTO `galerias` VALUES ('9', '2', 'teste333', 'descrição111', 'img/imoveis/imovel_teste//_img_36331.jpeg', '5', '2017-10-22 17:22:36', '2017-10-22 17:23:26');

-- ----------------------------
-- Table structure for imoveis
-- ----------------------------
DROP TABLE IF EXISTS `imoveis`;
CREATE TABLE `imoveis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_id` int(10) unsigned NOT NULL,
  `cidade_id` int(10) unsigned NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('vende','aluga') COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `dormitorios` int(11) NOT NULL,
  `detalhes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mapa` text COLLATE utf8_unicode_ci,
  `visualizacoes` bigint(20) NOT NULL DEFAULT '0',
  `publicar` enum('sim','nao') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imoveis_tipo_id_foreign` (`tipo_id`) USING BTREE,
  KEY `imoveis_cidade_id_foreign` (`cidade_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of imoveis
-- ----------------------------
INSERT INTO `imoveis` VALUES ('1', '2', '2', 'teste22', 'teste', 'img/imoveis/teste//_img_79798.jpeg', 'aluga', 'teste', '13505-050', '210000.00', '2', 'teste', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7376.573536098088!2d-47.59289092693182!3d-22.418229873021257!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94c7dadd74937f55%3A0x30858ae3d650d2ca!2sJardim+Maria+Cristina%2C+Rio+Claro+-+SP!5e0!3m2!1spt-BR!2sbr!4v1508703554572\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '111', 'sim', null, '2017-10-22 20:47:20');
INSERT INTO `imoveis` VALUES ('2', '3', '1', 'Imovel Teste', 'Imovel Teste', 'img/imoveis/imovel_teste//_img_58641.png', 'vende', 'Rua', '13500000', '150000.00', '2', 'teste', null, '345', 'sim', '2017-10-22 08:54:54', '2017-10-22 20:46:31');
INSERT INTO `imoveis` VALUES ('3', '1', '1', 'testexxxx', 'descrição111', 'img/imoveis/testexxxx//_img_68092.jpeg', 'aluga', 'Rua M 5, 1172', '13505083', '150000.00', '3', 'Sala, Cozinha', null, '0', 'sim', '2017-10-22 17:55:24', '2017-10-22 20:14:27');
INSERT INTO `imoveis` VALUES ('4', '1', '1', 'teste', 'teste', 'img/imoveis/teste//_img_40107.jpeg', 'aluga', 'Rua 8 n.1796, floriadiana', '13500210', '151000.00', '3', 'Sala, Cozinha', null, '0', 'sim', '2017-10-22 17:58:42', '2017-10-22 17:58:42');
INSERT INTO `imoveis` VALUES ('5', '1', '1', 'teste', 'teste', 'img/imoveis/teste//_img_69134.jpeg', 'aluga', 'Rua 8 n.1796, floriadiana', '13500210', '153000.00', '3', 'Sala, Cozinha', null, '0', 'sim', '2017-10-22 17:59:20', '2017-10-22 17:59:20');

-- ----------------------------
-- Table structure for paginas
-- ----------------------------
DROP TABLE IF EXISTS `paginas`;
CREATE TABLE `paginas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `texto` text COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mapa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of paginas
-- ----------------------------
INSERT INTO `paginas` VALUES ('1', 'A Empresa', 'Descrição breve sobre a empresa.', 'Texto sobre a empresa.', 'img/paginas/1//_img_55380.jpeg', null, null, 'sobre', '2017-10-21 11:46:59', '2017-10-21 11:48:13');
INSERT INTO `paginas` VALUES ('2', 'Entre em Contato', 'Preencha o formulário', 'Contato', 'img/paginas/2//_img_12048.jpeg', null, 'oliveiralexandre0@gmail.com', 'contato', '2017-10-21 11:47:00', '2017-10-21 11:48:18');

-- ----------------------------
-- Table structure for papels
-- ----------------------------
DROP TABLE IF EXISTS `papels`;
CREATE TABLE `papels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of papels
-- ----------------------------
INSERT INTO `papels` VALUES ('1', 'admin', 'Administrador do sistema', '2017-11-01 19:51:58', '2017-11-01 19:51:58');
INSERT INTO `papels` VALUES ('2', 'gerente', 'Gerente do sistema', '2017-11-01 19:51:58', '2017-11-01 19:51:58');
INSERT INTO `papels` VALUES ('3', 'vendedor', 'Equipe de vendas', '2017-11-01 19:51:58', '2017-11-01 19:51:58');
INSERT INTO `papels` VALUES ('4', 'Editor', 'Editor de Imóveis', '2017-11-01 20:38:43', '2017-11-01 20:38:43');

-- ----------------------------
-- Table structure for papel_permissao
-- ----------------------------
DROP TABLE IF EXISTS `papel_permissao`;
CREATE TABLE `papel_permissao` (
  `permissao_id` int(10) unsigned NOT NULL,
  `papel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permissao_id`,`papel_id`),
  KEY `papel_permissao_papel_id_foreign` (`papel_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of papel_permissao
-- ----------------------------
INSERT INTO `papel_permissao` VALUES ('1', '1');
INSERT INTO `papel_permissao` VALUES ('2', '1');
INSERT INTO `papel_permissao` VALUES ('3', '1');
INSERT INTO `papel_permissao` VALUES ('4', '1');
INSERT INTO `papel_permissao` VALUES ('5', '1');
INSERT INTO `papel_permissao` VALUES ('6', '1');
INSERT INTO `papel_permissao` VALUES ('7', '1');
INSERT INTO `papel_permissao` VALUES ('8', '1');
INSERT INTO `papel_permissao` VALUES ('9', '4');
INSERT INTO `papel_permissao` VALUES ('10', '4');
INSERT INTO `papel_permissao` VALUES ('11', '4');
INSERT INTO `papel_permissao` VALUES ('12', '4');
INSERT INTO `papel_permissao` VALUES ('13', '4');
INSERT INTO `papel_permissao` VALUES ('14', '4');
INSERT INTO `papel_permissao` VALUES ('15', '4');
INSERT INTO `papel_permissao` VALUES ('16', '4');
INSERT INTO `papel_permissao` VALUES ('17', '4');
INSERT INTO `papel_permissao` VALUES ('18', '4');
INSERT INTO `papel_permissao` VALUES ('19', '4');
INSERT INTO `papel_permissao` VALUES ('20', '4');

-- ----------------------------
-- Table structure for papel_user
-- ----------------------------
DROP TABLE IF EXISTS `papel_user`;
CREATE TABLE `papel_user` (
  `user_id` int(10) unsigned NOT NULL,
  `papel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`papel_id`),
  KEY `papel_user_papel_id_foreign` (`papel_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of papel_user
-- ----------------------------
INSERT INTO `papel_user` VALUES ('1', '1');
INSERT INTO `papel_user` VALUES ('2', '4');
INSERT INTO `papel_user` VALUES ('4', '1');
INSERT INTO `papel_user` VALUES ('5', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissaos
-- ----------------------------
DROP TABLE IF EXISTS `permissaos`;
CREATE TABLE `permissaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissaos
-- ----------------------------
INSERT INTO `permissaos` VALUES ('1', 'usuario_listar', 'Listar Usuários', '2017-11-01 19:56:23', '2017-11-01 19:56:23');
INSERT INTO `permissaos` VALUES ('2', 'usuario_adicionar', 'Adicionar Usuários', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('3', 'usuario_editar', 'Editar Usuários', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('4', 'usuario_deletar', 'Deletar Usuários', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('5', 'papel_listar', 'Listar Papéis', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('6', 'papel_adicionar', 'Adicionar Papéis', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('7', 'papel_editar', 'Editar Papéis', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('8', 'papel_deletar', 'Deletar Papéis', '2017-11-01 19:56:24', '2017-11-01 19:56:24');
INSERT INTO `permissaos` VALUES ('9', 'imovel_listar', 'Listar Imóveis', '2017-11-01 18:57:51', '2017-11-01 18:57:54');
INSERT INTO `permissaos` VALUES ('10', 'imovel_adicionar', 'Adicionar Imóveis', '2017-11-01 18:57:47', '2017-11-01 18:57:57');
INSERT INTO `permissaos` VALUES ('11', 'imovel_editar', 'Editar Imóveis', '2017-11-01 18:57:43', '2017-11-01 18:58:02');
INSERT INTO `permissaos` VALUES ('12', 'imovel_deletar', 'Deletar Imóveis', '2017-11-01 18:57:26', '2017-11-01 18:57:39');
INSERT INTO `permissaos` VALUES ('13', 'tipo_listar', 'Listar Tipos', '2017-11-01 19:07:33', '2017-11-01 19:07:36');
INSERT INTO `permissaos` VALUES ('14', 'tipo_adicionar', 'Adicionar Tipos', '2017-11-01 19:07:38', '2017-11-01 19:07:41');
INSERT INTO `permissaos` VALUES ('15', 'tipo_editar', 'Editar Tipos', '2017-11-01 19:07:43', '2017-11-01 19:07:45');
INSERT INTO `permissaos` VALUES ('16', 'tipo_deletar', 'Deletar Tipos', '2017-11-01 19:07:48', '2017-11-01 19:07:51');
INSERT INTO `permissaos` VALUES ('17', 'cidade_listar', 'Listar Cidades', '2017-11-01 19:12:31', '2017-11-01 19:12:34');
INSERT INTO `permissaos` VALUES ('18', 'cidade_adicionar', 'Adicionar Cidades', '2017-11-01 19:12:36', '2017-11-01 19:12:37');
INSERT INTO `permissaos` VALUES ('19', 'cidade_editar', 'Editar Cidades', '2017-11-01 19:12:39', '2017-11-01 19:12:40');
INSERT INTO `permissaos` VALUES ('20', 'cidade_deletar', 'Deletar Cidades', '2017-11-01 19:12:42', '2017-11-01 19:12:43');
INSERT INTO `permissaos` VALUES ('21', 'slide_listar', 'Listar Slides', '2017-11-01 19:13:55', '2017-11-01 19:13:56');
INSERT INTO `permissaos` VALUES ('22', 'slide_adicionar', 'Adicionar Slides', '2017-11-01 19:13:58', '2017-11-01 19:13:59');
INSERT INTO `permissaos` VALUES ('23', 'slide_editar', 'Editar Slides', '2017-11-01 19:14:00', '2017-11-01 19:14:01');
INSERT INTO `permissaos` VALUES ('24', 'slide_deletar', 'Deletar Slides', '2017-11-01 19:14:03', '2017-11-01 19:14:04');
INSERT INTO `permissaos` VALUES ('25', 'pagina_listar', 'Listar Páginas', '2017-11-01 19:15:08', '2017-11-01 19:15:09');
INSERT INTO `permissaos` VALUES ('26', 'pagina_adicionar', 'Adicionar Páginas', '2017-11-01 19:15:11', '2017-11-01 19:15:12');
INSERT INTO `permissaos` VALUES ('27', 'pagina_editar', 'Editar Páginas', '2017-11-01 19:15:14', '2017-11-01 19:15:15');
INSERT INTO `permissaos` VALUES ('28', 'pagina_deletar', 'Deletar Páginas', '2017-11-01 19:15:18', '2017-11-01 19:15:19');

-- ----------------------------
-- Table structure for slides
-- ----------------------------
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `publicado` enum('sim','nao') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'nao',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of slides
-- ----------------------------
INSERT INTO `slides` VALUES ('1', null, null, 'img/slides//_img_78015.jpeg', null, '1', 'sim', '2017-10-22 20:12:49', '2017-10-22 20:12:49');
INSERT INTO `slides` VALUES ('2', null, null, 'img/slides//_img_87128.jpeg', null, '2', 'sim', '2017-10-22 20:12:59', '2017-10-22 20:13:47');
INSERT INTO `slides` VALUES ('3', null, null, 'img/slides//_img_75150.jpeg', null, '3', 'sim', '2017-10-22 20:12:59', '2017-10-22 20:13:53');

-- ----------------------------
-- Table structure for tipos
-- ----------------------------
DROP TABLE IF EXISTS `tipos`;
CREATE TABLE `tipos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipos
-- ----------------------------
INSERT INTO `tipos` VALUES ('1', 'Alvenaria', '2017-10-21 13:35:49', '2017-10-21 13:35:49');
INSERT INTO `tipos` VALUES ('2', 'Apartamento', '2017-10-21 13:39:18', '2017-10-21 13:39:18');
INSERT INTO `tipos` VALUES ('3', 'Duplex', '2017-10-21 14:17:13', '2017-10-21 14:17:13');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Admin', 'admin@admin.com', '$2y$10$p4wontSEgkO5paeD5FVHoO3EHmdeh.TK3IACrX5KVcB327YOY3L0G', 'lBILCnFYELWoCCBlTomIwxTtAWCKXzQXnDafooQfJ3m6imkjKiLFJYcSF0tc', '2019-06-14 21:47:55', '2019-06-14 21:47:55');
