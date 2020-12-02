CREATE DATABASE dbMuzka;
USE dbMuzka;

SET GLOBAL lc_time_names=pt_BR;

CREATE TABLE Usuario(
idUsuario int AUTO_INCREMENT,
login varchar(30) NOT NULL UNIQUE,
senha varchar(30) NOT NULL,
ativo boolean DEFAULT 1,
PRIMARY KEY(idUsuario)
);

CREATE TABLE Genero(
idGenero int AUTO_INCREMENT,
descricaoGenero varchar(30) NOT NULL UNIQUE,
ativo boolean DEFAULT 1,
PRIMARY KEY(idGenero)
);

CREATE TABLE Musica(
idMusica int AUTO_INCREMENT,
tituloMusica varchar(100) NOT NULL,
postoMusica real NOT NULL DEFAULT 0,
ativo boolean DEFAULT 1,
PRIMARY KEY(idMusica)
);

CREATE TABLE UsuarioGeneroPreferido(
idUsuario int NOT NULL,
idGenero int NOT NULL,
dataInsercao datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(idUsuario, idGenero)
);

CREATE TABLE NotaUsuarioMusica(
idUsuario int NOT NULL,
idMusica int NOT NULL,
notaMusica int NOT NULL DEFAULT 0,
PRIMARY KEY(idUsuario, idMusica)
);

CREATE TABLE GeneroMusica(
idGenero int NOT NULL,
idMusica int NOT NULL,
PRIMARY KEY(idGenero, idMusica)
);

ALTER TABLE UsuarioGeneroPreferido ADD CONSTRAINT FK_UsuarioPreferido FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);
ALTER TABLE UsuarioGeneroPreferido ADD CONSTRAINT FK_GeneroPreferido FOREIGN KEY (idGenero) REFERENCES Genero(idGenero);

ALTER TABLE NotaUsuarioMusica ADD CONSTRAINT FK_UsuarioNota FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);
ALTER TABLE NotaUsuarioMusica ADD CONSTRAINT FK_MusicaNota FOREIGN KEY (idMusica) REFERENCES Musica(idMusica);

ALTER TABLE GeneroMusica ADD CONSTRAINT FK_Genero FOREIGN KEY (idGenero) REFERENCES Genero(idGenero);
ALTER TABLE GeneroMusica ADD CONSTRAINT FK_Musica FOREIGN KEY (idMusica) REFERENCES Musica(idMusica);

#tentiva de usar proc que não deu certo na hora de implementar no sistema
USE dbMuzka;
DELIMITER $$
CREATE PROCEDURE cadastrar_usuario(login varchar(30), senha varchar(30))
BEGIN
INSERT INTO usuario(login, senha) VALUES(login, senha);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_genero(descricaoGenero varchar(30))
BEGIN
INSERT INTO genero(descricaoGenero) VALUES(descricaoGenero);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_musica(tituloMusica varchar(100))
BEGIN
INSERT INTO musica(tituloMusica) VALUES(tituloMusica);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_generoMusica(idGenero int, idMusica int)
BEGIN
INSERT INTO generomusica(idGenero, idMusica) VALUES(idGenero, idMusica);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_notaUsuarioMusica(idUsuario int, idMusica int, notaMusica int)
BEGIN
INSERT INTO notausuariomusica(idUsuario, idMusica, notaMusica) VALUES(idUsuario, idMusica, notaMusica);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_usuarioGeneroPreferido(idUsuario int, idGenero int)
BEGIN
INSERT INTO usuarioGeneroPreferido(idUsuario, idGenero) VALUES(idUsuario, idGenero);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE obter_genero()
BEGIN
SELECT * FROM genero order by descricaoGenero;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE consulta_idGenero(descricaoGenero varchar(30))
BEGIN
SELECT idGenero FROM genero WHERE descricaoGenero=descricaoGenero;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE existeGenero(descricaoGenero varchar(30))
BEGIN
SELECT descricaoGenero FROM genero WHERE descricaoGenero=descricaoGenero;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE existeGeneroMusica(idMusica int, idGenero int)
BEGIN
SELECT * FROM generoMusica WHERE idMusica=idMusica AND idGenero=idGenero;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE obterMusica()
BEGIN
SELECT * FROM musica ORDER BY tituloMusica;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE verificarNota(idMusica int, idUsuario int)
BEGIN
SELECT * FROM musica WHERE idMusica=idMusica AND idUsuario=idUsuario;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE atualizarNota(nota int, idUsuario int, idMusica int)
BEGIN
UPDATE notaUsuarioMusica SET notaMusica=nota WHERE idUsuario=idUsuario AND idMusica=idMusica;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE consultaIdMusica(tituloMusica varchar(100))
BEGIN
SELECT idMusica FROM musica WHERE tituloMusica=tituloMusica;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE mediaPosto(idMusica int)
BEGIN
SELECT AVG(notaMusica) FROM notaUsuarioMusica WHERE idMusica=idMusica;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE atualizaPosto(idMusica int, posto double)
BEGIN
UPDATE Musica SET postoMusica = posto WHERE idMusica=idMusica;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE existeMusica(tituloMusica varchar(100))
BEGIN
SELECT tituloMusica FROM musica WHERE tituloMusica=tituloMusica;
END $$
DELIMITER ;

USE dbMuzka;

CALL cadastrar_usuario('admin', 'admin');
CALL cadastrar_usuario('jldurigan', '1234admin');
CALL cadastrar_usuario('satcher', '4321admin');

CALL cadastrar_genero('Rap');
CALL cadastrar_genero('Pop');
CALL cadastrar_genero('Rock');
CALL cadastrar_genero('Forró');
CALL cadastrar_genero('Sertanejo');
CALL cadastrar_genero('Funk');
CALL cadastrar_genero('Reggaeton');
CALL cadastrar_genero('Trap');
CALL cadastrar_genero('Nacional');
CALL cadastrar_genero('Internacional');

CALL cadastrar_musica('Ultralight Beam - Kanye West');
CALL cadastrar_musica('Gold Digger - Kanye West');
CALL cadastrar_musica('Day and Nite - Kid Cudi');
CALL cadastrar_musica('Sicko Mode - Travis Scott');
CALL cadastrar_musica('Monster - Rihanna ft. Eminem');
CALL cadastrar_musica('Diamonds - Rihanna');
CALL cadastrar_musica('Future Nostalgia - Dua Lipa');
CALL cadastrar_musica('Into You - Ariana Grande');
CALL cadastrar_musica('Bad Romance - Lady Gaga');
CALL cadastrar_musica('Froot - MARINA');
CALL cadastrar_musica('Enter Sandman - Metallica');
CALL cadastrar_musica('Misery Business - Paramore');
CALL cadastrar_musica('American Idiot - Green Day');
CALL cadastrar_musica('All the small things - Blink 182');
CALL cadastrar_musica('Teto de vidro - Pitty');
CALL cadastrar_musica('Rita - Tierry');
CALL cadastrar_musica('Quem é seu favorito - Barões da Pisadinha');
CALL cadastrar_musica('HB20 - Tierry');
CALL cadastrar_musica('Recairei - Barões da Pisadinha');
CALL cadastrar_musica('Investe em mim - Jonas Esticado');
CALL cadastrar_musica('Nem doeu - Matheus e Kauan');
CALL cadastrar_musica('Alô Ambev - Zé Neto e Cristiano');
CALL cadastrar_musica('Galopeira - Chitãozinho e Chororó');
CALL cadastrar_musica('Amoreco - Simone e Simaria');
CALL cadastrar_musica('Nem Tchum - Maiara e Maraisa');
CALL cadastrar_musica('Ritmo Mexicano - MC GW');
CALL cadastrar_musica('Raba Safada - MC 7 Belo');
CALL cadastrar_musica('Pock Pock - MC PR');
CALL cadastrar_musica('Cabaré - MC Pierre, DJ Guuga');
CALL cadastrar_musica('Baile de Favela - MC João');
CALL cadastrar_musica('Se preparó - Ozuna');
CALL cadastrar_musica('Mayores - Becky G');
CALL cadastrar_musica('Barro Cassette - Maluma');
CALL cadastrar_musica('Bonita - J Balvin');
CALL cadastrar_musica('Despacito - Luis Fonsi');
CALL cadastrar_musica('Máquina do Tempo - Matuê');
CALL cadastrar_musica('777 666 - Matuê');
CALL cadastrar_musica('Telepatia - Akuna');
CALL cadastrar_musica('Glockada - Ngc Daddy');
CALL cadastrar_musica('Nem me sinto mal mais - Sidoka');
CALL cadastrar_musica('Nego Drama - Racionais MCs');
CALL cadastrar_musica('Estilo Cachorro - Racionais MCs');
CALL cadastrar_musica('Ilusão - Filipe Ret');
CALL cadastrar_musica('Poesia Acústica 7 - Pineapple Stormtv');
CALL cadastrar_musica('Leal - Djonga');

CALL cadastrar_generoMusica(1, 1);
CALL cadastrar_generoMusica(10, 1);
CALL cadastrar_generoMusica(1, 2);
CALL cadastrar_generoMusica(10, 2);
CALL cadastrar_generoMusica(1, 3);
CALL cadastrar_generoMusica(10, 3);
CALL cadastrar_generoMusica(1, 4);
CALL cadastrar_generoMusica(8, 4);
CALL cadastrar_generoMusica(10, 4);
CALL cadastrar_generoMusica(1, 5);
CALL cadastrar_generoMusica(10, 5);
CALL cadastrar_generoMusica(2, 6);
CALL cadastrar_generoMusica(10, 6);
CALL cadastrar_generoMusica(2, 7);
CALL cadastrar_generoMusica(10, 7);
CALL cadastrar_generoMusica(2, 8);
CALL cadastrar_generoMusica(10, 8);
CALL cadastrar_generoMusica(2, 9);
CALL cadastrar_generoMusica(10, 9);
CALL cadastrar_generoMusica(2, 10);
CALL cadastrar_generoMusica(10, 10);
CALL cadastrar_generoMusica(3, 11);
CALL cadastrar_generoMusica(10, 11);
CALL cadastrar_generoMusica(3, 12);
CALL cadastrar_generoMusica(10, 12);
CALL cadastrar_generoMusica(3, 13);
CALL cadastrar_generoMusica(10, 13);
CALL cadastrar_generoMusica(2, 14);
CALL cadastrar_generoMusica(3, 14);
CALL cadastrar_generoMusica(10, 14);
CALL cadastrar_generoMusica(3, 15);
CALL cadastrar_generoMusica(9, 15);
CALL cadastrar_generoMusica(4, 16);
CALL cadastrar_generoMusica(9, 16);
CALL cadastrar_generoMusica(4, 17);
CALL cadastrar_generoMusica(9, 17);
CALL cadastrar_generoMusica(4, 18);
CALL cadastrar_generoMusica(9, 18);
CALL cadastrar_generoMusica(4, 19);
CALL cadastrar_generoMusica(9, 19);
CALL cadastrar_generoMusica(4, 20);
CALL cadastrar_generoMusica(9, 20);
CALL cadastrar_generoMusica(5, 21);
CALL cadastrar_generoMusica(9, 21);
CALL cadastrar_generoMusica(5, 22);
CALL cadastrar_generoMusica(9, 22);
CALL cadastrar_generoMusica(5, 23);
CALL cadastrar_generoMusica(9, 23);
CALL cadastrar_generoMusica(5, 24);
CALL cadastrar_generoMusica(9, 24);
CALL cadastrar_generoMusica(5, 25);
CALL cadastrar_generoMusica(9, 25);
CALL cadastrar_generoMusica(6, 26);
CALL cadastrar_generoMusica(9, 26);
CALL cadastrar_generoMusica(6, 27);
CALL cadastrar_generoMusica(9, 27);
CALL cadastrar_generoMusica(6, 28);
CALL cadastrar_generoMusica(9, 28);
CALL cadastrar_generoMusica(6, 29);
CALL cadastrar_generoMusica(9, 29);
CALL cadastrar_generoMusica(6, 30);
CALL cadastrar_generoMusica(9, 30);
CALL cadastrar_generoMusica(7, 31);
CALL cadastrar_generoMusica(10, 31);
CALL cadastrar_generoMusica(7, 32);
CALL cadastrar_generoMusica(10, 32);
CALL cadastrar_generoMusica(7, 33);
CALL cadastrar_generoMusica(10, 33);
CALL cadastrar_generoMusica(7, 34);
CALL cadastrar_generoMusica(10, 34);
CALL cadastrar_generoMusica(7, 35);
CALL cadastrar_generoMusica(10, 35);
CALL cadastrar_generoMusica(8, 36);
CALL cadastrar_generoMusica(9, 36);
CALL cadastrar_generoMusica(8, 37);
CALL cadastrar_generoMusica(9, 37);
CALL cadastrar_generoMusica(8, 38);
CALL cadastrar_generoMusica(9, 38);
CALL cadastrar_generoMusica(8, 39);
CALL cadastrar_generoMusica(9, 39);
CALL cadastrar_generoMusica(8, 40);
CALL cadastrar_generoMusica(9, 40);
CALL cadastrar_generoMusica(1, 41);
CALL cadastrar_generoMusica(9, 41);
CALL cadastrar_generoMusica(1, 42);
CALL cadastrar_generoMusica(9, 42);
CALL cadastrar_generoMusica(1, 43);
CALL cadastrar_generoMusica(9, 43);
CALL cadastrar_generoMusica(1, 44);
CALL cadastrar_generoMusica(9, 44);
CALL cadastrar_generoMusica(1, 45);
CALL cadastrar_generoMusica(9, 45);

CALL cadastrar_notaUsuarioMusica(2, 1, 5);
CALL cadastrar_notaUsuarioMusica(2, 2, 3);
CALL cadastrar_notaUsuarioMusica(2, 5, 4);
CALL cadastrar_notaUsuarioMusica(2, 9, 5);
CALL cadastrar_notaUsuarioMusica(2, 10, 5);
CALL cadastrar_notaUsuarioMusica(3, 30, 5);
CALL cadastrar_notaUsuarioMusica(3, 35, 4);
CALL cadastrar_notaUsuarioMusica(3, 23, 2);
CALL cadastrar_notaUsuarioMusica(3, 44, 1);
CALL cadastrar_notaUsuarioMusica(3, 41, 3);
CALL cadastrar_notaUsuarioMusica(2, 11, 4);
CALL cadastrar_notaUsuarioMusica(3, 12, 4);

CALL cadastrar_usuarioGeneroPreferido(2, 2);
CALL cadastrar_usuarioGeneroPreferido(2, 1);
CALL cadastrar_usuarioGeneroPreferido(2, 3);
CALL cadastrar_usuarioGeneroPreferido(3, 7);
CALL cadastrar_usuarioGeneroPreferido(3, 3);
CALL cadastrar_usuarioGeneroPreferido(3, 6);
