-- SENSOR SMARTGREEN

CREATE DATABASE smartgreen;
use smartgreen;

CREATE TABLE cliente( 
idUsuario INT PRIMARY KEY auto_increment,
nome VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
senha VARCHAR(40) NOT NULL,
cpf VARCHAR(20) NOT NULL UNIQUE,
telefone INT NOT NULL UNIQUE,
cidade VARCHAR (100) NOT NULL, 
UF CHAR (2) NOT NULL,
cep CHAR(9) NOT NULL,
endereco VARCHAR(100) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(100), 
DtLogin  DATETIME DEFAULT current_timestamp 
);


CREATE TABLE login(
idlogin INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL,
senha VARCHAR(40) UNIQUE NOT NULL 
);


CREATE TABLE sensor(
idsensor INT PRIMARY KEY auto_increment,
estado VARCHAR(15) NOT NULL, 
CONSTRAINT chk_estado_fisico_sensor 
CHECK (estado IN('reparo necessario', 'inativo', 'em funcionamento')),
fkCliente INT,
CONSTRAINT fkSensorCliente FOREIGN KEY (fkCliente)
	REFERENCES cliente(idUsuario)
);


CREATE TABLE registro_sensor(
idregistro INT PRIMARY KEY auto_increment,
temperatura DECIMAL(3,1) NOT NULL,
momento_registro DATETIME DEFAULT current_timestamp
-- fk que liga o registro do sensor ao id do sensor
-- fk que liga em qual estufa foi registrado esse dado
);

CREATE TABLE estufa(
id_estufa INT PRIMARY KEY AUTO_INCREMENT,
comprimento DECIMAL(5,2),
largura DECIMAL(5,2),
altura DECIMAL(5,2),
area DECIMAL(6,2),
volume DECIMAL(7,2),
fkCliente INT,
CONSTRAINT fkEstufaCliente FOREIGN KEY (fkCliente)
	REFERENCES cliente(idUsuario)
);
