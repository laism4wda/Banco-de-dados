CREATE PROCEDURE `count_prazo` (in data_ date, inout dias int)
BEGIN
	set dias = (select count(numpedido) from pedido where prazoentrega > data_);
END
