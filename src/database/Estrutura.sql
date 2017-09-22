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
    trotes INT(2)NOT NULL,
    foto BLOB
);

CREATE TABLE tipo_ocorrencias_policiais (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30),
    descricao TEXT
);

CREATE TABLE tipo_ocorrencias_bombeiros (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(21),
    descricao TEXT
);

CREATE TABLE tipo_ocorrencias_medicas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30),
    descricao TEXT
);

CREATE TABLE tipo_ocorrencias_defesa_civil (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(40),
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS ocorrencias_policiais (

    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    id_tipo_ocorrencias_policiais INT UNSIGNED ,
    id_emissor INT UNSIGNED,

	FOREIGN KEY (id_tipo_ocorrencias_policiais) REFERENCES tipo_ocorrencias_policiais(id),
	FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8),
    rua VARCHAR(60)NOT NULL,
    numero_residencia INT(5),
    trote BOOLEAN
);

CREATE TABLE  IF NOT EXISTS  ocorrencias_medicas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    id_tipo_ocorrencias_medicas INT UNSIGNED ,
    id_emissor INT UNSIGNED,

	FOREIGN KEY (id_tipo_ocorrencias_medicas) REFERENCES tipo_ocorrencias_medicas(id),
    FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8),
    rua VARCHAR(60)NOT NULL,
    numero_residencia INT(5),
	trote BOOLEAN
);

CREATE TABLE  IF NOT EXISTS  ocorrencias_bombeiros(

	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    id_tipo_ocorrencias_bombeiros INT UNSIGNED,
    id_emissor INT UNSIGNED,

	FOREIGN KEY (id_tipo_ocorrencias_bombeiros) REFERENCES tipo_ocorrencias_bombeiros(id),
    FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8),
    rua VARCHAR(60)NOT NULL,
    numero_residencia INT(5),
	trote BOOLEAN
);

CREATE TABLE  IF NOT EXISTS  ocorrencias_defesa_civil(
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    id_tipo_ocorrencias_defesa_civil INT UNSIGNED,
    id_emissor INT UNSIGNED,

	FOREIGN KEY (id_tipo_ocorrencias_defesa_civil) REFERENCES tipo_ocorrencias_defesa_civil(id),
    FOREIGN KEY (id_emissor) REFERENCES emissores(id),

    cep INT(8),
    rua VARCHAR(60)NOT NULL,
    numero_residencia INT(5),
	trote BOOLEAN
);

INSERT INTO tipo_ocorrencias_policiais(tipo) VALUES
 	("3 Assédio"),
	("3 Furto"),
	("3 Vandalismo"),
	("3 Perturbação à ordem pública"),
	("2 Assalto"),
	("2 Roubo"),
	("2 Agressão física"),
	("2 Violência doméstica"),
	("1 Homicídio"),
	("1 Latrocínio"),
	("1 Sequestro"),
	("1 Estupro"),
	("1 Abuso de menor");

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


INSERT INTO tipo_ocorrencias_bombeiros(tipo) VALUES
	("Acidente de trânsito"),
 	("Incêndio"),
 	("Queimaduras"),
 	("Choque elétrico"),
	("Afogamento");


INSERT INTO tipo_ocorrencias_defesa_civil(tipo) VALUES
	("Deslizamento de terra"),
    ("Vazamento de gases"),
    ("Quedas de postes de energia elétrica"),
	("Enchente");

INSERT INTO emissores(id, usuario, senha, nome, cpf, rg, endereco, telefone_celular, email, cep, trotes) VALUES
	("1","FelipeCaz", "4DFF4EA340F0A823F15D3F4F01AB62EAE0E5DA579CCB851F8DB9DFE84C58B2B37B89903A740E1EE172DA793A6E79D560E5F7F9BD058A12A280433ED6FA46510A", "Felipe de Jesus Cazagranda" , "893007726" , 487517118 ,"Rua das Margaridas" , "993346739" ,
    "felipe@hotmail.com" , "89068-700" , 0),
    ("2","RenanRoeder","40B244112641DD78DD4F93B6C9190DD46E0099194D5A44257B7EFAD6EF9FF4683DA1EDA0244448CB343AA688F5D3EFD7314DAFE580AC0BCBF115AECA9E8DC114", "Renan Roeder", "8944477", 48877784, "Rua Jorge Wagner", "9899144", "renan@hotmail.com", "89222554",0),
    ("3","Wanderson","3BAFBF08882A2D10133093A1B8433F50563B93C14ACD05B79028EB1D12799027241450980651994501423A66C276AE26C43B739BC65C4E16B10C3AF6C202AEBB", "Wanderson", "8944445", 48999644, "Rua General Ósorio", "9899144", "wanderson@hotmail.com", "89222574",0),
    ("4","Antonio","A321D8B405E3EF2604959847B36D171EEBEBC4A8941DC70A4784935A4FCA5D5813DE84DFA049F06549AA61B20848C1633CE81B675286EA8FB53DB240D831C568", "Antonio", "89444445", 4888999, "Rua 7 de Setembro", "9899144", "antonio@hotmail.com", "89222578",0);

INSERT INTO receptores(id, login, nome_completo, senha, cpf, cep, cargo, endereco, telefone_celular, email) VALUES
	("1","João", "João Raimundo", "4DFF4EA340F0A823F15D3F4F01AB62EAE0E5DA579CCB851F8DB9DFE84C58B2B37B89903A740E1EE172DA793A6E79D560E5F7F9BD058A12A280433ED6FA46510A" , "83643967810" , 95062356 , "MED" , "Badenfurt" , "993346739" ,
	"joao@hotmail.com"),
	("2","Pedro", "Pedro Henrique", "40B244112641DD78DD4F93B6C9190DD46E0099194D5A44257B7EFAD6EF9FF4683DA1EDA0244448CB343AA688F5D3EFD7314DAFE580AC0BCBF115AECA9E8DC114" , "8364396781" , 95062357 , "CDB" , "Passo Manso" , "993346735" ,
	"pedro@hotmail.com"),
	("3","Rafael", "Rafael", "3BAFBF08882A2D10133093A1B8433F50563B93C14ACD05B79028EB1D12799027241450980651994501423A66C276AE26C43B739BC65C4E16B10C3AF6C202AEBB" , "8364346781" , 95062355 , "DFC" , "Centro" , "993346775" ,
	"rafael@hotmail.com"),
	("4","Geraldo", "Geraldo ", "A321D8B405E3EF2604959847B36D171EEBEBC4A8941DC70A4784935A4FCA5D5813DE84DFA049F06549AA61B20848C1633CE81B675286EA8FB53DB240D831C568" , "8364346771" , 95062395 , "POL" , "Garcia" , "993349775" ,
	"geraldo@hotmail.com");



INSERT INTO ocorrencias_policiais(id_emissor, id_tipo_ocorrencias_policiais, cep, rua, numero_residencia) VALUES
	("1", "1", "89030190", "Rua Jorge Wagner", "166"),
	("2", "2", "89030199", "Rua São José", "15");

INSERT INTO ocorrencias_bombeiros(id_emissor, id_tipo_ocorrencias_bombeiros, cep, rua, numero_residencia) VALUES
	("2", "1", "89010730", "Rua 7 de Setembro", "166");

INSERT INTO ocorrencias_defesa_civil(id_emissor, id_tipo_ocorrencias_defesa_civil, cep, rua, numero_residencia) VALUES
	("3", "1", "89090730", "Rua XV de Novembro", "15");

INSERT INTO ocorrencias_medicas(id_emissor, id_tipo_ocorrencias_medicas, cep, rua, numero_residencia) VALUES
	("4", "1", "89080730", "Rua São José", "12")