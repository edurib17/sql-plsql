/*
Criar um PROCEDIMENTO para atualizar o preço dos produtos (products). O id e o preço chegarão por parâmetro. Em uma tabela audit_produtos registrar o id do produto, o usuário, quando a operação foi executada e qual a operação foi (armazenar a informação de deleção, 
update e insert). Criar a tabela audit_produtos no script. Usar uma TRIGGER para essa operação de registro de log.

Tabela para sql server
CREATE TABLE  audit_produtos(
id_produto NCHAR(10) NOT NULL,
usuario VARCHAR2(100) NOT NULL,
data TIMESTAMP NOT NULL,
operacao NCHAR(1) NOT NULL
);

*/



CREATE OR REPLACE TRIGGER  audit_produtos
AFTER INSERT OR UPDATE OR DELETE ON products
FOR EACH ROW 
BEGIN
	IF deleting THEN
		INSERT INTO audit_produtos VALUES (:OLD.prod_id,  user ,CURRENT_TIMESTAMP,'D' );
ELSIF updating THEN
		INSERT INTO  audit_produtos VALUES (:NEW.prod_id, user ,CURRENT_TIMESTAMP, 'U');
ELSIF inserting THEN
		INSERT INTO  audit_produtos VALUES (:NEW.prod_id, user ,CURRENT_TIMESTAMP, 'I');
	END IF;
END; 

INSERT INTO products(prod_id, vend_id, prod_name, prod_price, prod_desc) VALUES('AN',1001, 'FIFA 21', 300.99, 'Igual ao fifa 20');
UPDATE products SET prod_name = 'FIFA 20' WHERE prod_id = 'AN'
DELETE FROM products WHERE prod_id = 'AN';
SELECT * FROM audit_produtos
