CREATE DATABASE sistema;
USE sistema;

CREATE TABLE IF NOT EXISTS conta(
id_conta INT(11) NOT NULL,
nome VARCHAR(50) NOT NULL,
login VARCHAR(50) NOT NULL,
senha VARCHAR(50) NOT NULL,
status BIT DEFAULT (1)
);

ALTER TABLE conta
CHANGE COLUMN id_conta id_conta INT(11) NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (id_conta);

DELIMITER $$
CREATE PROCEDURE PROC_CAD_CONTA
	(
		IN pro_nome VARCHAR(50),
        IN pro_login VARCHAR(50),
        IN pro_senha VARCHAR(50),
        IN pro_status BIT,
        OUT id INT
	)
BEGIN
	INSERT INTO conta (nome,login,senha,status) VALUES (pro_nome,pro_login,pro_senha,pro_status);
    SELECT LAST_INSERT_ID() INTO id;
END$$


CALL PROC_CAD_CONTA ('Bruno', 'bruno', '123456', 1, @id);
CALL PROC_CAD_CONTA ('Rafael', 'rafael', '654321', 1, @id);
CALL PROC_CAD_CONTA ('Kacios', 'kacios', '999000', 1, @id);

SELECT * FROM conta;