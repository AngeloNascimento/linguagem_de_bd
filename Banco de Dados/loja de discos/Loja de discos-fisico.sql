-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE loja_de_musica;

CREATE TABLE discos (
cod_disco INT(5) PRIMARY KEY AUTO_INCREMENT,
Autor VARCHAR(20),
Titulo VARCHAR(20),
copias_vendidas INT(5),
data_gravacao DATE,
grupo VARCHAR(20)
)

CREATE TABLE musicas (
cod_music INT(5) PRIMARY KEY AUTO_INCREMENT,
Titulo VARCHAR(20),
Autor VARCHAR(20)
)

CREATE TABLE esta (
cod_music INT(5),
cod_disco INT(5),
FOREIGN KEY(cod_music) REFERENCES musicas (cod_music)
FOREIGN KEY(cod_disco) REFERENCES discos (cod_disco)

)/*falha: chave estrangeira*/

