USE [GD2C2021]
GO

--------------------------------------------------- 
-- CHEQUEO DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tiempo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_edad', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Edad
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Camion', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Camion
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_edad', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Edad
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Orden_de_Trabajo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Orden_de_Trabajo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_tiempo_fuera_servicio', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_tiempo_fuera_servicio
GO


--------------------------------------------------- 
-- CHEQUEO DE FUNCIONES
---------------------------------------------------
IF OBJECT_ID('[N&M''S].fn_obtener_id_tiempo') IS NOT NULL
	DROP FUNCTION [N&M''S].fn_obtener_id_tiempo
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_rango_edad') IS NOT NULL
	DROP FUNCTION [N&M''S].fn_obtener_id_rango_edad
GO



--------------------------------------------------- 
-- CHEQUEO DE VISTAS DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].vw_xxx', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_xxx
GO

--------------------------------------------------- 
-- CHEQUEO DE TABLAS DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].bi_Tiempo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].bi_Edad', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO

IF OBJECT_ID('[N&M''S].bi_Camion', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO

IF OBJECT_ID('[N&M''S].bi_Orden_de_Trabajo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO

IF OBJECT_ID('[N&M''S].bi_tiempo_fuera_servicio', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO



BEGIN TRANSACTION
--------------------------------------------------- 
-- CREACION DE TABLAS DEL MODELO BI
---------------------------------------------------
-- TABLAS DE DIMENSION
CREATE TABLE [N&M'S].bi_Tiempo (
	tiempo_id INT PRIMARY KEY IDENTITY(1,1),
	anio INT NOT NULL,
	cuatrimestre INT NOT NULL
)

CREATE TABLE [N&M'S].bi_Edad (
	edad_id INT PRIMARY KEY IDENTITY(1,1),
	rango_edad VARCHAR(510) NOT NULL
)

CREATE TABLE [N&M'S].bi_Camion (
	camion_id INT PRIMARY KEY,
	marca NVARCHAR(510) NOT NULL,
	modelo NVARCHAR(510) NOT NULL,
	patente NVARCHAR(510) NOT NULL,
	nro_chasis NVARCHAR(510),
	nro_motor NVARCHAR(510),
	fecha_alta DATETIME2
)

-- Eventualmente si se necesitan mas campos se agregaran? (lo mismo para todas las tablas)
CREATE TABLE [N&M'S].bi_Orden_de_Trabajo (
	nro_orden INT PRIMARY KEY,
	fecha_generada DATETIME2,
	estado NVARCHAR(510),
)

-- TABLAS DE HECHOS
CREATE TABLE [N&M'S].bi_tiempo_fuera_servicio (
	-- Se puede vincular el camion id en el sp para esta tabla si se chequea que ese camion id esta en la tabla de OT (tiene una OT asignada)
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id), -- este es solo el cuatri
	tiempo_fuera_de_servicio INT NOT NULL, -- tiempo en dias, meses, semanas, etc. fuera de servicio (seria en dias creo)
	PRIMARY KEY (camion_id, tiempo_id),
)
GO

---------------------------------------------------
-- CREACION DE FUNCIONES
---------------------------------------------------
/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dada una fecha, devuelve el id correspondiente para los datos de combinados de cuatrimestre-año segun la fecha
	@parameters: Fecha en formato DATETIME2
	@return: El id encontrado de la tabla tiempo
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_tiempo(@fecha DATETIME2) RETURNS INT AS
	BEGIN
		DECLARE @anio_de_fecha INT, @cuatrimestre_de_fecha INT, @id_tiempo INT

		SET @anio_de_fecha = DATEPART(YEAR, @fecha)
		SET @cuatrimestre_de_fecha = DATEPART(QUARTER, @fecha)

		SELECT @id_tiempo = tiempo_id FROM [N&M'S].bi_Tiempo WHERE anio = @anio_de_fecha AND cuatrimestre = @cuatrimestre_de_fecha

		RETURN @id_tiempo
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dada una fecha de nacimiento, devuelve un VARCHAR() informando el rango de edad de la persona
	@parameters: Fecha de nacimiento
	@return: El id segun el rango de edad al que pertenezca esa fecha
*/
CREATE FUNCTION [N&M'S].fn_obtener_id_rango_edad(@fecha DATETIME2) RETURNS INT AS
	BEGIN
		DECLARE @edad_id INT, @edad INT, @fecha_actual DATETIME2

		SELECT @fecha_actual = GETDATE()
		SELECT @edad = (DATEDIFF(DAY, @fecha, @fecha_actual) / 365)

		SELECT @edad_id =
			CASE 
				WHEN @edad BETWEEN 18 AND 30 THEN (SELECT edad_id FROM [N&M'S].bi_edad WHERE rango_edad = '18 - 30 años')
				WHEN @edad BETWEEN 31 AND 50 THEN (SELECT edad_id FROM [N&M'S].bi_edad WHERE rango_edad = '31 - 50 años')
				ELSE (SELECT edad_id FROM [N&M'S].bi_edad WHERE rango_edad = '> 50 años')
			END

		RETURN @edad_id
	END
GO

--------------------------------------------------- 
-- CREACION DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------
CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tiempo AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].bi_Tiempo (anio, cuatrimestre)
				SELECT DISTINCT YEAR(c.fecha_alta), DATEPART(QUARTER, C.fecha_alta) FROM [N&M'S].Camion C
					UNION
				SELECT DISTINCT YEAR(ot.fecha_generada), DATEPART(QUARTER, OT.fecha_generada) FROM [N&M'S].Orden_de_Trabajo OT
					UNION
				SELECT DISTINCT YEAR(V.fecha_fin), DATEPART(QUARTER, V.fecha_fin) FROM [N&M'S].Viaje V
					UNION
				SELECT DISTINCT YEAR(V.fecha_inicio), DATEPART(QUARTER, V.fecha_inicio) FROM [N&M'S].Viaje V
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Edad AS
	BEGIN
		INSERT INTO [N&M'S].bi_Edad (rango_edad) VALUES ('18 - 30 años'), ('31 - 50 años'), ('> 50 años')
	END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Camion AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO [N&M'S].bi_Camion (camion_id,marca,modelo,patente,nro_chasis,nro_motor,fecha_alta)
				SELECT DISTINCT camion_id, ma.descripcion, md.descripcion, patente, nro_chasis, nro_motor, fecha_alta
					FROM [N&M'S].Camion C
						INNER JOIN [N&M'S].Marca MA ON ma.marca_id = c.marca_id
						INNER JOIN [N&M'S].Modelo MD ON md.modelo_id = c.modelo_id
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Orden_de_Trabajo AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		BEGIN TRANSACTION
			
			INSERT INTO [N&M'S].bi_Orden_de_Trabajo (nro_orden,fecha_generada,estado)
				SELECT DISTINCT nro_orden, fecha_generada, estado FROM [N&M'S].Orden_de_Trabajo

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

-- (REVISAR) 
CREATE PROCEDURE [N&M'S].sp_cargar_bi_tiempo_fuera_servicio AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY

		INSERT INTO [N&M'S].bi_tiempo_fuera_servicio (camion_id, tiempo_id, tiempo_fuera_de_servicio)

			SELECT DISTINCT
				c.camion_id,
				[N&M'S].fn_obtener_id_tiempo(TxO.fecha_inicio_real), -- asumo que la tareas no tardan en completarse en mas de un cuatrimestre
				-- TIEMPO FUERA DE SERVICIO DE ESE CAMION CON ESA OT EN UN CUATRI ???? (SERA? ni idea)
				DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real) -- usar tiempo_ejecucion??? (siempre da 2)
				FROM [N&M'S].Camion C
					INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = C.camion_id
					INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
				-- "y no se encuentra disponible para un viaje." Como afecta ?
/*
			select C.camion_id, fecha_alta, fecha_generada FROM [N&M'S].Camion C
					INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = c.camion_id
				order by 1, 2

			SELECT * FROM [N&M'S].Tarea_x_Orden WHERE nro_orden = 1
			SELECT id_tarea_x_nro_orden, nro_orden, tarea_id, mecanico_id, (SELECT TOP 1 TxO.fecha_fin_real FROM [N&M'S].Tarea_x_Orden TxO WHERE TxO.nro_orden = 1 ORDER BY TxO.fecha_fin_real DESC)
				FROM [N&M'S].Tarea_x_Orden 
				WHERE nro_orden = 1 
				GROUP BY id_tarea_x_nro_orden, nro_orden, tarea_id, mecanico_id
*/
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();  
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

---------------------------------------------------
-- EJECUCIÓN DE STORED PROCEDURES
---------------------------------------------------
PRINT 'Realizando la migracion del modelo BI' + CHAR(13)
GO

-- EJECUTAR A LO ULTIMO LAS TABLAS DE HECHOS

EXEC [N&M'S].sp_cargar_bi_Tiempo
EXEC [N&M'S].sp_cargar_bi_Edad
EXEC [N&M'S].sp_cargar_bi_Camion
EXEC [N&M'S].sp_cargar_bi_Orden_de_Trabajo
EXEC [N&M'S].sp_cargar_bi_tiempo_fuera_servicio
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX
-- EXEC [N&M'S].sp_cargar_bi_XXXXXXXXXXX

/*

SELECT * FROM [N&M'S].bi_Tiempo
SELECT * FROM [N&M'S].bi_Edad
SELECT * FROM [N&M'S].bi_Camion
SELECT * FROM [N&M'S].bi_Orden_de_Trabajo
SELECT * FROM [N&M'S].bi_tiempo_fuera_servicio

*/

SELECT * FROM [N&M'S].bi_tiempo_fuera_servicio

--SELECT @@TRANCOUNT

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

