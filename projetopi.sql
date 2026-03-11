/* GRUPO 04
INTEGRANTES:                      RA:
Ana Clara Romero                03261047	
Ana Luisa Tchobnian             03261040
Felipe Amoroso					03261069
Guilherme Ferreira Moura		03261039
João Miguel Leite Sousa			03261053
João Victor Oliveira			03261055
Pedro henrique dos Santos		03261023
Pedro Silva Rivello				03261010
*/

-- SENSOR SMARTGREEN

CREATE DATABASE smartgreen;
use smartgreen;

CREATE TABLE usuario( 
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

INSERT INTO usuario(nome, email, senha, cpf, telefone, cidade , uf, cep,  endereco, numero , complemento, DtLogin) VALUES
('João Miguel', 'joaomiguel@gmail.com', 'joao212223', '129-456-954-2', '998279529','São Carlos', 'SP', '05137-200', 'Avenida mofarrej', '345' , '' , DEFAULT ),
('Pedro', 'pedro@gmail.com', 'pedro9382', '234-154-789-5', '944174356','Cabo Frio', 'RJ', '02315-100', 'Rua elisio', '120' , '' , DEFAULT ),
('Guilherme', 'guilherme2@gmail.com', 'guilherme9382', '984-321-564-8', '987124825','Indaial', 'SC', '04789-400', 'Avenida Isabel', '745' , 'Casa 02' , DEFAULT ),
('Pedro Rivello', 'rivello2@gmail.com', 'rivello8997', '456-678-098-1', '942158421','Xique-Xique', 'BA', '07710-500', 'Rua Liberdade', '115' , 'Casa 01' , DEFAULT ),
('Ana', 'ana2@gmail.com', 'ana4321', '734-921-843-3', '923671258','Campo Grande', 'MS', '06721-900', 'Avenida mato grosso', '450' , 'Casa 05' , DEFAULT );

SELECT * FROM usuario;

SELECT * FROM usuario WHERE email LIKE '%j%';

INSERT INTO usuario(nome, email, senha, cpf, telefone, cidade , uf, cep,  endereco, numero , complemento, DtLogin) VALUES 
( 'Beatriz', 'beatriz@gmail.com' , 'beatriz232122','179-441-229-98','943275072','Caldas Novas' , 'GO' , '23475-300', 'Rua joaqquim de menezes', '3818', 'casa 04' , DEFAULT ),
( 'Vitor', 'vitor@gmail.com' , 'vitor242325','654-312-543-33','923467215','Londrina' , 'PR' , '56721-720', 'Rua Peribal', '523', '' , DEFAULT );

DELETE FROM usuario WHERE idUsuario = '1';

SELECT * FROM usuario;

SELECT * FROM usuario WHERE idUsuario = '6';

ALTER TABLE usuario ADD COLUMN email_secundario VARCHAR(40);
UPDATE usuario SET email_secundario = 'joaomiguel2@gmail.com' WHERE idUsuario = 1;
UPDATE usuario SET email_secundario = 'pedro2@gmail.com' WHERE idUsuario = 2;
UPDATE usuario SET email_secundario = 'guilherme2@gmail.com' WHERE idUsuario = 3;
UPDATE usuario SET email_secundario = 'rivello2@gmail.com' WHERE idUsuario = 4;
UPDATE usuario SET email_secundario = 'ana2@gmail.com' WHERE idUsuario = 5;
UPDATE usuario SET email_secundario = 'beatriz2@gmail.com' WHERE idUsuario = 6;
UPDATE usuario SET email_secundario = 'vitor2@gmail.com' WHERE idUsuario = 7;
DESCRIBE usuario;
SELECT * FROM usuario;

DROP TABLE usuario;

CREATE TABLE login(
idlogin INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL,
senha VARCHAR(40) UNIQUE NOT NULL 
);

INSERT INTO login(nome, email, senha) VALUES
('João Miguel', 'joaomiguel@gmail.com', 'joao212223'),
('Pedro', 'pedro@gmail.com', 'pedro9382'),
('Guilherme', 'guilherme2@gmail.com', 'guilherme9382'),
('Pedro Rivello', 'rivello2@gmail.com', 'rivello8997'),
('Ana', 'ana2@gmail.com', 'ana4321');

SELECT * FROM login;

INSERT INTO login(nome, email, senha) VALUES 
('João Victor', 'joaovictor@gmail.com','jv212224'),
('Ana Luisa', 'analuisa@gmail.com', 'analuisa122112'),
('Felipe Amoroso', 'felipeamoroso@gmail.com','felipe454647');

DESCRIBE login;

UPDATE login SET senha = 'Joao2322122' WHERE idlogin = '1';
UPDATE login SET senha = 'pedro343536' WHERE idlogin = '2';
UPDATE login SET senha = 'gui454637' WHERE idlogin = '3';

DROP TABLE login;


Create table assinatura(
idAssinatura INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL ,
plano VARCHAR(30),
fatura VARCHAR(30),
valor  DECIMAL(10,2)
);


INSERT INTO assinatura VALUES 
(DEFAULT, 'João Miguel' , 'anual' , 'Paga' , 4600),
(DEFAULT, 'Pedro' , 'anual' , 'Paga' , 4600),
(DEFAULT, 'Guilherme' , 'anual' , 'Pendente' , 4600),
(DEFAULT, 'Pedro Rivello' , 'anual' , 'Pendente' , 4600),
(DEFAULT, 'Ana' , 'anual' , 'Paga' , 4600);

SELECT * FROM assinatura;

SELECT * FROM assinatura WHERE fatura = 'Pendente';
SELECT * FROM assinatura WHERE fatura = 'Paga';

ALTER TABLE assinatura ADD CONSTRAINT chkPag CHECK( fatura IN('Paga','Pendente'));
ALTER TABLE assinatura ADD CONSTRAINT chkPlan CHECK( plano IN('anual'));

INSERT INTO assinatura VALUES 
(DEFAULT, 'Beatriz', 'anual' , 'Pendente', 4600),
(DEFAULT, 'Vitor' , 'anual' , 'Paga', 4600);


DELETE FROM assinatura WHERE idAssinatura = '1';
SELECT nome AS 'Nome completo' FROM assinatura;

UPDATE assinatura SET fatura = 'Paga' WHERE idAssinatura = '3';
UPDATE assinatura SET fatura = 'Paga' WHERE idAssinatura = '4';
UPDATE assinatura SET fatura = 'Paga' WHERE idAssinatura = '6';

SELECT * FROM assinatura;
ALTER TABLE assinatura ADD COLUMN dtPagamento date;
UPDATE assinatura SET dtPagamento = '2026-01-20' where idAssinatura = '3';
UPDATE assinatura SET dtPagamento = '2026-01-10' where idAssinatura = '4';
UPDATE assinatura SET dtPagamento = '2026-01-07' where idAssinatura = '5';
UPDATE assinatura SET dtPagamento = '2026-01-22' where idAssinatura = '6';
UPDATE assinatura SET dtPagamento = '2026-02-23' where idAssinatura = '7';
SELECT * FROM assinatura;
DESCRIBE assinatura;

DROP TABLE  assinatura;

CREATE TABLE sensor(
idsensor INT PRIMARY KEY auto_increment,
codigo_sensor CHAR(6) NOT NULL UNIQUE, 
nome_sensor VARCHAR(40) NOT NULL, 
proprietario VARCHAR(40) NOT NULL,
porte_produtor VARCHAR(40) NOT NULL,
tamanho_area VARCHAR(40) NOT NULL,
tipo_tomate VARCHAR(40) NOT NULL
);

INSERT INTO sensor(codigo_sensor, nome_sensor, proprietario, porte_produtor, tamanho_area, tipo_tomate ) VALUES 
('012601','LM35','João Miguel', 'grande porte', '300 hectares', 'Tomate Salada'),
('012602','LM35','Pedro', 'médio porte', '90 hectares', 'Tomate Italiano' ),
('012603','LM35','Guilherme', 'pequeno porte', '50 hectares', 'Tomate Cereja'),
('012605','LM35','Ana', 'grande porte', '400 hectares', 'Tomate Cereja' ),
('012606','LM35','Vitor', 'grande porte', '450 hectares', 'Tomate Grape' );

INSERT INTO sensor (codigo_sensor, nome_sensor, proprietario, porte_produtor, tamanho_area, tipo_tomate ) VALUES
('012608','LM35','Pedro Rivello', 'pequeno porte', '35 hectares', 'Tomate Grape'),
('012609','LM35','Beatriz', 'pequeno porte', '35 hectares', 'Tomate Grape');


SELECT * FROM sensor WHERE tamanho_area <200;
SELECT * FROM sensor WHERE tamanho_area >140;
SELECT * FROM sensor WHERE tamanho_area =400;

SELECT codigo_sensor AS "Codigo unico do sensor", porte_produtor AS "Porte do produtor rural", proprietario AS "Nome do cliente", tipo_tomate AS 'tipo do tomate presente na plantação' FROM sensor WHERE nome_sensor = 'LM35';

DROP TABLE sensor;

CREATE TABLE registro_sensor(
idregistro INT PRIMARY KEY auto_increment,
codigo_sensor CHAR(6) NOT NULL UNIQUE,
temperatura DECIMAL(3,1) NOT NULL,
dia_registro DATETIME DEFAULT current_timestamp,
proprietario VARCHAR(40) NOT NULL,
stts VARCHAR(30)
);

INSERT INTO registro_sensor(codigo_sensor, temperatura, proprietario, stts) VALUES 
('012601','18.2','João Miguel','Dentro da faixa ideal'),
('012602','21.8','Pedro','Dentro da faixa ideal'),
('012603','15.4','Guilherme','Fora da faixa ideal'),
('012604','19.2','Pedro Rivell','Dentro da faixa ideal'),
('012605','26.3','Ana','Fora da faixa ideal'),
('012606','14.1','Beatriz','Fora da faixa ideal'),
('012607','17.2','Vitor','Fora da faixa ideal');

SELECT * FROM registro_sensor;

ALTER TABLE registro_sensor ADD CONSTRAINT chkStts CHECK (stts IN('Estável','Instável'));

SELECT * FROM registro_sensor WHERE temperatura <17;
DESCRIBE  registro_sensor;
DROP TABLE registro_sensor;

