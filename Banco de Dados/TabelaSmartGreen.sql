-- SENSOR SMARTGREEN

CREATE DATABASE smartgreen;
use smartgreen;
drop database smartgreen;

CREATE TABLE login(
idLogin INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
email VARCHAR(40) UNIQUE NOT NULL,
senha VARCHAR(40) NOT NULL 
);


CREATE TABLE cliente( 
idCliente INT PRIMARY KEY auto_increment,
cpf CHAR(11) NOT NULL UNIQUE,
telefone varchar (15) NOT NULL UNIQUE,
cidade VARCHAR (100) NOT NULL, 
UF CHAR (2) NOT NULL,
cep CHAR(9) NOT NULL,
endereco VARCHAR(100) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(100), 
DtLogin  DATETIME DEFAULT current_timestamp,
fkLogin int NOT NULL,
	CONSTRAINT fkLoginCliente 
		FOREIGN KEY (fkLogin) 
			REFERENCES login (idLogin)
);


CREATE TABLE estufa(
idEstufa INT PRIMARY KEY AUTO_INCREMENT,
comprimento DECIMAL(5,2),
largura DECIMAL(5,2),
altura DECIMAL(5,2),
area DECIMAL(6,2),
volume DECIMAL(7,2),
fkCliente INT NOT NULL,
	CONSTRAINT fkEstufaCliente 
		FOREIGN KEY (fkCliente)
			REFERENCES cliente(idCliente)
);



CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
estado VARCHAR(20) NOT NULL, 
CONSTRAINT chk_estado_fisico_sensor 
CHECK (estado IN('reparo necessario', 'inativo', 'em funcionamento')),
fkEstufa INT NOT NULL,
	CONSTRAINT fkSensorEstufa
		FOREIGN KEY (fkEstufa)
			REFERENCES estufa (idEstufa)
);



CREATE TABLE registro_sensor(
idRegistro INT PRIMARY KEY auto_increment,
temperatura DECIMAL(3,1) NOT NULL,
umidade DECIMAL(3,1) NOT NULL,
momento_registro DATETIME DEFAULT current_timestamp,
	fkSensor int NOT NULL,
		CONSTRAINT fkRegistroSensor 
			FOREIGN KEY (fKSensor)
				REFERENCES sensor (idSensor)
);
	
    


INSERT INTO login (nome, email, senha) 
VALUES ('Kauã', 'kaua.aaa@fazenda.com', 'senhaTop123');

INSERT INTO cliente (cpf, telefone, cidade, UF, cep, endereco, numero, fkLogin)
VALUES ('12345678901', '11999999999', 'São Paulo', 'SP', '10000000', 'Fazenda Top', 101, 1);

INSERT INTO estufa (comprimento, largura, altura, area, volume, fkCliente)
VALUES (50.0, 10.0, 3.5, 500.0, 1750.0, 1);

INSERT INTO sensor (estado, fkEstufa) 
VALUES ('em funcionamento', 1);

INSERT INTO registro_sensor (umidade,temperatura, fkSensor) VALUES (60,25.5, 1);
INSERT INTO registro_sensor (umidade,temperatura, fkSensor) VALUES (50,26.2, 1);
INSERT INTO registro_sensor (umidade,temperatura, fkSensor) VALUES (99,27.0, 1);


SELECT 
    nome AS 'Produtor',
    idEstufa AS 'Numero da Estufa',
    temperatura AS 'Temperatura Registrada (°C)',
    umidade AS 'Umidade Registrada (%)',
    momento_registro AS 'Data e Hora'
FROM login
JOIN cliente ON fkLogin = idLogin 
JOIN estufa ON fkCliente = idCliente  
JOIN sensor ON fkEstufa = idEstufa
JOIN registro_sensor ON fkSensor = idSensor;

