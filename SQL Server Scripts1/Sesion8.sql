
--CONTROL + SHIFT + U PARA PASAR A MAYUSCULA LOS COMENTARIOS 
--CREAR BASE DE DATOS
CREATE DATABASE CS
GO

--USAR BASE DE DATOS
USE CS
GO

--CREACION BASE DE DATOS 
CREATE TABLE T_Hechos(
    Numero_Encuesta INT PRIMARY KEY,
    Fecha_Aplicacion DATE,
    Hora_Inicio TIME,
    Condicion_Encuestado INT,
    Edad INT,
    Sexo INT,
    Nivel_Estudio INT,
    Tipo_Seguro INT,
    Tipo_Paciente INT,
    Especialidad_Atencion VARCHAR(50),
    E1 INT, E2 INT, E3 INT, E4 INT, E5 INT, E6 INT, E7 INT, E8 INT, E9 INT, E10 INT,
E11 INT,E12 INT,E13 INT,E14 INT,E15 INT,E16 INT,E17 INT,E18 INT,E19 INT,E20 INT,
E21 INT,E22 INT,P1 INT,P2 INT,P3 INT,P4 INT,P5 INT,P6 INT,P7 INT,P8 INT,P9 INT,P10 INT,
P11 INT,P12 INT,P13 INT,P14 INT,P15 INT,P16 INT,P17 INT,P18 INT,P19 INT,P20 INT,P21 INT,P22 INT,
Hora_Final TIME,
Encuestadora VARCHAR(50),
Duracion TIME
)
GO

SELECT * FROM T_Hechos
GO

BULK INSERT T_Hechos
FROM 'D:\CAPACITACIONES\2023\POWER BI\BUSINESS INTELLIGENCE CON POWER BI\Sesi�n 9\Datos\CE Tb_hechos.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Ignorar la primera fila que contiene los nombres de las columnas
)

SELECT * FROM T_Hechos
GO

--/*Importacion interfaz grafica 
--ELIMINAR TABLA Empleados
--DROP TABLE T_Hechos
--GO
----ELIMINAR LOS REGISTROS DE UNA TABLA
--TRUNCATE TABLE T_Hechos 
--GO



--Consultar tabla
SELECT * FROM T_Hechos
GO

--Sentencia CASE -sirve para categorizar segun condiciones

SELECT  Numero_Encuesta,Sexo,
		case WHEN Sexo=1 THEN '1.Masculino'
		else '2.Femenino'
		end AS  Sexo2
FROM T_Hechos


--

SELECT  Numero_Encuesta,Nivel_Estudio,
		CASE WHEN Nivel_Estudio=1 THEN '1.Anafalbeto'
		WHEN Nivel_Estudio=2 THEN '2.Primaria'
		WHEN Nivel_Estudio=3 THEN '3.Secundaria'
		WHEN Nivel_Estudio=4 THEN '4.Superior T�cnica'
		ELSE '5.Superior Universitario'
		end AS  Nivel_Estudio2
FROM T_Hechos


SELECT  Numero_Encuesta,Nivel_Estudio,
		CASE
			WHEN Nivel_Estudio=1 THEN '1.Anafalbeto'
			WHEN Nivel_Estudio=2 THEN '2.Primaria'
			WHEN Nivel_Estudio=3 THEN '3.Secundaria'
			WHEN Nivel_Estudio=4 THEN '4.Superior T�cnica'
			ELSE '5.Superior Universitario'
		END AS  Nivel_Estudio2
FROM T_Hechos

--OTRA FORMA 
SELECT  Numero_Encuesta,Nivel_Estudio,
		CASE Nivel_Estudio
			WHEN 1 THEN '1.Anafalbeto'
			WHEN 2 THEN '2.Primaria'
			WHEN 3 THEN '3.Secundaria'
			WHEN 4 THEN '4.Superior T�cnica'
			ELSE '5.Superior Universitario'
		END AS  Nivel_Estudio2
FROM T_Hechos


--Grado superior 
SELECT Numero_Encuesta, Nivel_Estudio,
    CASE
        WHEN Nivel_Estudio IN (1, 2, 3) THEN 'No_Estudios_Superiores'
        ELSE 'Si_estudios_superiores'
    END AS Estudios_Superiores
FROM T_Hechos;


--IF THEN ELSE
IF 3<4 and 5>6
	PRINT 'Mayor'
ELSE 
	PRINT 'Menor'
GO

--



SELECT  Numero_Encuesta,Sexo,
		case WHEN Sexo=1 THEN '1.Masculino'
		else '2.Femenino'
		end AS  Sexo2
FROM T_Hechos


-- SEXO 
DECLARE @sexo INT
SET @sexo=(SELECT Sexo From T_Hechos WHERE Numero_Encuesta=1)
IF @sexo=1
	PRINT 'Masculino'
ELSE 
	PRINT 'Femenino'
GO


DECLARE @sexo INT
SET @sexo=(SELECT Sexo From T_Hechos WHERE Numero_Encuesta=1)
IF @sexo=1
	PRINT 'Masculino'
ELSE 
	PRINT 'Femenino'
GO


--TIPO DE SEGURO 
DECLARE @tseguro INT
SET @tseguro=(SELECT Tipo_Seguro From T_Hechos WHERE Numero_Encuesta=1)
IF @tseguro=1
	PRINT '1.SIS'
ELSE IF @tseguro=2
	PRINT '2.SOAT'
ELSE IF @tseguro=3
	PRINT '3.Ninguno'
ELSE 
    PRINT '4.Otro'
GO

--OTRA FORMA 
DECLARE @nestudio INT
--SET @nestudio=(SELECT Nivel_Estudio From T_Hechos WHERE Numero_Encuesta=1)
SELECT @nestudio=Nivel_Estudio From T_Hechos WHERE Numero_Encuesta=1
IF @nestudio=1
	PRINT '1.Anafalbeto'
ELSE IF @nestudio=2
	PRINT '2.Primaria'
ELSE IF @nestudio=3
	PRINT '3.Secundaria'
ELSE IF @nestudio=4
    PRINT '4.Superior T�cnica'
ELSE 
	PRINT '5.Superior Universitario'
GO



DECLARE @tseguro INT
SET @tseguro=(SELECT Nivel_Estudio From T_Hechos WHERE Numero_Encuesta=15)
IF @tseguro=1
	PRINT '1.SIS'
ELSE IF @tseguro=2
	PRINT '2.SOAT'
ELSE IF @tseguro=3
	PRINT '3.Ninguno'
ELSE 
    PRINT '4.Otro'
GO


-- BUCLE WHILE
--EJEMPLO 1 
DECLARE @contador INT 
SET @contador=1
WHILE @contador<10
	BEGIN
		PRINT @contador
		SET  @contador=@contador+1
	END
GO

--EJEMPLO 2 
DECLARE @contador INT 
SET @contador=1
WHILE @contador<10
	BEGIN
		PRINT('HOLA '+CAST(@contador AS NVARCHAR(2))) -- CAST PARA CONVERTIR TIPO DE VARIABLES 
		SET @contador = @contador+1
	END
GO

--EJEMPLO 3 (INSERTAR LA TABLA HASTA n VECES  USANDO WHILE)

--CONSULTAR  TABLA  
SELECT * FROM T_Hechos
GO
--ELIMINAR TABLA 
DROP TABLE T_Hechos
GO

--CREAR TABLA PERO SIN PRIMARY KEY
CREATE TABLE T_Hechos (
    Numero_Encuesta INT ,
    Fecha_Aplicacion DATE,
    Hora_Inicio TIME,
    Condicion_Encuestado INT,
    Edad INT,
    Sexo INT,
    Nivel_Estudio INT,
    Tipo_Seguro INT,
    Tipo_Paciente INT,
    Especialidad_Atencion VARCHAR(50),
    E1 INT, E2 INT, E3 INT, E4 INT, E5 INT, E6 INT, E7 INT, E8 INT, E9 INT, E10 INT,
E11 INT,E12 INT,E13 INT,E14 INT,E15 INT,E16 INT,E17 INT,E18 INT,E19 INT,E20 INT,
E21 INT,E22 INT,P1 INT,P2 INT,P3 INT,P4 INT,P5 INT,P6 INT,P7 INT,P8 INT,P9 INT,P10 INT,
P11 INT,P12 INT,P13 INT,P14 INT,P15 INT,P16 INT,P17 INT,P18 INT,P19 INT,P20 INT,P21 INT,P22 INT,
Hora_Final TIME,
Encuestadora VARCHAR(50),
Duracion TIME
)
GO
--CONSULTAR  TABLA  
SELECT * FROM T_Hechos
GO
--ELIMINAR REGISTROS DE DATOS_ENC
TRUNCATE TABLE T_Hechos
GO

DECLARE @contador INT
SET @contador=1
WHILE @contador<11
BEGIN
	BULK INSERT T_Hechos
	FROM 'D:\CAPACITACIONES\2023\POWER BI\BUSINESS INTELLIGENCE CON POWER BI\Sesi�n 9\Datos\CE Tb_hechos.txt'
	WITH (FIELDTERMINATOR = '\t',ROWTERMINATOR = '\n',FIRSTROW = 2) -- Ignorar la primera fila que contiene los nombres de las columnas
	SET @contador= @contador+1
END
--CONSULTAR  TABLA  
SELECT * FROM T_Hechos
GO

--EJEMPLO 4

--ELIMINAR REGISTROS DE DATOS_ENC

--ELIMINAR TABLA 
DROP TABLE T_Hechos
GO
TRUNCATE TABLE T_Hechos
GO

CREATE TABLE T_Hechos (
    Numero_Encuesta INT PRIMARY KEY,
    Fecha_Aplicacion DATE,
    Hora_Inicio TIME,
    Condicion_Encuestado INT,
    Edad INT,
    Sexo INT,
    Nivel_Estudio INT,
    Tipo_Seguro INT,
    Tipo_Paciente INT,
    Especialidad_Atencion VARCHAR(50),
    E1 INT, E2 INT, E3 INT, E4 INT, E5 INT, E6 INT, E7 INT, E8 INT, E9 INT, E10 INT,
E11 INT,E12 INT,E13 INT,E14 INT,E15 INT,E16 INT,E17 INT,E18 INT,E19 INT,E20 INT,
E21 INT,E22 INT,P1 INT,P2 INT,P3 INT,P4 INT,P5 INT,P6 INT,P7 INT,P8 INT,P9 INT,P10 INT,
P11 INT,P12 INT,P13 INT,P14 INT,P15 INT,P16 INT,P17 INT,P18 INT,P19 INT,P20 INT,P21 INT,P22 INT,
Hora_Final TIME,
Encuestadora VARCHAR(50),
Duracion TIME
)
GO

BULK INSERT T_Hechos
FROM 'D:\CAPACITACIONES\2023\POWER BI\BUSINESS INTELLIGENCE CON POWER BI\Sesi�n 9\Datos\CE Tb_hechos.txt'
WITH (
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Ignorar la primera fila que contiene los nombres de las columnas
)

SELECT * FROM T_Hechos
GO

DECLARE @id INT
SET @id=1
DECLARE @espc VARCHAR(50)
WHILE @id<=5
	BEGIN
	    SET @espc=(SELECT Especialidad_Atencion From T_Hechos --SELECT @espc=Especialidad_Atencion FROM T_Hechos
		WHERE Numero_Encuesta=@id)
		PRINT @espc	
		SET @id =@id +1
	END
GO

SELECT TOP 5 Especialidad_Atencion FROM T_Hechos
GO
