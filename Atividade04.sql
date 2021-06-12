/*
Criar um PROCEDIMENTO para atualizar o preço dos produtos (products). O id e o preço chegarão por parâmetro. Em uma tabela audit_produtos registrar o id do produto, o usuário, quando a operação foi executada e qual a operação foi (armazenar a informação de deleção, 
update e insert). Criar a tabela audit_produtos no script. Usar uma TRIGGER para essa operação de registro de log.

*/

CREATE OR REPLACE PROCEDURE atualizarProduto(preco_produto float,id_produto character) 
IS
BEGIN 
UPDATE products SET prod_price = preco_produto WHERE prod_id = id_produto;   
    DBMS_OUTPUT.PUT_LINE('A produto foi atualizado com sucesso!'); 
END; 


EXECUTE atualizarProduto(10.22,'ANV01') 
