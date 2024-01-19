USE Northwind


CREATE PROCEDURE USP_OrdenesxCliente
@customer nchar(5)
AS
	SELECT * FROM Orders
	WHERE CustomerID=@customer
	GO
-- 
SELECT * FROM Orders

EXECUTE sp_helptext 'USP_OrdenesxCliente'


--INVOCAR EL SP
EXECUTE USP_OrdenesxCliente TOMSP


SELECT @@SERVERNAME