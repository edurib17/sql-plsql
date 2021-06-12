CREATE OR REPLACE PROCEDURE atualizarProduto(preco_produto float,id_produto character) 
IS
BEGIN 
UPDATE products SET prod_price = preco_produto WHERE prod_id = id_produto;   
    DBMS_OUTPUT.PUT_LINE('A produto foi atualizado com sucesso!'); 
END; 


EXECUTE atualizarProduto(10.22,'ANV01') 