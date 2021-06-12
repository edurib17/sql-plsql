CREATE  OR REPLACE FUNCTION contar_produtos_vendidos(id_vendedor int)
RETURN int IS
produtos_vendidos int; 
BEGIN 
     SELECT count(vend_id) INTO produtos_vendidos FROM products  WHERE vend_id = id_vendedor;
	 RETURN produtos_vendidos;
END;

select contar_produtos_vendidos('1002')  from dual
  