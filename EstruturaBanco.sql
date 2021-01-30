CREATE DATABASE IF NOT EXISTS `projeto_pwe` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projeto_pwe`;

/* ModeloLogico: */

CREATE TABLE Sinergia (
    ID int PRIMARY KEY auto_increment,
    NOME varchar(50),
    FOTO varchar(50),
    DESCRIP varchar(500),
    MARCA_DESCRIP varchar(400),
    MARCA int,
    QTD_MK1 int,
    QTD_MK2 int,
    QTD_MK3 int,
    QTD_MK4 int,
    TIPO varchar(2)
);

CREATE TABLE Campeao (
    ID int PRIMARY KEY auto_increment,
    NOME varchar(50),
    FOTO varchar(50),
    HABILIDADE varchar(50),
    HABILIDADE_FOTO varchar(50),
    HABILIDADE_DESCRIP varchar(600),
    HABILIDADE_NVL varchar(400),
    CUSTO int
);

CREATE TABLE Usuario (
    ID int PRIMARY KEY auto_increment,
    ID_NIVEL int DEFAULT 1,
    NOME varchar(100),
    FOTO varchar(50) DEFAULT "icone.png",
    SENHA varchar(50),
    EMAIL varchar(100)
);

CREATE TABLE Requisicao (
    ID int PRIMARY KEY auto_increment,
    ID_USUARIO int,
    NIVEL_ATUAL varchar(50),
    NIVEL_ALMEJADO varchar(50)
);

CREATE TABLE NivelUsuario (
    ID int PRIMARY KEY auto_increment,
    NOME varchar(50)
);

CREATE TABLE Build (
    ID int PRIMARY KEY auto_increment,
    ID_USUARIO int,
    NOME varchar(50),
    DESCRIP varchar(400)
);

CREATE TABLE SinCam (
    ID_CAMPEAO int not null,
    ID_SINERGIA int not null
);

CREATE TABLE BuildCamp (
    ID_CAMPEAO int not null,
    ID_BUILD int not null
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (ID_NIVEL)
    REFERENCES NivelUsuario (ID)
    ON DELETE CASCADE;
    
ALTER TABLE Requisicao ADD CONSTRAINT FK_Requisicao_2
    FOREIGN KEY (ID_USUARIO)
    REFERENCES Usuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Build ADD CONSTRAINT FK_Build_2
    FOREIGN KEY (ID_USUARIO)
    REFERENCES Usuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE SinCam ADD CONSTRAINT FK_ClaCam_1
    FOREIGN KEY (ID_CAMPEAO)
    REFERENCES Campeao (ID)
    ON DELETE CASCADE;
 
ALTER TABLE SinCam ADD CONSTRAINT FK_ClaCam_2
    FOREIGN KEY (ID_SINERGIA)
    REFERENCES Sinergia (ID)
    ON DELETE CASCADE;
    
ALTER TABLE SinCam ADD PRIMARY KEY( ID_CAMPEAO, ID_SINERGIA);
 
ALTER TABLE BuildCamp ADD CONSTRAINT FK_BuildCamp_1
    FOREIGN KEY (ID_CAMPEAO)
    REFERENCES Campeao (ID)
    ON DELETE CASCADE;
 
ALTER TABLE BuildCamp ADD CONSTRAINT FK_BuildCamp_2
    FOREIGN KEY (ID_BUILD)
    REFERENCES Build (ID)
    ON DELETE CASCADE;
    
ALTER TABLE BuildCamp ADD PRIMARY KEY( ID_CAMPEAO, ID_BUILD);