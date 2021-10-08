USE [GD2C2021];
GO

BEGIN TRANSACTION
--------------------------------------------------- 
-- CHEQUEO DE STORED PROCEDURES
---------------------------------------------------
IF OBJECT_ID('[N&M''S].sp_XXX', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_XXX;
GO
--------------------------------------------------- 
-- CHEQUEO DE VISTAS
---------------------------------------------------
IF OBJECT_ID('[N&M''S].vw_xxx', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_xxx;
GO
--------------------------------------------------- 
-- CHEQUEO DE FUNCIONES
---------------------------------------------------
IF OBJECT_ID('[N&M''S].fn_xxx', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_xxx;
GO
--------------------------------------------------- 
-- CHEQUEO DE INDICES
---------------------------------------------------
-- xxx seria la tabla donde le "pega" ese indice
IF OBJECT_ID('[N&M''S].xxx.idx_xxx') IS NOT NULL
  DROP INDEX [N&M'S].xxx.idx_xxx;
GO
--------------------------------------------------- 
-- CHEQUEO DE TABLAS
---------------------------------------------------
IF OBJECT_ID('[N&M''S].Viaje', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Viaje;

IF OBJECT_ID('[N&M''S].Camion', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Camion;

IF OBJECT_ID('[N&M''S].Recorrido', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Recorrido;

IF OBJECT_ID('[N&M''S].Modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Modelo;

IF OBJECT_ID('[N&M''S].Marca', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Marca;

IF OBJECT_ID('[N&M''S].Taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Taller;

IF OBJECT_ID('[N&M''S].Ciudad', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Ciudad;

IF OBJECT_ID('[N&M''S].Chofer', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Chofer;

IF OBJECT_ID('[N&M''S].Paquete', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Paquete;

IF OBJECT_ID('[N&M''S].Paquete_x_Viaje', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Paquete_x_Viaje;
    
IF OBJECT_ID('[N&M''S].Orden_de_Trabajo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Orden_de_Trabajo;

IF OBJECT_ID('[N&M''S].Tarea', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Tarea;

IF OBJECT_ID('[N&M''S].Mecanico', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Mecanico;

IF OBJECT_ID('[N&M''S].Material', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Material;

IF OBJECT_ID('[N&M''S].Material_x_Tarea', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Material_x_Tarea;

IF OBJECT_ID('[N&M''S].Tarea_x_Orden', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Tarea_x_Orden;
GO

--------------------------------------------------- 
-- CHEQUEO Y CREACION DE ESQUEMA
---------------------------------------------------
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'N&M''S')
  DROP SCHEMA [N&M'S];
GO

CREATE SCHEMA "N&M'S";
GO
--------------------------------------------------
-- Esto despues se volara
--------------------------------------------------
DECLARE @id_test BIT = 1;
DECLARE @ErrorMessage NVARCHAR(MAX);  
DECLARE @ErrorSeverity INT;  
DECLARE @ErrorState INT;  
--------------------------------------------------- 
-- CREACION DE TABLAS
---------------------------------------------------
CREATE TABLE [N&M'S].Ciudad (
  ciudad_id INT PRIMARY KEY IDENTITY(1,1),
  nombre NVARCHAR(510) NOT NULL
);

CREATE TABLE [N&M'S].Recorrido (
  recorrido_id INT PRIMARY KEY IDENTITY(1,1),
  id_ciudad_origen INT NOT NULL REFERENCES [N&M'S].Ciudad(ciudad_id),
  id_ciudad_destino INT NOT NULL REFERENCES [N&M'S].Ciudad(ciudad_id),
  km_recorridos INT NOT NULL,
  precio DECIMAL(18,2) NOT NULL
);

CREATE TABLE [N&M'S].Taller (
  taller_id INT PRIMARY KEY IDENTITY(1,1),
  ciudad_id INT NOT NULL REFERENCES [N&M'S].Ciudad(ciudad_id),
  nombre NVARCHAR(510) NOT NULL,
  direccion NVARCHAR(510),
  telefono DECIMAL(18,0),
  mail NVARCHAR(510)
);

CREATE TABLE [N&M'S].Modelo (
  modelo_id INT PRIMARY KEY IDENTITY(1,1),
  descripcion NVARCHAR(510) NOT NULL,
  velocidad_max INT NOT NULL,
  capacidad_tanque INT NOT NULL,
  capacidad_carga INT NOT NULL
);

CREATE TABLE [N&M'S].Marca (
  marca_id INT PRIMARY KEY IDENTITY(1,1),
  descripcion NVARCHAR(510) NOT NULL
);

CREATE TABLE [N&M'S].Camion (
  camion_id INT PRIMARY KEY IDENTITY(1,1),
  marca_id INT NOT NULL REFERENCES [N&M'S].Marca(marca_id),
  modelo_id INT NOT NULL REFERENCES [N&M'S].Modelo(modelo_id),
  patente NVARCHAR(510) NOT NULL,
  nro_chasis NVARCHAR(510) NOT NULL,
  nro_motor NVARCHAR(510) NOT NULL,
  fecha_alta DATETIME2 NOT NULL
);

CREATE TABLE [N&M'S].Chofer (
  chofer_id INT PRIMARY KEY IDENTITY(1,1),
  nombre NVARCHAR(510) NOT NULL,
  apellido NVARCHAR(510) NOT NULL,
  dni DECIMAL(18,0) NOT NULL,
  direccion NVARCHAR(510),
  telefono INT,
  mail NVARCHAR(510),
  fecha_nacimiento DATETIME2 NOT NULL,
  legajo INT NOT NULL,
  costo_x_hora INT NOT NULL
);

CREATE TABLE [N&M'S].Viaje (
  nro_viaje INT IDENTITY(1,1),
  camion_id INT NOT NULL REFERENCES [N&M'S].Camion(camion_id),
  chofer_id INT NOT NULL REFERENCES [N&M'S].Chofer(chofer_id),
  recorrido_id INT NOT NULL REFERENCES [N&M'S].Recorrido(recorrido_id),
  fecha_inicio DATETIME2 NOT NULL,
  fecha_fin DATETIME2 NOT NULL,
  consumo_combustible DECIMAL(18,2) NOT NULL
);

BEGIN
	IF @id_test = 1
		BEGIN
			PRINT 'Funca todo, pero falta'
			ROLLBACK TRANSACTION
		END
	ELSE
		BEGIN
			PRINT 'Fin con exito'	
			COMMIT TRANSACTION
		END
END

-- Funca hasta aca, falta
/*
CREATE TABLE `Paquete` (
  `paquete_id` int,
  `descripcion` nvarchar(510),
  `precio` decimal,
  `peso_max` decimal,
  `alto_max` decimal,
  `ancho_max` decimal,
  `largo_max` decimal,
  PRIMARY KEY (`paquete_id`)
);

CREATE TABLE `Paquete_x_Viaje` (
  `nro_viaje` int,
  `paquete_id` int,
  `cantidad_paquete` int,
  PRIMARY KEY (`nro_viaje`, `paquete_id`),
  FOREIGN KEY ( `nro_viaje`) REFERENCES `Viaje`(`nro_viaje`),
  FOREIGN KEY ( `paquete_id`) REFERENCES `Paquete`(`paquete_id`)
);

CREATE TABLE `Orden_de_Trabajo` (
  `nro_orden` int,
  `camion_id` int,
  `taller_id` int,
  `fecha_generada` datetime2,
  `estado` nvarchar(510),
  PRIMARY KEY (`nro_orden`),
  FOREIGN KEY ( `camion_id`) REFERENCES `Camion`(`camion_id`),
  FOREIGN KEY ( `taller_id`) REFERENCES `Taller`(`taller_id`),
);

CREATE TABLE `Tarea` (
  `tarea_id` int,
  `tipo_tarea` nvarchar(510),
  `nombre` nvarchar(510),
  `tiempo_estimado` int,
  PRIMARY KEY (`tarea_id`)
);

CREATE TABLE `Mecanico` (
  `mecanico_id` int,
  `nombre` nvarchar(510),
  `apellido` nvarchar(510),
  `dni` decimal,
  `direccion` nvarchar(510),
  `telefono` int,
  `mail` nvarchar(510),
  `fecha_nacimiento` datetime2,
  `legajo` int,
  `costo_x_hora` int,
  PRIMARY KEY (`mecanico_id`)
);

CREATE TABLE `Tarea_x_Orden` (
  `nro_orden` int,
  `tarea_id` int,
  `mecanico_id` int,
  `fecha_inicio_planificada` datetime2,
  `fecha_inicio_real` datetime2,
  `fecha_fin_real` datetime2,
  `tiempo_ejecucion` int,
  PRIMARY KEY (`nro_orden`),
  FOREIGN KEY ( `tarea_id`) REFERENCES `Tarea`(`tarea_id`),
  FOREIGN KEY ( `mecanico_id`) REFERENCES `Mecanico`(`mecanico_id`)
);

CREATE TABLE `Material` (
  `tipo_id` int,
  `descripcion` nvarchar(510),
  PRIMARY KEY (`tipo_id`)

);

CREATE TABLE `Material_x_Tarea` (
  `tarea_id` int,
  `material_id` int,
  `cantidad` int,
  PRIMARY KEY (`tarea_id`, `material_id`),
  FOREIGN KEY ( `tarea_id`) REFERENCES `Tarea`(`tarea_id`),
  FOREIGN KEY ( `material_id`) REFERENCES `Material`(`material_id`)
);

---------------------------------------------------
-- CREACION DE INDICES
---------------------------------------------------

-- Nose si son necesarios todavia, pero dejo el molde
CREATE INDEX idx_xxx ON [N&M'S].xxx (..., ...); 

---------------------------------------------------
-- CREACION DE FUNCIONES
---------------------------------------------------

-- Nose si son necesarias todavia, pero dejo el molde

CREATE FUNCTION [N&M'S].fn_xxx(@id_banana INT) RETURNS INT AS
	BEGIN
		RETURN @id_banana;
	END
GO

---------------------------------------------------
-- CREACION DE STORED PROCEDURES
---------------------------------------------------

-- Crear SP's para migrar los datos a cada tabla
CREATE PROCEDURE [N&M'S].sp_xxx AS
	BEGIN TRY
		BEGIN TRANSACTION

			SELECT 1/0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			SELECT
				ERROR_NUMBER() ErrorNumber,
				ERROR_STATE() ErrorState,
				ERROR_SEVERITY() ErrorSeverity,
				ERROR_PROCEDURE() ErrorProcedure,
				ERROR_LINE() ErrorLine,
				ERROR_MESSAGE() ErrorMessage;
			
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);  
	END CATCH
GO

---------------------------------------------------
-- EJECUCIÓN DE STORED PROCEDURES
---------------------------------------------------

-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx
-- EXEC [N&M'S].sp_migrar_xxxxx

---------------------------------------------------
-- CREACION DE VISTAS
---------------------------------------------------

-- Son 8

---------------------------------------------------
1. Máximo tiempo fuera de servicio de cada camión por cuatrimestre
Se entiende por fuera de servicio cuando el camión está en el taller (tiene
una OT) y no se encuentra disponible para un viaje.

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object

---------------------------------------------------

2. Costo total de mantenimiento por camión, por taller, por cuatrimestre.
Se entiende por costo de mantenimiento el costo de materiales + el costo
de mano de obra insumido en cada tarea (correctivas y preventivas)

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

3. Desvío promedio de cada tarea x taller


CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

4. Las 5 tareas que más se realizan por modelo de camión


CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

5. Los 10 materiales más utilizados por taller

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

6. Facturación total por recorrido por cuatrimestre (En función de la cantidad y tipo de paquetes que transporta el camión y el recorrido)

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

7. Costo promedio x rango etario de choferes

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

8. Ganancia por camión (Ingresos – Costo de viaje – Costo de mantenimiento)
	- Ingresos: en función de la cantidad y tipo de paquetes que
	transporta el camión y el recorrido

	- Costo de viaje: costo del chofer + el costo de combustible.
	Tomar precio por lt de combustible $100

	- Costo de mantenimiento: costo de materiales + costo de mano de
	obra

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------
*/
