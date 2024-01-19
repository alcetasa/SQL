USE Northwind
SELECT * FROM Orders
GO
--CUANTOS EMPLEADOS HAN EMITIDO ORDENES
SELECT DISTINCT(EmployeeID) FROM Orders

--CUANTOS CLIENTES HAN EMITIDO ORDENES
SELECT DISTINCT(CustomerID) FROM Orders
GO

--CUANTOS CLIENTES HAY
SELECT * FROM Customers
GO

---ORDENES DE MAYOR PESO 
SELECT OrderID,Freight FROM Orders
ORDER BY Freight DESC 
GO
--
---ORDEN DE MAYOR PESO 
SELECT TOP 1 OrderID,Freight FROM Orders
ORDER BY Freight DESC 
GO

--OREDEN DE MENOR PESO

SELECT OrderID,Freight FROM Orders
ORDER BY Freight ASC 
GO
SELECT TOP 1 OrderID,Freight FROM Orders
ORDER BY Freight ASC 
GO

--ORDENAR SHIPCOUNTY ASC Y SHIPCITY DESC
SELECT OrderID,ShipCountry,ShipCity FROM Orders
ORDER BY ShipCountry ASC, ShipCity DESC
GO

-- MENOR PESOS POR PAIS
SELECT ShipCountry,MIN(Freight)AS 'Peso Minimo' FROM Orders
GROUP BY ShipCountry-- se agrupa cuando tiene otra columna con una funcion de agregacion
ORDER BY ShipCountry ,'Peso Minimo'desc
GO

-- MAXIMOS PESOS POR PAIS
SELECT ShipCountry,MAX(Freight)AS 'Peso Maximo' FROM Orders
GROUP BY ShipCountry-- se agrupa cuando tiene otra columna con una funcion de agregacion
ORDER BY 'Peso Maximo'desc
GO

SELECT TOP (5) ShipCountry,MAX(Freight)AS 'Peso Maximo' FROM Orders
GROUP BY ShipCountry-- se agrupa cuando tiene otra columna con una funcion de agregacion
ORDER BY 'Peso Maximo'desc
GO

-- LOS CLIENTES CON MAS ORDENES EN  EL AÑO 1997

SELECT CustomerID,COUNT(CustomerID) AS 'Ordenes' FROM Orders
WHERE year(OrderDate)=1997
GROUP BY CustomerID
ORDER BY 'Ordenes' DESC
GO

--LOS CLIENTES A LOS QUE LES VENDÍ LA MAYOR CANTIDAD EN PESO DURANTE EL AÑO 1997
SELECT CustomerID,SUM(Freight) AS 'Pesototal' FROM Orders
WHERE year(OrderDate)=1997
GROUP BY CustomerID 
ORDER BY 'Pesototal' DESC
GO

SELECT ShipCountry,MIN(Freight)AS 'PesoMinimo',MAX(Freight)AS 'PesoMaximo' FROM Orders 
GROUP BY ShipCountry
ORDER BY 'PesoMaximo' DESC
GO

--MOSTRAR LAS ORDENES QUE TIENEN  UN PESO MAYOR A 300
SELECT o.OrderID,o.CustomerID,o.Freight  FROM Orders as o
WHERE o.Freight>=300
ORDER BY o.Freight desc
GO

--MOSTRAR LAS ORDENES QUE TIENEN  UN PESO MAYORES DE 300 Y MENOR 500
SELECT o.OrderID,o.CustomerID,o.Freight  FROM Orders as o
WHERE  o.Freight>=300 AND  o.Freight<500
ORDER BY o.Freight desc
GO


--MOSTRAR LAS ORDENES QUE TIENEN  UN PESO MAYORES DE IGUAL 300 Y MENOR IGUAL A500
SELECT o.OrderID,o.CustomerID,o.Freight  FROM Orders as o
WHERE  o.Freight>=300 AND  o.Freight<=500
ORDER BY o.Freight desc
GO


SELECT o.OrderID,o.CustomerID,o.Freight  FROM Orders as o
WHERE  o.Freight BETWEEN 300 AND 500
ORDER BY o.Freight desc
GO

--LO CONTRARIO DE LAS ORDENES QUE TIENEN  UN PESO MAYORES DE IGUAL 300 Y MENOR IGUAL A500
SELECT o.OrderID,o.CustomerID,o.Freight  FROM Orders as o
WHERE NOT( o.Freight>=300 AND  o.Freight<=500)
ORDER BY o.Freight desc
GO

SELECT o.OrderID,o.CustomerID,o.Freight  FROM Orders as o
WHERE  o.Freight NOT BETWEEN 300 AND 500
ORDER BY o.Freight desc
GO

--ORDENES EMITIDAS EN ENERO 97
SELECT o.OrderID,o.CustomerID,o.Freight,
MONTH (o.OrderDate) as 'MesOrden',
YEAR(o.OrderDate) as 'AñoOrden' FROM Orders as o
WHERE YEAR(o.OrderDate)=1997 AND MONTH(o.OrderDate)=1
GO

--CANITIDAD DE ORDENES EMITIDAS EN ENERO 97
SELECT COUNT(o.OrderID) FROM Orders as o
WHERE YEAR(o.OrderDate)=1997
GO
--OPERADOR DE COINCIDENCIA "LIKE" 

--PAISES QUE COMIENZEN B
SELECT ShipCountry FROM Orders
WHERE ShipCountry LIKE 'b%'
GO

--PAISES QUE COMIENZEN B
SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry LIKE 'b%'
GO

--LO MISMO
SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry NOT LIKE '[a,b]%'
GO
SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry LIKE '[^a,b]%'
GO

SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry LIKE '[a,b]e%'
GO

SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry LIKE '[a,b]r%'
GO

SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry LIKE '[a-f]_a%'
GO

--[] CUALQUIER CARÁCTER INDIVIDUAL DEL INVERVALO
SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry LIKE '[a,e]%'
GO

--OPERADOR LISTA DE VALORES IN
SELECT DISTINCT(ShipCountry) FROM Orders
WHERE ShipCountry IN('brazil','spain')
GO
SELECT ShipCountry,AVG(Freight)FROM Orders
GROUP BY ShipCountry

--AQUE CLIENTES NO INGRESE EL SHIREGION (IS NULL)

SELECT O.CustomerID,O.ShipRegion from Orders AS O
WHERE ShipRegion IS NULL
GO
  
SELECT COUNT(*) from Orders AS O
WHERE ShipRegion IS NULL
GO

