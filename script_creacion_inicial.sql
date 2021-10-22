USE [GD2C2021]
GO

PRINT 'Realizando limpieza en base de datos [GD2C2021]' + CHAR(13)
GO
--------------------------------------------------- 
-- CHEQUEO DE STORED PROCEDURES
---------------------------------------------------
IF OBJECT_ID('[N&M''S].sp_migrar_ciudad', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_ciudad
GO

IF OBJECT_ID('[N&M''S].sp_migrar_recorrido', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_recorrido
GO

IF OBJECT_ID('[N&M''S].sp_migrar_taller', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_taller
GO

IF OBJECT_ID('[N&M''S].sp_migrar_modelo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_modelo
GO

IF OBJECT_ID('[N&M''S].sp_migrar_marca', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_marca
GO

IF OBJECT_ID('[N&M''S].sp_migrar_camion', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_camion
GO

IF OBJECT_ID('[N&M''S].sp_migrar_chofer', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_chofer
GO

IF OBJECT_ID('[N&M''S].sp_migrar_viaje', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_viaje
GO

IF OBJECT_ID('[N&M''S].sp_migrar_paquete_x_viaje', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_paquete_x_viaje
GO

IF OBJECT_ID('[N&M''S].sp_migrar_orden_de_trabajo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_orden_de_trabajo
GO

IF OBJECT_ID('[N&M''S].sp_migrar_tarea', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_tarea
GO

IF OBJECT_ID('[N&M''S].sp_migrar_paquete', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_paquete
GO

IF OBJECT_ID('[N&M''S].sp_tarea_x_orden', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_tarea_x_orden
GO

IF OBJECT_ID('[N&M''S].sp_migrar_mecanico', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_mecanico
GO

IF OBJECT_ID('[N&M''S].sp_migrar_material', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_material
GO

IF OBJECT_ID('[N&M''S].sp_migrar_material_x_tarea', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_material_x_tarea
GO

IF OBJECT_ID('[N&M''S].sp_migrar_orden_de_trabajo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_orden_de_trabajo
GO

IF OBJECT_ID('[N&M''S].sp_migrar_mecanico', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_mecanico
GO

IF OBJECT_ID('[N&M''S].sp_migrar_tarea_x_orden', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_tarea_x_orden
GO

IF OBJECT_ID('[N&M''S].sp_migrar_material', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_material
GO

IF OBJECT_ID('[N&M''S].sp_migrar_material_x_tarea', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_material_x_tarea
GO
--------------------------------------------------- 
-- CHEQUEO DE VISTAS
---------------------------------------------------
IF OBJECT_ID('[N&M''S].vw_xxx', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_xxx
GO
--------------------------------------------------- 
-- CHEQUEO DE FUNCIONES
---------------------------------------------------
IF OBJECT_ID('[N&M''S].fn_obtener_id_ciudad', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_ciudad
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_marca', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_marca
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_modelo', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_modelo
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_camion', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_camion
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_chofer', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_chofer
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_recorrido', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_recorrido
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_paquete', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_paquete
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_viaje', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_viaje
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_taller', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_taller
GO

IF OBJECT_ID('[N&M''S].fn_obtener_nro_orden', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_nro_orden
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_mecanico', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_mecanico
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_material', 'FN') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_material
GO

--------------------------------------------------- 
-- CHEQUEO DE INDICES
---------------------------------------------------
-- xxx seria la tabla donde le "pega" ese indice
IF OBJECT_ID('[N&M''S].xxx.idx_xxx') IS NOT NULL
  DROP INDEX [N&M'S].xxx.idx_xxx
GO
--------------------------------------------------- 
-- CHEQUEO DE TABLAS
---------------------------------------------------
IF OBJECT_ID('[N&M''S].Paquete_x_Viaje', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Paquete_x_Viaje

IF OBJECT_ID('[N&M''S].Viaje', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Viaje

IF OBJECT_ID('[N&M''S].Paquete', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Paquete

IF OBJECT_ID('[N&M''S].Tarea_x_Orden', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Tarea_x_Orden

IF OBJECT_ID('[N&M''S].Orden_de_Trabajo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Orden_de_Trabajo

IF OBJECT_ID('[N&M''S].Mecanico', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Mecanico

IF OBJECT_ID('[N&M''S].Material_x_Tarea', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Material_x_Tarea

IF OBJECT_ID('[N&M''S].Tarea', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Tarea

IF OBJECT_ID('[N&M''S].Material', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Material

IF OBJECT_ID('[N&M''S].Taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Taller

IF OBJECT_ID('[N&M''S].Camion', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Camion

IF OBJECT_ID('[N&M''S].Modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Modelo

IF OBJECT_ID('[N&M''S].Marca', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Marca

IF OBJECT_ID('[N&M''S].Recorrido', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Recorrido

IF OBJECT_ID('[N&M''S].Ciudad', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Ciudad

IF OBJECT_ID('[N&M''S].Chofer', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Chofer

BEGIN TRANSACTION
--------------------------------------------------- 
-- CHEQUEO Y CREACION DE ESQUEMA
---------------------------------------------------
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'N&M''S')
  DROP SCHEMA [N&M'S]
GO

PRINT 'Creando ESQUEMA [N&M''S]' + CHAR(13)
GO

CREATE SCHEMA "N&M'S"
GO
--------------------------------------------------- 
-- CREACION DE TABLAS
---------------------------------------------------
PRINT 'Creando TABLAS para la migracion de datos en base al DER planteado' + CHAR(13)
GO

CREATE TABLE [N&M'S].Ciudad (
	ciudad_id INT PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(510) NOT NULL 
)

CREATE TABLE [N&M'S].Recorrido (
	recorrido_id INT PRIMARY KEY IDENTITY(1,1),
	id_ciudad_origen INT NOT NULL REFERENCES [N&M'S].Ciudad(ciudad_id),
	id_ciudad_destino INT NOT NULL REFERENCES [N&M'S].Ciudad(ciudad_id),
	km_recorridos INT NOT NULL,
	precio DECIMAL(18,2) NOT NULL
)

CREATE TABLE [N&M'S].Taller (
	taller_id INT PRIMARY KEY IDENTITY(1,1),
	ciudad_id INT NOT NULL REFERENCES [N&M'S].Ciudad(ciudad_id),
	nombre NVARCHAR(510) NOT NULL,
	direccion NVARCHAR(510),
	telefono DECIMAL(18,0),
	mail NVARCHAR(510)
)

CREATE TABLE [N&M'S].Modelo (
	modelo_id INT PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(510) NOT NULL,
	velocidad_max INT NOT NULL,
	capacidad_tanque INT NOT NULL,
	capacidad_carga INT NOT NULL
)

CREATE TABLE [N&M'S].Marca (
	marca_id INT PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(510) NOT NULL
)

CREATE TABLE [N&M'S].Camion (
	camion_id INT PRIMARY KEY IDENTITY(1,1),
	marca_id INT NOT NULL REFERENCES [N&M'S].Marca(marca_id),
	modelo_id INT NOT NULL REFERENCES [N&M'S].Modelo(modelo_id),
	patente NVARCHAR(510) NOT NULL,
	nro_chasis NVARCHAR(510),
	nro_motor NVARCHAR(510),
	fecha_alta DATETIME2
)

CREATE TABLE [N&M'S].Chofer (
	chofer_id INT PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(510) NOT NULL,
	apellido NVARCHAR(510) NOT NULL,
	dni DECIMAL(18,0) NOT NULL,
	direccion NVARCHAR(510),
	telefono INT,
	mail NVARCHAR(510),
	fecha_nacimiento DATETIME2,
	legajo INT NOT NULL,
	costo_x_hora INT NOT NULL
)

CREATE TABLE [N&M'S].Viaje (
	nro_viaje INT PRIMARY KEY IDENTITY(1,1),
	camion_id INT NOT NULL REFERENCES [N&M'S].Camion(camion_id),
	chofer_id INT NOT NULL REFERENCES [N&M'S].Chofer(chofer_id),
	recorrido_id INT NOT NULL REFERENCES [N&M'S].Recorrido(recorrido_id),
	fecha_inicio DATETIME2,
	fecha_fin DATETIME2,
	consumo_combustible DECIMAL(18,2)
)

CREATE TABLE [N&M'S].Paquete (
	paquete_id INT PRIMARY KEY IDENTITY(1,1),
	descripcion NVARCHAR(510),
	precio DECIMAL(18,2),
	peso_max DECIMAL(18,2),
	alto_max DECIMAL(18,2),
	ancho_max DECIMAL(18,2),
	largo_max DECIMAL(18,2),
)

CREATE TABLE [N&M'S].Paquete_x_Viaje (
	nro_viaje INT REFERENCES [N&M'S].Viaje(nro_viaje),
	paquete_id INT REFERENCES [N&M'S].Paquete(paquete_id),
	cantidad_paquete INT,
	PRIMARY KEY(nro_viaje,paquete_id)
)

CREATE TABLE [N&M'S].Orden_de_Trabajo (
	nro_orden INT PRIMARY KEY IDENTITY(1,1),
	camion_id INT REFERENCES [N&M'S].Camion(camion_id),
	taller_id INT REFERENCES [N&M'S].Taller(taller_id),
	fecha_generada DATETIME2,
	estado NVARCHAR(510),
)

CREATE TABLE [N&M'S].Tarea (
	tarea_id INT PRIMARY KEY,
	tipo_tarea NVARCHAR(510),
	nombre NVARCHAR(510),
	tiempo_estimado INT,
)

CREATE TABLE [N&M'S].Mecanico (
	mecanico_id INT PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(510),
	apellido NVARCHAR(510),
	dni DECIMAL(18,0),
	direccion NVARCHAR(510),
	telefono INT,
	mail NVARCHAR(510),
	fecha_nacimiento DATETIME2,
	legajo INT,
	costo_x_hora INT,
)

CREATE TABLE [N&M'S].Tarea_x_Orden (
	id_tarea_x_nro_orden INT PRIMARY KEY IDENTITY(1,1),
	nro_orden INT REFERENCES [N&M'S].Orden_de_Trabajo(nro_orden),
	tarea_id INT REFERENCES [N&M'S].Tarea(tarea_id),
	mecanico_id INT REFERENCES [N&M'S].Mecanico(mecanico_id),
	fecha_inicio_planificada DATETIME2,
	fecha_inicio_real DATETIME2,
	fecha_fin_real DATETIME2,
	tiempo_ejecucion INT
)

CREATE TABLE [N&M'S].Material (
	material_id INT PRIMARY KEY IDENTITY(1,1),
	codigo NVARCHAR(100),
	descripcion NVARCHAR(510),
	precio DECIMAL(18,2)
)

CREATE TABLE [N&M'S].Material_x_Tarea (
	tarea_id INT REFERENCES [N&M'S].Tarea(tarea_id),
	material_id INT REFERENCES [N&M'S].Material(material_id),
	cantidad INT,
	PRIMARY KEY (tarea_id, material_id),
)
GO

/*
---------------------------------------------------
-- CREACION DE INDICES
---------------------------------------------------
PRINT 'Creando INDICES' + CHAR(13)
GO
-- QUIZA haya que crear un indice para la tabla de viajes, ya que tiene varios registros ...

-- Nose si son necesarios todavia, pero dejo el molde
CREATE INDEX idx_xxx ON [N&M'S].xxx (..., ...)

*/
---------------------------------------------------
-- CREACION DE FUNCIONES
---------------------------------------------------
PRINT 'Creando FUNCIONES para la migracion de datos' + CHAR(13)
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un nombre de ciudad, me devuelve el ciudad_id de la tabla Ciudad
	@parameters: Nombre de la ciudad
	@return: El id de la ciudad que encuentre
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_ciudad(@ciudad_nombre NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @ciudad_id INT
		SELECT @ciudad_id = ciudad_id FROM [N&M'S].Ciudad WHERE nombre = @ciudad_nombre
		RETURN @ciudad_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un nombre de marca, me devuelve el marca_id de la tabla Marca
	@parameters: Nombre de la marca
	@return: El id de la marca que encuentre
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_marca(@descripcion_marca NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @marca_id INT
		SELECT @marca_id = marca_id FROM [N&M'S].Marca WHERE descripcion = @descripcion_marca
		RETURN @marca_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un nombre de modelo, me devuelve el modelo_id de la tabla Modelo
	@parameters: Nombre del modelo
	@return: El id del modelo que encuentre
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_modelo(@descripcion_modelo NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @modelo_id INT
		SELECT @modelo_id = modelo_id FROM [N&M'S].Modelo WHERE descripcion = @descripcion_modelo
		RETURN @modelo_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dada una patente, me devuelve el camion_id de la tabla Camion que corresponde a esa patente
	@parameters: Patente del camion
	@return: El id del camion que encuentre
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_camion(@patente NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @camion_id INT
		SELECT @camion_id = camion_id FROM [N&M'S].Camion WHERE patente = @patente
		RETURN @camion_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un numero de legajo, me devuelve el chofer_id de la tabla Chofer que corresponde a ese legajo (se asume que cada chofer tiene su propio legajo UNICO)
	@parameters: Legajo del chofer
	@return: El id del chofer que encuentre
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_chofer(@legajo NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @chofer_id INT
		SELECT @chofer_id = chofer_id FROM [N&M'S].Chofer WHERE legajo = @legajo
		RETURN @chofer_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Obtiene el id recorrido de la tabla recorrido para una combinacion de origen-destino existente
	@parameters: La ciudad de origen y destino
	@return: El id recorrido que corresponde a ese origen y destino
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_recorrido(@ciudad_origen NVARCHAR(510), @ciudad_destino NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @recorrido_id INT
		DECLARE @id_recorrido_ciudad_origen INT = [N&M'S].fn_obtener_id_ciudad(@ciudad_origen)
		DECLARE @id_recorrido_ciudad_destino INT = [N&M'S].fn_obtener_id_ciudad(@ciudad_destino)

		SELECT @recorrido_id = recorrido_id 
		FROM [N&M'S].Recorrido 
		WHERE id_ciudad_origen = @id_recorrido_ciudad_origen AND 
			id_ciudad_destino = @id_recorrido_ciudad_destino 

		RETURN @recorrido_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Obtiene el numero de viaje de la tabla viaje en base a la combinacion camion-chofer-recorrido del viaje que se busca
	@parameters: Id camion, Id chofer y Id recorrido
	@return: El numero de viaje
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_viaje(@id_camion INT, @id_chofer INT, @id_recorrido INT) 
	RETURNS INT AS
	BEGIN
		DECLARE @nro_viaje INT
		SELECT @nro_viaje = nro_viaje 
			FROM [N&M'S].Viaje 
			WHERE 
				camion_id = @id_camion AND chofer_id = @id_chofer AND recorrido_id = @id_recorrido
		RETURN @nro_viaje
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Obtener los datos del tipo de paquete en base a su descripcion (Pequeño, mediano o grande)
	@parameters: La descripcion del paquete
	@return: El id en base al tipo de paquete
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_paquete(@descripcion VARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @paquete_id INT
		SELECT @paquete_id = paquete_id FROM [N&M'S].Paquete WHERE descripcion = @descripcion
		RETURN @paquete_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Obtener el id del taller en su a su nombre
	@parameters: taller_id
	@return: El id del taller
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_taller(@nombre_taller VARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @taller_id INT
		SELECT @taller_id = taller_id FROM [N&M'S].Taller WHERE nombre = @nombre_taller		
		RETURN @taller_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un id de camion y un id de taller, devuelve la OT que tenga asignada ese camion
	@parameters: El camion que tiene ya asignada una OT y el taller id
	@return: El numero de orden de esa OT
*/
CREATE FUNCTION [N&M'S].fn_obtener_nro_orden(@camion_id INT, @taller_id INT) RETURNS INT AS
	BEGIN
		DECLARE @nro_orden INT
		SELECT @nro_orden = nro_orden FROM [N&M'S].Orden_de_Trabajo WHERE camion_id = @camion_id AND taller_id = @taller_id
		RETURN @nro_orden
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un numero de legajo, me devuelve el mecanico_id de la tabla Mecanico que corresponde a ese legajo
	@parameters: Legajo del mecanico
	@return: El id del mecanico que encuentre
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_mecanico(@legajo NVARCHAR(510)) RETURNS INT AS
	BEGIN
		DECLARE @mecanico_id INT
		SELECT @mecanico_id = mecanico_id FROM [N&M'S].Mecanico WHERE legajo = @legajo
		RETURN @mecanico_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dado un codigo de material, me devuelve el material_id de la tabla Material que corresponde a ese codigo
	@parameters: Codigo del producto
	@return: El id del material
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_material(@codigo NVARCHAR(100)) RETURNS INT AS
	BEGIN
		DECLARE @material_id INT
		SELECT @material_id = material_id FROM [N&M'S].Material WHERE codigo = @codigo
		RETURN @material_id
	END
GO
---------------------------------------------------
-- CREACION DE STORED PROCEDURES
---------------------------------------------------
PRINT 'Creando STORED PROCEDURES para la migracion de datos' + CHAR(13)
GO

CREATE PROCEDURE [N&M'S].sp_migrar_ciudad AS
	DECLARE @ErrorMessage NVARCHAR(MAX) 
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Ciudad (nombre)
				SELECT DISTINCT RECORRIDO_CIUDAD_ORIGEN FROM gd_esquema.Maestra WHERE RECORRIDO_CIUDAD_ORIGEN IS NOT NULL
					UNION 
				SELECT DISTINCT RECORRIDO_CIUDAD_DESTINO FROM gd_esquema.Maestra WHERE RECORRIDO_CIUDAD_DESTINO IS NOT NULL
					UNION
				SELECT DISTINCT TALLER_CIUDAD FROM gd_esquema.Maestra WHERE TALLER_CIUDAD IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);  
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_recorrido AS
	DECLARE @ErrorMessage NVARCHAR(MAX) 
	DECLARE @ErrorSeverity INT 
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Recorrido (id_ciudad_origen, id_ciudad_destino, km_recorridos, precio)
				SELECT DISTINCT
					[N&M'S].fn_obtener_id_ciudad(RECORRIDO_CIUDAD_ORIGEN), 
					[N&M'S].fn_obtener_id_ciudad(RECORRIDO_CIUDAD_DESTINO),
					RECORRIDO_KM, 
					RECORRIDO_PRECIO 
					FROM gd_esquema.maestra 
					WHERE RECORRIDO_CIUDAD_ORIGEN IS NOT NULL AND RECORRIDO_CIUDAD_DESTINO IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);  
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_taller AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Taller(ciudad_id, nombre, direccion, telefono, mail)
			SELECT DISTINCT
				[N&M'S].fn_obtener_id_ciudad(TALLER_CIUDAD),
				TALLER_NOMBRE,
				TALLER_DIRECCION,
				TALLER_TELEFONO,
				TALLER_MAIL 
				FROM gd_esquema.Maestra
				WHERE TALLER_CIUDAD IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_modelo AS
	DECLARE @ErrorMessage NVARCHAR(MAX) 
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Modelo(descripcion, velocidad_max, capacidad_tanque, capacidad_carga)
			SELECT DISTINCT MODELO_CAMION, MODELO_VELOCIDAD_MAX, MODELO_CAPACIDAD_TANQUE, MODELO_CAPACIDAD_CARGA  
			FROM gd_esquema.Maestra
			WHERE MODELO_CAMION IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_marca AS
	DECLARE @ErrorMessage NVARCHAR(MAX) 
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Marca(descripcion)
			SELECT DISTINCT MARCA_CAMION_MARCA FROM gd_esquema.Maestra WHERE MARCA_CAMION_MARCA IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState) 
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_camion AS
	DECLARE @ErrorMessage NVARCHAR(MAX)  
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Camion(marca_id, modelo_id, patente, nro_chasis, nro_motor, fecha_alta)
			SELECT DISTINCT
				[N&M'S].fn_obtener_id_marca(MARCA_CAMION_MARCA),
				[N&M'S].fn_obtener_id_modelo(MODELO_CAMION),
				CAMION_PATENTE,
				CAMION_NRO_CHASIS,
				CAMION_NRO_MOTOR,
				CAMION_FECHA_ALTA 
			FROM gd_esquema.Maestra
			WHERE MARCA_CAMION_MARCA IS NOT NULL AND MODELO_CAMION IS NOT NULL AND CAMION_PATENTE IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_chofer AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Chofer(nombre, apellido, dni, direccion, telefono, mail, fecha_nacimiento, legajo, costo_x_hora)
			SELECT DISTINCT CHOFER_NOMBRE, CHOFER_APELLIDO, CHOFER_DNI, CHOFER_DIRECCION, CHOFER_TELEFONO, CHOFER_MAIL, CHOFER_FECHA_NAC, CHOFER_NRO_LEGAJO, CHOFER_COSTO_HORA 
			FROM gd_esquema.Maestra
			WHERE CHOFER_NRO_LEGAJO IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_viaje AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO [N&M'S].Viaje(camion_id, chofer_id, recorrido_id, fecha_inicio, fecha_fin, consumo_combustible)
		SELECT DISTINCT
			[N&M'S].fn_obtener_id_camion(CAMION_PATENTE),
			[N&M'S].fn_obtener_id_chofer(CHOFER_NRO_LEGAJO),
			[N&M'S].fn_obtener_id_recorrido(RECORRIDO_CIUDAD_ORIGEN, RECORRIDO_CIUDAD_DESTINO),
			VIAJE_FECHA_INICIO, VIAJE_FECHA_FIN, VIAJE_CONSUMO_COMBUSTIBLE
		FROM gd_esquema.Maestra
		WHERE CAMION_PATENTE IS NOT NULL AND 
			CHOFER_NRO_LEGAJO IS NOT NULL AND 
			RECORRIDO_CIUDAD_ORIGEN IS NOT NULL AND 
			RECORRIDO_CIUDAD_DESTINO IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_paquete AS
	DECLARE @ErrorMessage NVARCHAR(MAX) 
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Paquete(descripcion, precio,peso_max, alto_max, ancho_max, largo_max)
			SELECT DISTINCT PAQUETE_DESCRIPCION, PAQUETE_PRECIO, PAQUETE_PESO_MAX, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX
			FROM gd_esquema.Maestra
			WHERE PAQUETE_DESCRIPCION IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_paquete_x_viaje AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT 
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Paquete_x_Viaje(nro_viaje, paquete_id, cantidad_paquete)
				SELECT DISTINCT
					[N&M'S].fn_obtener_id_viaje( 
						[N&M'S].fn_obtener_id_camion(CAMION_PATENTE),
						[N&M'S].fn_obtener_id_chofer(CHOFER_NRO_LEGAJO), 
						[N&M'S].fn_obtener_id_recorrido(RECORRIDO_CIUDAD_ORIGEN, RECORRIDO_CIUDAD_DESTINO)),
					[N&M'S].fn_obtener_id_paquete(PAQUETE_DESCRIPCION),
					SUM(PAQUETE_CANTIDAD) 
				FROM gd_esquema.Maestra
				WHERE CHOFER_NRO_LEGAJO IS NOT NULL AND 
					CAMION_PATENTE IS NOT NULL AND 
					RECORRIDO_CIUDAD_ORIGEN IS NOT NULL AND 
					RECORRIDO_CIUDAD_DESTINO IS NOT NULL AND
					PAQUETE_DESCRIPCION IS NOT NULL
				GROUP BY CAMION_PATENTE, CHOFER_NRO_LEGAJO, RECORRIDO_CIUDAD_ORIGEN, RECORRIDO_CIUDAD_DESTINO, PAQUETE_DESCRIPCION
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_orden_de_trabajo AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT 
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Orden_de_Trabajo(camion_id, taller_id, fecha_generada, estado)
			SELECT DISTINCT 
				[N&M'S].fn_obtener_id_camion(CAMION_PATENTE), 
				[N&M'S].fn_obtener_id_taller(TALLER_NOMBRE), 
				ORDEN_TRABAJO_FECHA, 
				ORDEN_TRABAJO_ESTADO
				FROM gd_esquema.Maestra
				WHERE CAMION_PATENTE IS NOT NULL AND
				TALLER_NOMBRE IS NOT NULL AND 
				ORDEN_TRABAJO_FECHA IS NOT NULL AND
				ORDEN_TRABAJO_ESTADO IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_tarea AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Tarea(tarea_id, tipo_tarea, nombre, tiempo_estimado)
			SELECT DISTINCT 
				TAREA_CODIGO,
				REPLACE(TIPO_TAREA, 'Mantenimiento ', ''), 
				TAREA_DESCRIPCION,
				TAREA_TIEMPO_ESTIMADO
			FROM gd_esquema.Maestra
			WHERE TAREA_CODIGO IS NOT NULL 
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO


CREATE PROCEDURE [N&M'S].sp_migrar_mecanico AS
	DECLARE @ErrorMessage NVARCHAR(MAX) 
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Mecanico(nombre, apellido, dni, direccion, telefono, mail, fecha_nacimiento, legajo, costo_x_hora)
			SELECT DISTINCT 
				MECANICO_NOMBRE,
				MECANICO_APELLIDO,
				MECANICO_DNI,
				MECANICO_DIRECCION,
				MECANICO_TELEFONO, 
				MECANICO_MAIL, 
				MECANICO_FECHA_NAC, 
				MECANICO_NRO_LEGAJO,
				MECANICO_COSTO_HORA
			FROM gd_esquema.Maestra
			WHERE MECANICO_NRO_LEGAJO IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_tarea_x_orden AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Tarea_x_Orden(nro_orden,tarea_id,mecanico_id,fecha_inicio_planificada,fecha_inicio_real,fecha_fin_real,tiempo_ejecucion)
			SELECT DISTINCT 
			[N&M'S].fn_obtener_nro_orden(
				[N&M'S].fn_obtener_id_camion(CAMION_PATENTE),
				[N&M'S].fn_obtener_id_taller(TALLER_NOMBRE)),
			TAREA_CODIGO,
			[N&M'S].fn_obtener_id_mecanico(MECANICO_NRO_LEGAJO),
			TAREA_FECHA_INICIO_PLANIFICADO,
			TAREA_FECHA_INICIO,
			TAREA_FECHA_FIN, 
			DATEDIFF(DAY, TAREA_FECHA_INICIO, TAREA_FECHA_FIN) -- Tiempo de ejecucion en DIAS
			FROM gd_esquema.Maestra
			WHERE CAMION_PATENTE IS NOT NULL AND
			TALLER_NOMBRE IS NOT NULL AND
			MECANICO_NRO_LEGAJO IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_material AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Material(codigo,descripcion,precio)
			SELECT DISTINCT 
				MATERIAL_COD,
				MATERIAL_DESCRIPCION,
				MATERIAL_PRECIO
			FROM gd_esquema.Maestra
			WHERE MATERIAL_COD IS NOT NULL
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_migrar_material_x_tarea AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT; 
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].Material_x_Tarea(tarea_id,material_id,cantidad)
			SELECT DISTINCT 
				TAREA_CODIGO,
				[N&M'S].fn_obtener_id_material(MATERIAL_COD),
				COUNT(*)
			FROM gd_esquema.Maestra M1
			WHERE MATERIAL_COD IS NOT NULL AND TAREA_CODIGO IS NOT NULL
			GROUP BY TAREA_CODIGO, MATERIAL_COD
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO
---------------------------------------------------
-- EJECUCIÓN DE STORED PROCEDURES
---------------------------------------------------
PRINT 'Se llevara a cabo la ejecucion de los STORED PROCEDURES' + CHAR(13)
GO

EXEC [N&M'S].sp_migrar_ciudad
EXEC [N&M'S].sp_migrar_recorrido
EXEC [N&M'S].sp_migrar_taller
EXEC [N&M'S].sp_migrar_modelo
EXEC [N&M'S].sp_migrar_marca
EXEC [N&M'S].sp_migrar_camion
EXEC [N&M'S].sp_migrar_chofer
EXEC [N&M'S].sp_migrar_viaje
EXEC [N&M'S].sp_migrar_paquete
EXEC [N&M'S].sp_migrar_paquete_x_viaje;
EXEC [N&M'S].sp_migrar_orden_de_trabajo;
EXEC [N&M'S].sp_migrar_tarea
EXEC [N&M'S].sp_migrar_mecanico
EXEC [N&M'S].sp_migrar_tarea_x_orden
EXEC [N&M'S].sp_migrar_material
EXEC [N&M'S].sp_migrar_material_x_tarea

/*
---------------------------------------------------
-- CREACION DE VISTAS
---------------------------------------------------
PRINT 'Creando VISTAS para la migracion de datos' + CHAR(13)
GO

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

SELECT pxv.paquete_id, cantidad_paquete ,v.*
	FROM [N&M'S].Viaje v
		JOIN [N&M'S].Paquete_x_Viaje pxv ON pxv.nro_viaje = v.nro_viaje
	WHERE camion_id = 23 


CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

7. Costo promedio x rango etario de choferes

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

8. Ganancia por camión (Ingresos  Costo de viaje  Costo de mantenimiento)
	- Ingresos: en función de la cantidad y tipo de paquetes que
	transporta el camión y el recorrido

	- Costo de viaje: costo del chofer + el costo de combustible.
	Tomar precio por lt de combustible $100

	- Costo de mantenimiento: costo de materiales + costo de mano de
	obra

CREATE VIEW [N&M'S].vw_xxx AS SELECT * FROM sys.object
---------------------------------------------------

SELECT * FROM [N&M'S].Ciudad;
SELECT * FROM [N&M'S].Recorrido;
SELECT * FROM [N&M'S].Taller;
SELECT * FROM [N&M'S].Modelo;
SELECT * FROM [N&M'S].Marca;
SELECT * FROM [N&M'S].Viaje;
SELECT * FROM [N&M'S].Camion;
SELECT * FROM [N&M'S].Paquete;
SELECT * FROM [N&M'S].Paquete_x_Viaje
SELECT * FROM [N&M'S].Orden_de_Trabajo
SELECT * FROM [N&M'S].Tarea
SELECT * FROM [N&M'S].Mecanico
SELECT * FROM [N&M'S].Tarea_x_Orden
SELECT * FROM [N&M'S].Material
SELECT * FROM [N&M'S].Material_x_Tarea

*/

-- Se borrara despues
-- Chequear que no queden transacciones abiertas
-- SELECT * FROM sys.sysprocesses WHERE open_tran = 1

BEGIN
	DECLARE @id_test BIT = 1
	IF @id_test = 1
		BEGIN
			PRINT 'Corre todo, pero no se carga nada (schema, tablas, sp, etc...)'
			ROLLBACK TRANSACTION
		END
	ELSE
		BEGIN
			PRINT 'Fin con exito'
			COMMIT TRANSACTION
		END
END
GO