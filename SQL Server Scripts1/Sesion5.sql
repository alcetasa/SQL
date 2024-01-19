USE Northwind
--CONSUTLAR TABLA ORDERS
SELECT * FROM Orders as o
GO

--CANTIDAD DE ORDENES DEL CLIENTE VINET

SELECT CustomerID,COUNT(OrderID) as 'NrodeOrdenes' from Orders 
WHERE CustomerID ='VINET'
GROUP BY CustomerID
GO
--SALE DISTINTO A ESTO CUANDO EXISTIARA UN VALOR OrdeID NULL
SELECT CustomerID,COUNT(*) as 'NrodeOrdenes' from Orders 
WHERE CustomerID ='VINET'
GROUP BY CustomerID
GO


SELECT COUNT(ShipRegion) as 'NrodeOrdenes' from Orders 
WHERE CustomerID ='VINET'
GO

SELECT COUNT(*) as 'NrodeOrdenes' from Orders 
WHERE CustomerID ='VINET'
GO


--CANTIDAD ORDENES POR CLIENTES
SELECT CustomerID,COUNT(*) as 'NrodeOrdenes' from Orders 
GROUP BY CustomerID
ORDER BY 'NrodeOrdenes' DESC
GO

--PESO DESPACHADO POR CLIENTES
SELECT CustomerID,SUM(Freight) AS 'pesodeOrdenes' from Orders 
GROUP BY CustomerID
ORDER BY 'pesodeOrdenes' DESC
GO

/*ESTADISTICAS POR CLIENTES RELACIONADOS AL PESO  DESPACHADO
PESO MAX ,MIN , AVG*/

SELECT CustomerID,SUM(Freight) AS 'PesodeOrdenes',MAX(Freight) AS 'PesoMaximo' ,MIN(Freight) AS 'PesoMinimo' , AVG(Freight) AS 'Promedio' FROM Orders 
GROUP BY CustomerID
ORDER BY 'pesodeOrdenes' DESC
GO

--FUNCIONES DE TEXTO
--LEN: RETORNA EL LARGO DE LA CADENA 
SELECT CustomerID,LEN(CustomerID)from Orders
SELECT ShipName,LEN (ShipName) from Orders

--FUNCION UPPER Y LOWER
SELECT ShipCountry,UPPER(ShipCountry) as 'Mayuscula',LOWER(ShipCountry) from Orders
GO

USE Northwind
GO
--FUNCION SUBSTRING
/*SUBSTRING (expression,start,length)* :retorna parte de una cadena de texto*/
SELECT ShipCountry, SUBSTRING(ShipCountry,3,3)AS 'Extracci�n'FROM Orders
GO
--FUNCION REPLACE 
/*REPLACE (String_expression,string_pattern,strin_replacement)*/
SELECT OrderID,REPLACE(OrderID,'10','22')AS 'Reemplazo' FROM Orders
GO
--FUNCIONES LRIM Y RTRIM 
--SUPRIME ESPACIOS EN BLANCOS EN UN CAMPO DE TEXTO

DECLARE @NOMBRE VARCHAR(50) -- CREAR VARIABLE LOCAL 
SET @NOMBRE='           PERU   '
SELECT LTRIM(@NOMBRE),@NOMBRE
GO


DECLARE @NOMBRE VARCHAR(50) -- CREAR VARIABLE LOCAL 
SET @NOMBRE='           PERU    '
SELECT RTRIM(@NOMBRE),@NOMBRE
GO

DECLARE @NOMBRE VARCHAR(50) -- CREAR VARIABLE LOCAL 
SET @NOMBRE='           PERU   '
SELECT RTRIM(LTRIM(@NOMBRE)),@NOMBRE
GO

SELECT  CustomerID,
CONCAT(SUBSTRING(ShipCountry,3,3),UPPER(ShipCountry)) AS 'CONCATENAR'
FROM Orders

--FUNCIONES DE FECHA Y HORA 
USE Northwind

SELECT YEAR(OrderDate) AS 'A�O'FROM Orders
GO

--CANTIDAD ORDENES POR A�O 
SELECT YEAR(OrderDate) AS 'A�O',
COUNT(*)AS 'CantOrdenes' FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate) ASC
GO

--FUNCION MONTH
--ORDENES POR MES DE 1997

SELECT MONTH(OrderDate) AS 'MES',
COUNT(*)AS 'CantidadOrdenes'FROM Orders
WHERE  YEAR(OrderDate)=1997
GROUP BY MONTH(OrderDate)
GO

--FUNCION DAY
SELECT DAY(OrderDate) FROM Orders
GO

SELECT DAY(OrderDate)'DIA',COUNT(*) AS 'CantOrdenes'FROM Orders
WHERE YEAR(OrderDate)=1997
GROUP BY DAY(OrderDate)
GO

--
SELECT DAY(OrderDate)'DIA',COUNT(*) AS 'CantOrdenes'FROM Orders
WHERE YEAR(OrderDate)=1997 AND MONTH(OrderDate)=12
GROUP BY DAY(OrderDate)
GO

--FUNCION GETDATE()
--RETORNA EL DIA DE LA FECHA DEL SISTEMA
SELECT GETDATE()
GO
--FUNCION DATEDIFF 
/*DATEDIFF(datepart,startdate,enddate)*/
--RETORNA LA DIFERENCIA DE 2 FECHAS 
SELECT OrderID,OrderDate,RequiredDate,
DATEDIFF(dd,OrderDate,RequiredDate)AS 'Plazodias',
DATEDIFF(mm,OrderDate,RequiredDate)AS 'Plazomes' ,
DATEDIFF(yy,OrderDate,RequiredDate)AS 'Plazoa�os' FROM Orders
GO

--FUNCION DATEADD
--AGREGA A UNA FECHA EL INTERVALO ESPECIFICADO
SELECT DATEADD(dd,30,GETDATE())--el dia de hoy mas 30 dias 
SELECT DATEADD(mm,30,GETDATE())--el dia de hoy mas 30 meses
SELECT DATEADD(yy,30,GETDATE())--el dia de hoy mas 30 a�os

--FUNCIONES LOGICAS
--IIF : EVALUA UNA EXPRESI�N Y RETORNA LO QUE SE LE
--ESPECIFICA EN EL CASO SEA VERDADERO O FALSO
SELECT IIF(5>3,'ES MAYOR','ES MENOR')

--FUNCION CHOOSE : RETORNA EL ELEMENTO EN LA POSICION INDICADA
--CHOOSE(index_val,val_1,val_2[,val_n]
SELECT OrderID,CustomerID,
CHOOSE(ShipVia,'Speedy Express','United Package','Federal Shipping') AS PROVEEDOR
FROM Orders

--FUNCION NULL 
--EVALUA SI UN CAMPO ES NULO PERMITIENDO REMPLAZAR UN VALOR PREDETERMINADO

SELECT ISNULL(ShipRegion,'NO DECLARADO')AS ShipRegion  FROM Orders

--CANTIDAD DE PRODUCTOS POR CATEGORIA 
SELECT * FROM Products