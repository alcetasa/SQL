USE Northwind
GO

--1.Campos necesarios para una Reporte de Compra
--2.Identificar en que tablas ubico los campos
--3.Crear consulta multitabla 


--1.Campos necesarios para una Reporte de Compra
/*
Tabla : Customers
	Nombre cliente             -CompanyName
	Direccion de entrega       -Address
Tabla : Orders  
	Codigo orden               -OrderID
	Fecha  emision de la orden -OrderDate
	Fecha de requerimiento     -RequiredDate
Tabla : [Order Details]
	Productos                   -ProductID
	Cantidades                  -Quantity
	Precios                     -UnitPrice
Tabla : Products
	Nombre de Productos         -ProductName
*/


--2.Identificar en que tablas ubico los campos

--Consultar tablas 
SELECT *  FROM Customers
SELECT *  FROM Orders
SELECT *  FROM [Order Details]
SELECT *  FROM Products
GO
--

--3.Crear consulta multitabla 
--Observar las llaves en comun 
--Customers- Orders              CustomerID
--Orders-[Order Details]         OrderID
--[Order Details]	-Products    ProductID


/*
Tabla : Customers
	Nombre cliente             -CompanyName
	Direccion de entrega       -Address
Tabla : Orders  
	Codigo orden               -OrderID
	Fecha  emision de la orden -OrderDate
	Fecha de requerimiento     -RequiredDate
Tabla : [Order Details]
	Productos                   -ProductID
	Cantidades                  -Quantity
	Precios                     -UnitPrice
Tabla : Products
	Nombre de Productos         -ProductName
*/


SELECT Customers.CompanyName,Customers.Address,
		Orders.OrderID,OrderDate,Orders.RequiredDate,
		[Order Details].ProductID,[Order Details].Quantity,[Order Details].UnitPrice,
		Products.ProductName
		FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID=[Order Details].OrderID
INNER JOIN Products
ON [Order Details].ProductID=Products.ProductID
GO

--Forma reducida

SELECT C.CompanyName,C.Address,
		O.OrderID,OrderDate,O.RequiredDate,
		OD.ProductID,OD.Quantity,OD.UnitPrice,
		PD.ProductName
		FROM Orders as O
INNER JOIN Customers as C
ON O.CustomerID=C.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID=OD.OrderID
INNER JOIN Products AS PD
ON OD.ProductID=PD.ProductID
GO

--+MONTO

SELECT C.CompanyName,C.Address,
		O.OrderID,OrderDate,O.RequiredDate,
		OD.ProductID,OD.Quantity,OD.UnitPrice,(OD.Quantity*OD.UnitPrice) AS Monto,
		PD.ProductName
		FROM Orders as O
INNER JOIN Customers as C
ON O.CustomerID=C.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID=OD.OrderID
INNER JOIN Products AS PD
ON OD.ProductID=PD.ProductID
GO


--CREACION DE VISTA 
CREATE VIEW OrdenCompra
AS
	SELECT C.CompanyName,C.Address,
			O.OrderID,OrderDate,O.RequiredDate,
			OD.ProductID,OD.Quantity,OD.UnitPrice,(OD.Quantity*OD.UnitPrice) AS Monto,
			PD.ProductName
			FROM Orders as O
	INNER JOIN Customers as C
	ON O.CustomerID=C.CustomerID
	INNER JOIN [Order Details] AS OD
	ON O.OrderID=OD.OrderID
	INNER JOIN Products AS PD
	ON OD.ProductID=PD.ProductID
GO
--LLAMANDO LA VISTA
SELECT * from OrdenCompra

--MODIFICAR VISTA

ALTER VIEW OrdenCompra
AS
	SELECT C.CompanyName AS Cliente ,C.Address AS Direcci�n,
			O.OrderID,OrderDate,O.RequiredDate,
			OD.ProductID,OD.Quantity,OD.UnitPrice,(OD.Quantity*OD.UnitPrice) AS Monto,
			PD.ProductName
			FROM Orders as O
	INNER JOIN Customers as C
	ON O.CustomerID=C.CustomerID
	INNER JOIN [Order Details] AS OD
	ON O.OrderID=OD.OrderID
	INNER JOIN Products AS PD
	ON OD.ProductID=PD.ProductID
GO

SELECT * from OrdenCompra
GO

--ELIMINAR VISTA
DROP VIEW OrdenCompra
GO



/*Venta por empleado
Tabla :Employees
	nombre de empleado   FirstName LastName
Tabla :[Order Details] 
	monto=cantidad* precio unitario
--son 2 tablas no relacionadas
--Por lo tanto necesita relacionarce con otra tabla 
Tabla : Order

*/

/*Ventas del empleado*/
SELECT E.FirstName,E.LastName,OD.ProductID,OD.Quantity,OD.UnitPrice,(OD.Quantity*OD.UnitPrice) AS Monto From Employees AS E
INNER JOIN  Orders AS O
ON e.EmployeeID=O.EmployeeID
INNER JOIN  [Order Details] AS OD
ON OD.OrderID=O.OrderID
GO

/*Total de ventas por empleado*/

SELECT E.FirstName,E.LastName,SUM(OD.Quantity*OD.UnitPrice) AS Monto From Employees AS E
INNER JOIN  Orders AS O
ON e.EmployeeID=O.EmployeeID
INNER JOIN  [Order Details] AS OD
ON OD.OrderID=O.OrderID
GROUP BY  E.EmployeeID,E.FirstName,E.LastName
ORDER BY E.EmployeeID
GO

SELECT E.FirstName,E.LastName,SUM(OD.Quantity*OD.UnitPrice) AS Monto From Employees AS E
INNER JOIN  Orders AS O
ON e.EmployeeID=O.EmployeeID
INNER JOIN  [Order Details] AS OD
ON OD.OrderID=O.OrderID
GROUP BY  E.FirstName,E.LastName
ORDER BY Monto DESC
GO


Select* FROM Employees
GO
	
/*Cantidad de ordenes por empleado*/ 

--CustomerID , FirstName,LastName, Count(Order 

--Observar las llaves en comun 
--Customers- Orders              CustomerID
--Orders-[Order Details]         OrderID
--[Order Details]	-Products    ProductID



/*1 Ordenes  por empleado
Tabla :Employees
	nombre de empleado   FirstName LastName
Tabla :[Order Details] 
	  cantidad


--son 2 tablas no relacionadas
--Por lo tanto necesita relacionarce con otra tabla 
Tabla : Order
	a*/

--Consultar tablas 
SELECT *  FROM Employees
SELECT *  FROM Orders
SELECT *  FROM [Order Details]
GO

SELECT E.FirstName,E.LastName,COUNT(DISTINCT(OD.OrderID)) AS Cantidad,SUM(OD.Quantity*OD.UnitPrice) AS Monto FROM Employees AS E
INNER JOIN  Orders AS O
ON e.EmployeeID=O.EmployeeID
INNER JOIN [Order Details] AS OD
ON OD.OrderID=O.OrderID
GROUP BY  E.FirstName,E.LastName
ORDER BY Cantidad DESC
GO

SELECT E.FirstName,E.LastName,COUNT(OD.OrderID) AS Cantidad,SUM(OD.Quantity*OD.UnitPrice) AS Monto FROM Employees AS E
INNER JOIN  Orders AS O
ON e.EmployeeID=O.EmployeeID
INNER JOIN [Order Details] AS OD
ON OD.OrderID=O.OrderID
GROUP BY  E.FirstName,E.LastName
ORDER BY Cantidad DESC
GO

/*VENTAS POR CATEGORIAS*/
Select * FROM Products
SELECT *  FROM Categories
Select* FROM [Order Details]
GO
--ProductID,ProductName,Monto
SELECT C.CategoryID,C.CategoryName,SUM(OD.Quantity*OD.UnitPrice) AS Monto  FROM Categories AS C
INNER JOIN Products AS P
ON C.CategoryID=P.CategoryID
INNER JOIN [Order Details] AS OD
ON P.ProductID=OD.ProductID
GROUP BY  C.CategoryID,C.CategoryName
ORDER BY Monto DESC
GO