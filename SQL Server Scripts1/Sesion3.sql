--ALTER AUTHORIZATION ON DATABASE ::Northwind TO sa; --Cambiar de propietario 
USE Prueba
GO
--
SELECT * FROM  Empleados
GO
--
--AGREGAR 1 COLUMNA (cargo)
ALTER TABLE Empleados
ADD cargo VARCHAR(20)
GO
--CREAR LA TABLA (CARGOS)
CREATE TABLE cargos(
idcargo INT NOT NULL,
nombre VARCHAR (20))
GO

--MODIFICA TABLA (CARGOS) idcargo que sea identity
/*
ALTER TABLE cargos
ALTER COLUMN idcargo INT IDENTITY(1,1) NOT NULL 
GO*/
--Se modifico por interfaz grafica no se puede por codigo
SELECT * FROM  cargos
SELECT * FROM  Empleados
GO
--ASIGNAR LLAVE PRIMARIA A LA COLUMNA (idcargo)
/*ALTER TABLE 'nombre de la tabla'
ADD CONSTRAINT 'nombre de la restriccion' PRIMARY KEY('nombre de la llave primaria')
GO*/

ALTER TABLE cargos
ADD CONSTRAINT pk_idcargo PRIMARY KEY(idcargo)
GO

ALTER TABLE Empleados
ADD CONSTRAINT pk_idempleado PRIMARY KEY(idempleado)
GO
--ASIGNAR UNA LLAVE FORANEA A LA 

/*ALTER TABLE 'nombre de la tabla'
ADD FOREIGN KEY('nombre de la llave foranea en la tabla) REFERENCES 'nombre de la tabla de PK'('nombre de PK')
*/

ALTER TABLE Empleados
ADD FOREIGN KEY(cargo) REFERENCES cargos(idcargo)
GO
--HUBO UN ERROR LAS LLAVES PRIMARIAS Y FORANEAS TIENEN QUE SER DEL MISMO TIPO DE DATOS
---MODIFICAR EL TIPO DE DATOS CARGO DE EMPLEADOS
ALTER TABLE Empleados
ALTER COLUMN cargo INT NULL
GO


--INSERTAR  4 CARGOS  GERENTE,JEFE,OPERARIO, PEON
INSERT INTO cargos(nombre) values 
('Gerente'),
('Jefe'),
('Operario'),
('Peon')
GO
------------------------------------------------------------
--ACTUALIZAR REGISTROS CON (UPDATE)
-----------------------------------------------
UPDATE Empleados
SET cargo=1
WHERE idempleado=1
GO
--
UPDATE Empleados
SET cargo=2
WHERE idempleado=2
GO
--
UPDATE Empleados
SET cargo=3
WHERE idempleado in (3,4)	
GO
----------------------------------------------------------------------
/*CREAR TABLA PROYECTOS : idproyecto,nombre,id proyecto debe ser identity
y llave primaria*/

/*AGREGAR COLUMNA  idproyecto a la empleados asignar llave foranea*/
----------------------------------------------------------------------
CREATE TABLE proyectos(
idproyecto INT identity (1,1),
nombre varchar(30)
CONSTRAINT pk_proyecto PRIMARY KEY(idproyecto)
)
GO
--INSERTAR REGISTROS A PROYECTOS 
INSERT proyectos(nombre) values
('PY1'),
('PY2'),
('PY3'),
('PY4'),
('PY5')
GO

/*ALTER TABLE 'nombre de la tabla'
ADD FOREIGN KEY('nombre de la llave foranea en la tabla) REFERENCES 'nombre de la tabla de PK'('nombre de PK')
*/

-- RELACIONAR PROYECTOS CON EMPLEADOS / ASIGNAR LLAVE FORANEA A LA TABLA EMPLADOS
ALTER TABLE Empleados
ADD FOREIGN KEY(idproyecto) REFERENCES proyectos(idproyecto)
GO

--CONSULTAR TABLAS
SELECT * FROM  cargos
SELECT * FROM  Empleados
SELECT * FROM  proyectos
GO
----------------------------------------------------------------------------------------------------------
--
USE Northwind
GO
--

SELECT * FROM Employees
GO

--SE CREA UNA COPIA DE UNA TABLA (Copia de Employees= empleados)
SELECT * INTO empleados
FROM Employees
GO

SELECT * FROM empleados
GO

--ACTUALIZAR --CAMBIAR CITY (London) POR (Lima)
UPDATE empleados
SET City='Lima'
WHERE City='London'
GO

--ELIMINAR EMPLEADOS DE SEATLE
DELETE FROM empleados
WHERE CITY='Seattle'
GO

--ACTUALIZAR --CAMBIAR CITY (London) POR (Lima)
UPDATE empleados
SET Region='Peru'
WHERE Region is NULL
GO