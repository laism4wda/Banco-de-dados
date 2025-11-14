CREATE DEFINER=`root`@`localhost` PROCEDURE `media`(out media int)
BEGIN
	select avg(prazoEntrega) into media from pedido;
END