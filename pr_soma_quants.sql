CREATE PROCEDURE `soma_quants` (out soma int)
BEGIN
	 select sum(ip.quantidade*p.valunit)
     into soma from produto as p
     inner join itempedido as ip
     on p.codproduto = ip.prduto_codproduto;
END
