USE Northwind
/*CREAR UNA TABLA ALUMNOS CON 4 CAMPOS,ID,AUTOGENERE,NOMBRE,APELLIDO,CELULAR*/
--
DROP TABLE alumnos
--
CREATE TABLE alumnos(
idalumno int identity(1,1),
nombre varchar(50),
apellido varchar(70),
celular char(9))
GO

INSERT INTO alumnos VALUES('Alejandra','Cori','999999999')
SELECT * FROM alumnos
--ELIMINAR LOS REGISTROS DE UNA TABLA
TRUNCATE TABLE alumnos 
GO

--ACTUALIZAR UN REGISTRO
UPDATE alumnos
SET nombre='Joule',
	apellido='Rojas',
	celular='222222'
WHERE idalumno=1

SELECT * FROM alumnos

DECLARE @nombre varchar(50)
SET @nombre='Ruben'


--CREAR UN  PRCEDIMIENTO ALMACENADO PARA ACTUALIZAR

CREATE OR ALTER PROCEDURE P7 
@idalumno  int,
@nombre varchar(50),
@apellido varchar(70),
@celular char(9)
AS	
	UPDATE alumnos
		SET nombre=@nombre,
		apellido=@apellido,
		celular=@celular
	WHERE idalumno=@idalumno
GO

SELECT *FROM alumnos
EXECUTE P7	1, 'Alvaro','Tauma','933911302'
SELECT *FROM alumnos

--TABLA COPIA 
SELECT OrderId,CustomerID,EmployeeID,OrderDate,ShipVia,Freight into ordenes2 from Orders
GO

CREATE OR ALTER PROCEDURE P7 
@idalumno  int,
@nombre varchar(50),
@apellido varchar(70),
@celular char(9)
AS	
	UPDATE alumnos
		SET nombre=@nombre,
		apellido=@apellido,
		celular=@celular
	WHERE idalumno=@idalumno
GO



SELECT * FROM ordenes2
GO


--PROCEDIMIENTOS ANIDADOS ---------------------------------------------------

USE CS
SELECT * FROM T_Hechos
GO

--CREAR PROCEDIMIENTO ALMACENADO SECUNDARIOS
CREATE OR ALTER PROCEDURE SPCondicion
@valor varchar(9)
AS
	SELECT * FROM T_Hechos
	WHERE Condicion_Encuestado=@valor 
	GO


CREATE OR ALTER PROCEDURE SPSexo
@valor varchar(9)
AS
	SELECT * FROM T_Hechos
	WHERE Sexo=@valor 
	GO
--

CREATE OR ALTER PROCEDURE SPNivelEstudio
@valor varchar(9)
AS
	SELECT * FROM T_Hechos
	WHERE Nivel_Estudio=@valor 
	GO
--

CREATE OR ALTER PROCEDURE SPTipoSeguro
@valor varchar(9)
AS
	SELECT * FROM T_Hechos
	WHERE Tipo_Seguro=@valor 
	GO

--

CREATE OR ALTER PROCEDURE SPTipoPaciente
@valor varchar(9)
AS
	SELECT * FROM T_Hechos
	WHERE Tipo_Paciente=@valor 
	GO

--

CREATE OR ALTER PROCEDURE SPEspecialidad
@valor varchar(9)
AS
	SELECT * FROM T_Hechos
	WHERE Especialidad_Atencion=@valor 
	GO

--CREAR PROCEDIMIENTO ALMACENADO ANIDADO 

CREATE OR ALTER PROCEDURE SPPRINCIPAL
@variable varchar(10),
@valor varchar(9)
AS	
	IF  @variable='Condicion'
		EXECUTE SPCondicion @valor
	ELSE IF @variable='Sexo'  
		EXECUTE SPSexo @valor
	ELSE IF  @variable='NivelEstudio'
		EXECUTE SPNivelEstudio @valor
	ELSE IF  @variable='TipoSeguro'
		EXECUTE SPTipoSeguro @valor
	ELSE IF  @variable='TipoPaciente'
		EXECUTE SPTipoPaciente @valor
	ELSE IF  @variable='Especialidad'
		EXECUTE SPEspecialidad	@valor	
GO


EXECUTE SPPRINCIPAL 'Condicion',1
EXECUTE SPPRINCIPAL 'Condicion',2
EXECUTE SPPRINCIPAL 'Sexo',2