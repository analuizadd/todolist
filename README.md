# ToDoList
## Descrição do Projeto
<p>Esse projeto é uma pequena aplicação web para gerenciar uma lista de afazeres</p>

## Visão do Projeto
<p>Essa versão do projeto existe uma tela onde é possivel cadastrar tarefas a serem feitas em uma unica lista. </p>
<p>O banco de dados composto pelas tabelas `Users` `Lists` `Tasks` foram imaginadas para que no futuro seja possivel cadastrar mais de um usuario ou lista de tarefas, atualmente o sistema esta vinculado ao user de ID = 1 e list de ID = 1 </p>

## Schema do Banco de Dados MySql
``` sql
CREATE DATABASE `todo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `lists` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria.',
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria.',
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `nick` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `list_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `done` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`),
  KEY `Tasks_user_id_IDX` (`user_id`) USING BTREE,
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `todo`.`users` (`id`,`name`,`nick`) VALUES (1,'Teste','teste');
INSERT INTO `todo`.`lists` (`id`,`name`) VALUES (1,'All');

```
