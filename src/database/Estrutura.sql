DROP DATABASE IF EXISTS denuncias;
CREATE DATABASE IF NOT EXISTS denuncias;
USE denuncias;

CREATE TABLE IF NOT EXISTS receptores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(25) UNIQUE NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    cpf VARCHAR(15) UNIQUE NOT NULL,
    cep INT(8) NOT NULL,
    cargo VARCHAR(20)NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone_celular BIGINT(15),
    email VARCHAR(64) UNIQUE NOT NULL,
    foto BLOB
);


CREATE TABLE IF NOT EXISTS emissores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(25) UNIQUE NOT NULL,
    senha VARCHAR(128) NOT NULL,
    nome VARCHAR(100)NOT NULL,
    cpf VARCHAR(15) UNIQUE NOT NULL,
    rg BIGINT(7) UNIQUE NOT NULL,
    endereco VARCHAR(100)NOT NULL,
    telefone_celular BIGINT(15)NOT NULL,
    email VARCHAR(64) UNIQUE NOT NULL,
    cep VARCHAR(10)NOT NULL,
    trotes INT(2),
    foto BLOB
);


CREATE TABLE tipo_ocorrencias_policiais (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30),
    descricao TEXT,
    gravidade INT
);	

CREATE TABLE IF NOT EXISTS ocorrencias_policiais (
	
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    
    id_tipo_ocorrencias_policiais INT UNSIGNED , 
    id_emissor INT UNSIGNED,
    
	FOREIGN KEY (id_tipo_ocorrencias_policiais) REFERENCES tipo_ocorrencias_policiais(id),
	FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8), 
    rua VARCHAR(60),
    numero_residencia INT(5),
    logradouro VARCHAR(20)
);


INSERT INTO tipo_ocorrencias_policiais(tipo, gravidade) VALUES
 	("Assédio", 1),	
	("Furto", 1),
	("Vandalismo", 1),
	("Perturbação à ordem pública", 1),
	("Assalto", 2),
	("Roubo", 2),
	("Agressão física", 2),
	("Violência doméstica", 2),
	("Homicídio", 3),
	("Latrocínio", 3),
	("Sequestro", 3),
	("Estupro", 3),
	("Abuso de menor", 3);



CREATE TABLE tipo_ocorrencias_medicas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30),
    descricao TEXT
);		


CREATE TABLE  IF NOT EXISTS  ocorrencias_medicas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    
    id_tipo_ocorrencia_medica INT UNSIGNED , 
    id_emissor INT UNSIGNED,
    
	FOREIGN KEY (id_tipo_ocorrencia_medica) REFERENCES tipo_ocorrencias_medicas(id),
    FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8), 
    rua VARCHAR(60),
    numero_residencia INT(5),
    logradouro VARCHAR(20)

);		


INSERT INTO tipo_ocorrencias_medicas(tipo) VALUES
	("Derrame"),
	("Infarto"),
	("Parada respiratória"),
	("Parada cardíaca"),
	("Parada cardiorespiratória"),
	("Envenenamento"),
	("Perda de consciência"),
	("Queimaduras"),
	("Afogamento"),
	("Choque elétrico"),
	("Trabalho de parto"),
	("Convulsão"),
	("Tentativa de suicídio");
    
    

CREATE TABLE tipo_ocorrencias_bombeiros (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(21),
    descricao TEXT
);

INSERT INTO tipo_ocorrencias_bombeiros(tipo) VALUES
	("Acidente de trânsito"),
 	("Incêndio"),
 	("Queimaduras"),
 	("Choque elétrico"),
	("Afogamento");

CREATE TABLE  IF NOT EXISTS  ocorrencias_bombeiros(
 
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    
    id_tipo_ocorrencias_bombeiros INT UNSIGNED, 
    id_emissor INT UNSIGNED,
    
	FOREIGN KEY (id_tipo_ocorrencias_bombeiros) REFERENCES tipo_ocorrencias_bombeiros(id),
    FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8), 
    rua VARCHAR(60),
    numero_residencia INT(5),
    logradouro VARCHAR(20)
	
);

CREATE TABLE tipo_ocorrencias_defesa_civil (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(40),
    descricao TEXT
);

CREATE TABLE  IF NOT EXISTS  ocorrencias_defesa_civil(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    
    id_tipo_ocorrencias_defesa_civil INT UNSIGNED, 
    id_emissor INT UNSIGNED,
    
	FOREIGN KEY (id_tipo_ocorrencias_defesa_civil) REFERENCES tipo_ocorrencias_defesa_civil(id),
    FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8), 
    rua VARCHAR(60),
    numero_residencia INT(5),
    logradouro VARCHAR(20)

);

INSERT INTO tipo_ocorrencias_defesa_civil(tipo) VALUES
	("Deslizamento de terra"),
    ("Vazamento de gases"),
    ("Quedas de postes de energia elétrica"),
	("Enchente");
    

