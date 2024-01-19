SELECT @@SERVERNAME
USE CS


select * from T_Hechos

SELECT * FROM sys.procedures;

EXECUTE sp_helptext 'SPPRINCIPAL'
GO 	



EXECUTE sp_helptext 'SPTipoSeguro'
GO 

EXECUTE sp_helptext 'SPNivelEstudio'
GO 

EXECUTE SPNivelEstudio 2


EXECUTE sp_helptext 'SPTipoPaciente'
GO 

EXECUTE sp_helptext 'SPEspecialidad'
GO 

EXECUTE SPCondicion 2
EXECUTE SPSexo 2
EXECUTE SPNivelEstudio 2
EXECUTE SPTipoSeguro 2
EXECUTE SPTipoPaciente 2 --tipo de usuario
EXECUTE SPEspecialidad 'CM-PT'


EXECUTE  SPPRINCIPAL 'Sexo',2


CREATE  OR ALTER PROCEDURE SPPRINCIPAL  
@variable varchar(15),  --CAMBIAR el tamaño del titulo segun sea necesario
@valor varchar(10)  
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
  EXECUTE SPEspecialidad @valor   
GO