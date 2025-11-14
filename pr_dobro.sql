CREATE PROCEDURE `num_dobro` (inout numero int)
BEGIN
	set numero = (select (valtunit * 2) from produto where codProduto = numero);
END
