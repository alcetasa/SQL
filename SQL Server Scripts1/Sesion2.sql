--DDL LENGUAJE DE DEFINICION DE DATOS
--CREATE,ALTER,DROP 
/*comentar varias lineas  */
/* DML LENGUAJE DE MANIPULACION 
SELECT,DELETE,INSERT,UPDATE*/

--DELETE puedes poner condiciones con WHERE
--TRUNCATE elimina los registros de la tabla


SELECT * FROM Customers
GO
--CREAR BASE DE DATOS (DESDE EL MASTER LUEGO ACTUALIZAR)
CREATE DATABASE Prueba
GO
--ELIMINAR BASE DE DATOS 
DROP DATABASE Prueba
GO

--USAR BASE DE DATOS--> PRUEBA
USE PRUEBA
GO
--CREAR UNA TABLA

CREATE TABLE alumnos(
idalumno int,
nombre varchar(50),
apellidos varchar(70)
)
GO

--CREAR UNA TABLA 2
CREATE TABLE alumnos (
idalumno int identity(1,1),-- comienze en 1 e incrementarse en 1 (1,1)
nombre varchar(50) NOT NULL,
apellidos varchar(70) NOT NULL
)
GO


--CONSULTA LA TABLA alumnmos
SELECT* FROM alumnos
GO
--ELIMINAR TABLA alumnos
DROP TABLE alumnos
GO

--INSERTAR UN REGISTRO EN LA TABLA alumnos
INSERT INTO alumnos(idalumno,nombre,apellidos)values(1,'Alejandra','Choque')
INSERT INTO alumnos(idalumno,nombre,apellidos)values(2,'Alexis','Olivares')
INSERT INTO alumnos(idalumno,nombre,apellidos)values(3,'Estefanie','Churqui')
INSERT INTO alumnos(idalumno,nombre,apellidos)values(4,'Alvaro','Tauma')
INSERT INTO alumnos(idalumno,nombre,apellidos)values(5,'Eduardo','Felipe')
INSERT INTO alumnos(idalumno,nombre,apellidos)values(8,'Jouli','Rojas')
INSERT INTO alumnos(idalumno,nombre,apellidos)values(9,'Juan','Alva')
GO

--ELIMINAR LOS REGISTROS DE UNA TABLA
TRUNCATE TABLE alumnos 
GO

--INSERTAR VARIOS REGISTROS DE UNA TABLA
INSERT INTO alumnos(idalumno,nombre,apellidos)values  
(1,'Alejandra','Choque'),
(2,'Alexis','Olivares'),
(3,'Estefanie','Churqui'),
(6,'Estefanie','Churqui'),
(4,'Alvaro','Tauma'),
(5,'Eduardo','Felipe'),
(8,'Jouli','Rojas'),
(9,'Juan','Alva')
GO

--ELIMINAR UN REGISTRO
DELETE FROM alumnos
WHERE idalumno=6
go

--AGREGAR UNA NUEVA COLUMNA (celular)A LA TABLA
ALTER TABLE alumnos
add celular char(11)
GO

----AGREGA MAS COLUMNAS (dni,FechaNac)A LA TABLA
ALTER TABLE ALUMNOS
ADD dni CHAR(8),
	FechNac date
GO

--ELIMINAR UNA COLUMNA(FechNac)
ALTER TABLE alumnos
DROP  COLUMN FechNac
GO

--ELIMINAR MAS DE UNA COLUMNA (dni,celular)	
ALTER TABLE alumnos
DROP COLUMN dni,celular		
GO

--MODIFICAR EL TIPO DE DATO DE UNA COLUMNA ####
ALTER TABLE alumnos
ALTER COLUMN nombre varchar	(60)
GO

--CONSULTA LA TABLA (alumnmos)
SELECT* FROM alumnos
GO

--SE CREO LA TABLA empleados de forma manual
CREATE TABLE Empleados (
idempleado int identity(1,1),-- comienze en 1 e incrementarse en 1 (1,1)
nombre varchar(50) ,
apellidos varchar(70),
dni nchar(8),
FecNac date
)
GO

--EDITAR CLICK DERECHO SOBRE LA TABLA Y DESING
ALTER TABLE Empleados
ALTER COLUMN idempleado int identity(1,1)
GO
--CONSULTA LA TABLA (empleados)
SELECT* FROM Empleados
GO

---INSERTAR VARIOS REGISTROS A UNA TABLA (empleados)

INSERT INTO Empleados(nombre,apellidos)values  
('Alejandra','Choque'),
('Alexis','Olivares'),
('Estefanie','Churqui'),
('Estefanie','Churqui'),
('Alvaro','Tauma'),
('Eduardo','Felipe'),
('Jouli','Rojas'),
('Juan','Alva')
GO

--ELIMINAR TABLA Empleados
DROP TABLE Empleados
GO
--ELIMINAR LOS REGISTROS DE UNA TABLA
TRUNCATE TABLE Empleados 
GO

--INSERTAR DATOS DE UN ARCHIVO PLANO TXT

BULK INSERT Empleados 
	FROM 'D:\CAPACITACIONES\2023\SQL\MS SQL SERVER\LECTURA TXT.txt'
	WITH (firstrow=2, --los datos comienzan en la fila 2 
		fieldterminator='\t',--delimitador de columnas tabulacion
		rowterminator='\n'-- delimitador de filas salto de línea)
GO

--CONSULTA LA TABLA (empleados)
SELECT* FROM Empleados
GO