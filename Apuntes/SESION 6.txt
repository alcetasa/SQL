USE Northwind
--Cantidad de ordenes  emitidas  por  cliente en 1997

SELECT CustomerID,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1997
GROUP BY CustomerID
ORDER BY 'NrodeOrdenes' DESC
Go

-- cliente que han  emitido mas de 7 ordenes  en 1997 
SELECT CustomerID,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1997
GROUP BY CustomerID
HAVING COUNT(OrderID)>7 --el HAVING lo vamos a usar para campos agregados o cuando se usa FUNCIONES DE AGREGACION SUM,MAX,COUNT... SIEMPRE VA DESPUES DE GROUP BY
ORDER BY 'NrodeOrdenes' DESC
Go

-- cliente que han  emitido entre 4 y 7 ordenes  en 1997 

SELECT CustomerID,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1997
GROUP BY CustomerID
HAVING COUNT(OrderID) BETWEEN 4 AND 7 
ORDER BY 'NrodeOrdenes' DESC
Go
-- cliente que han  emitido  4 y 7 ordenes  en 1997 
SELECT CustomerID,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1997
GROUP BY CustomerID
HAVING COUNT(OrderID) IN (4,7)
ORDER BY 'NrodeOrdenes' DESC
Go

--Cantidad de ordenes por pais en 1998

SELECT ShipCountry,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1998
GROUP BY ShipCountry
ORDER BY 'NrodeOrdenes' DESC
Go
--Cantidad de ordenes por pais en 1998 filtrar por cantidad de ordenes mayores a 20

SELECT ShipCountry,ShipCity,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1998
GROUP BY ShipCountry,ShipCity
HAVING COUNT(OrderID)> 20
ORDER BY 'NrodeOrdenes' DESC
Go
--Cantidad	de ordenes por pais y ciudad en 1998
SELECT ShipCountry,ShipCity,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
WHERE YEAR(OrderDate)=1998
GROUP BY ShipCountry,ShipCity
ORDER BY ShipCountry,ShipCity,COUNT(OrderID) DESC
Go

--Cantidad	de ordenes por pais y ciudad filtrar por cantidad de ordenes mayores a 20
SELECT ShipCountry,ShipCity,COUNT(OrderID)as 'NrodeOrdenes'  FROM Orders
GROUP BY ShipCountry,ShipCity
HAVING COUNT(OrderID)>20
ORDER BY ShipCountry,ShipCity,COUNT(OrderID) DESC
Go


SELECT * FROM Orders
GO

--MONTO POR ORDEN
SELECT OrderID,SUM(UnitPrice*Quantity)AS 'Monto' FROM[Order Details]
GROUP BY OrderID
GO
SELECT OrderID,SUM(UnitPrice*Quantity)AS 'Monto' FROM[Order Details]
GROUP BY OrderID
ORDER BY 'Monto' DESC
GO

--MONTO POR CLIENTE VINET
SELECT *  FROM Orders
WHERE CustomerID='VINET'
GO

--CODIGOS DE ORDENES DE VINET
SELECT OrderID  FROM Orders
WHERE CustomerID='VINET'
GO

--MONTO SEGUN CODIGOS DE ORDENES DE VINET
SELECT SUM(UnitPrice*Quantity)AS 'Monto Total' FROM[Order Details]
WHERE OrderID IN (10248,10274,10295,10737,10739)
GO

SELECT SUM(UnitPrice*Quantity)AS 'Monto Total' FROM[Order Details]
WHERE OrderID IN (SELECT OrderID  FROM Orders
WHERE CustomerID='VINET')
GO

--

-- Utilizando variables
DECLARE @customerid char(5)
SET @customerid ='HANAR'
SELECT SUM(UnitPrice*Quantity)AS 'Monto Total' FROM[Order Details]
WHERE OrderID IN (SELECT OrderID  FROM Orders
WHERE CustomerID=@customerid)
GO
--

--Monto de vendido a Brazil en 1997
--Consultar tablas 
SELECT* FROM[Order Details]
GO
SELECT* FROM Orders
GO
--Consulta anidada
SELECT OrderID FROM Orders
WHERE ShipCountry='Brazil' and YEAR(OrderDate)=1997
GO
--Consulta princpal + cosunta anida
SELECT SUM(UnitPrice*Quantity)AS 'Monto Total' FROM[Order Details]
WHERE OrderID IN (SELECT OrderID FROM Orders
WHERE ShipCountry='Brazil' and YEAR(OrderDate)=1997)
GO

--Monto por producto
--Consultar tablas 
SELECT* FROM[Order Details]
GO
SELECT* FROM Orders
GO

SELECT ProductID,SUM(UnitPrice*Quantity)AS 'MONTO' FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID
GO

--JOINS 

--Consultar tablas 
SELECT* FROM Customers
GO
SELECT* FROM Orders
GO
--Cantidad de Ordenes por Cliente
SELECT CustomerID,COUNT(OrderID) as ORDENES FROM  Orders
GROUP BY CustomerID
GO

--Nombre del Cliente y su cantidad de Ordenes 
--Consultar tablas 
SELECT* FROM Customers
GO
SELECT* FROM Orders
GO

--Trae la columnas de ambas tablas por el *
SELECT * FROM  Orders  
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GO


--Nombre del Cliente y su cantidad de Ordenes 
SELECT Customers.CompanyName ,COUNT(OrderID) AS 'Nro_de_Ordenes' FROM  Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CompanyName
Order BY 'Nro_de_Ordenes' DESC
GO


--Nombre del Clientes  de  Brazil y su cantidad de Ordenes siendo estas  mayores a 7 
SELECT Customers.CompanyName ,COUNT(OrderID) AS 'Nro_de_Ordenes' FROM  Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
WHERE Orders.ShipCountry='BRAZIL'
GROUP BY Customers.CompanyName
HAVING COUNT(OrderID)>7
Order BY 'Nro_de_Ordenes' DESC
GO


select * from[dbo].[Order Subtotals]
Go


----

select * from[dbo].[Summary of Sales by Year]
GO
--Consultar tablas 
SELECT* FROM [Order Details]
GO
SELECT* FROM Orders 
GO


SELECT Orders.ShippedDate,[Order Details].OrderID,SUM([Order Details].UnitPrice*[Order Details].Quantity) AS MONTO from [Order Details]
INNER JOIN Orders
ON Orders.OrderID=[Order Details].OrderID
GROUP BY Orders.ShippedDate,[Order Details].OrderID
GO