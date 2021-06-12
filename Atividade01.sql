/*

• Usando o banco de dados empresa.sql. Criar uma FUNCÃO que receba o ID de um produto (prod_id) e a quantidade comprada e retorner o valor do preço (prod_price) com desconto conforme as condições seguintes:
• quantidade <= 3 desconto = 0.2
• quantidade > 3 desconto = 0.5

*/

CREATE OR REPLACE FUNCTION produto_desconto(id_produto character, quantidade int) 
RETURN float IS
product_desconto float; 
BEGIN
     IF quantidade <= 3 THEN
         SELECT  (prod_price - (prod_price * 0.2))* quantidade  INTO product_desconto    from products WHERE prod_id = id_produto;
	ELSIF quantidade > 3 THEN
	    SELECT  (prod_price - (prod_price * 0.5))* quantidade INTO product_desconto   from products WHERE prod_id = id_produto;
	END IF;	 
	RETURN product_desconto;
END;

select produto_desconto('ANV01',4) from dual;






