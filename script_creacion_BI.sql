USE [GD2C2021]
GO

--------------------------------------------------- 
-- CHEQUEO DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tiempo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Edad', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Edad
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Camion', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Camion
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Modelo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Modelo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tarea', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tarea
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Taller', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Taller
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Material', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Material
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Orden_de_Trabajo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Orden_de_Trabajo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tiempo_fuera_servicio', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tiempo_fuera_servicio
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Mantenimiento_camiones', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Mantenimiento_camiones
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Desvio_taller_x_tarea', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Desvio_taller_x_tarea
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tareas_x_modelo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tareas_x_modelo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Materiales_x_taller', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Materiales_x_taller
GO

/*
IF OBJECT_ID('[N&M''S].sp_cargar_bi_facturacion_x_cuatrimestre', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_facturacion_x_cuatrimestre
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_costo_x_rango_etario', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_costo_x_rango_etario
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_ganancia_camiones', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_ganancia_camiones
GO
*/
--------------------------------------------------- 
-- CHEQUEO DE FUNCIONES
---------------------------------------------------
IF OBJECT_ID('[N&M''S].fn_obtener_id_tiempo') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_tiempo
GO

IF OBJECT_ID('[N&M''S].fn_obtener_id_rango_edad') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_obtener_id_rango_edad
GO

IF OBJECT_ID('[N&M''S].fn_calcular_costo_mantenimiento') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_costo_mantenimiento
GO

IF OBJECT_ID('[N&M''S].fn_calcular_desvio_tarea_x_taller') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_desvio_tarea_x_taller
GO

--------------------------------------------------- 
-- CHEQUEO DE VISTAS DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].vw_max_tiempo_fuera_de_servicio', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_max_tiempo_fuera_de_servicio
GO

IF OBJECT_ID('[N&M''S].vw_costo_total_mantenimiento_x_camion', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_costo_total_mantenimiento_x_camion
GO

IF OBJECT_ID('[N&M''S].vw_desvio_promedio_tarea_x_taller', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_desvio_promedio_tarea_x_taller
GO

IF OBJECT_ID('[N&M''S].vw_tareas_x_modelo', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_tareas_x_modelo
GO

IF OBJECT_ID('[N&M''S].vw_bi_Materiales_x_taller', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_bi_Materiales_x_taller
GO

/*
IF OBJECT_ID('[N&M''S].vw_bi_facturacion_x_cuatrimestre', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_bi_facturacion_x_cuatrimestre
GO

IF OBJECT_ID('[N&M''S].vw_bi_costo_x_rango_etario', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_bi_Materiales_x_taller
GO

IF OBJECT_ID('[N&M''S].vw_bi_ganancia_camiones', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_bi_Materiales_x_taller
GO
*/

--------------------------------------------------- 
-- CHEQUEO DE TABLAS DEL MODELO BI
---------------------------------------------------
--Tablas de hechos
IF OBJECT_ID('[N&M''S].bi_Tiempo_fuera_servicio', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tiempo_fuera_servicio
GO

IF OBJECT_ID('[N&M''S].bi_Tareas_x_modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tareas_x_modelo
GO

IF OBJECT_ID('[N&M''S].bi_Mantenimiento_camiones', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_mantenimiento_camiones
GO

IF OBJECT_ID('[N&M''S].bi_Desvio_x_taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_desvio_x_taller
GO

IF OBJECT_ID('[N&M''S].bi_Tareas_x_modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tareas_x_modelo
GO

IF OBJECT_ID('[N&M''S].bi_Materiales_x_taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Materiales_x_taller
GO

IF OBJECT_ID('[N&M''S].bi_facturacion_x_cuatrimestre', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_facturacion_x_cuatrimestre
GO

--Tablas de dimension


IF OBJECT_ID('[N&M''S].bi_Tiempo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].bi_Camion', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Camion
GO

IF OBJECT_ID('[N&M''S].bi_Orden_de_Trabajo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Orden_de_Trabajo
GO

IF OBJECT_ID('[N&M''S].bi_Edad', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO

IF OBJECT_ID('[N&M''S].bi_Modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Modelo
GO

IF OBJECT_ID('[N&M''S].bi_Taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Taller
GO

IF OBJECT_ID('[N&M''S].bi_Material', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Material
GO

IF OBJECT_ID('[N&M''S].bi_Tarea', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tarea
GO

IF OBJECT_ID('[N&M''S].bi_Recorrido', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Recorrido
GO

IF OBJECT_ID('[N&M''S].bi_Viaje', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Viaje
GO

IF OBJECT_ID('[N&M''S].bi_Paquete', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Paquete
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

CREATE TABLE [N&M'S].bi_Orden_de_Trabajo (
	nro_orden INT PRIMARY KEY,
	camion_id INT,
	fecha_generada DATETIME2,
	estado NVARCHAR(510),
)

CREATE TABLE [N&M'S].bi_Modelo (
	modelo_id INT PRIMARY KEY,
	descripcion NVARCHAR(510) NOT NULL,
)

CREATE TABLE [N&M'S].bi_Tarea (
	tarea_id INT PRIMARY KEY,
	tipo_tarea NVARCHAR(510),
	nombre NVARCHAR(510),
	tiempo_estimado INT
)

CREATE TABLE [N&M'S].bi_Taller (
	taller_id INT PRIMARY KEY,
	ciudad VARCHAR(510) NOT NULL,
	nombre NVARCHAR(510) NOT NULL,
	direccion NVARCHAR(510),
	telefono DECIMAL(18,0),
	mail NVARCHAR(510)
)

CREATE TABLE [N&M'S].bi_Material (
	material_id INT PRIMARY KEY,
	descripcion NVARCHAR(510),
	precio DECIMAL(18,2)
)

CREATE TABLE [N&M'S].bi_Recorrido (
	recorrido_id INT PRIMARY KEY IDENTITY(1,1),
	ciudad_origen VARCHAR(510), 
	ciudad_destino VARCHAR(510),
	km_recorridos INT,
	precio_recorrido decimal(18,2)
)

CREATE TABLE [N&M'S].bi_Viaje(
	nro_viaje INT PRIMARY KEY,
	camion_id INT,
	chofer_id INT,
	recorrido_id INT,
	fecha_inicio datetime2(7),
	fecha_fin datetime2(7),
	consumo_combustible decimal(18,2)
)

CREATE TABLE [N&M'S].bi_Paquete(
	paquete_id int primary key,
	descripcion varchar(510),
	precio  decimal(18,2)
)

-- TABLAS DE HECHOS
CREATE TABLE [N&M'S].bi_Tiempo_fuera_servicio (
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
	nro_orden INT REFERENCES [N&M'S].bi_Orden_de_Trabajo(nro_orden),
	tiempo_fuera_de_servicio INT NOT NULL,
	PRIMARY KEY (camion_id, tiempo_id, nro_orden)
)

CREATE TABLE [N&M'S].bi_Mantenimiento_camiones (
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
	taller_id INT REFERENCES [N&M'S].bi_taller(taller_id),
	costo_mantenimiento DECIMAL(18,2) NOT NULL
	PRIMARY KEY (camion_id, tiempo_id, taller_id)
)

CREATE TABLE [N&M'S].bi_Desvio_x_taller (
	taller_id INT REFERENCES [N&M'S].bi_taller(taller_id),
	tarea_id INT REFERENCES [N&M'S].bi_tarea(tarea_id),
	desvio DECIMAL(18,2) NOT NULL
	PRIMARY KEY (taller_id, tarea_id, desvio)
)

CREATE TABLE [N&M'S].bi_Tareas_x_modelo (
	modelo_id INT REFERENCES [N&M'S].bi_Modelo(modelo_id),
	tarea_id INT REFERENCES [N&M'S].bi_Tarea(tarea_id),
	cantidad_veces_realizadas INT NOT NULL,
	PRIMARY KEY (modelo_id, tarea_id)
)

CREATE TABLE [N&M'S].bi_Materiales_x_taller (
	taller_id INT REFERENCES [N&M'S].bi_taller(taller_id),
	material_id INT REFERENCES [N&M'S].bi_material(material_id),
	tarea_id INT REFERENCES [N&M'S].bi_tarea(tarea_id),
	cantidad_material_utilizado INT
	PRIMARY KEY (taller_id, material_id, tarea_id)
)

CREATE TABLE [N&M'S].bi_facturacion_x_cuatrimestre(
	recorrido_id INT REFERENCES [N&M'S].bi_Recorrido(recorrido_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
	nro_viaje INT REFERENCES [N&M'S].bi_Viaje(nro_viaje),
	paquete_id INT REFERENCES [N&M'S].bi_Paquete(paquete_id),
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	cantidad_paquetes int,
	facturacion_total decimal(18,2)
)
-- bi para 7° vista ...
-- bi para 8° vista ...
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

/*
	@autors: Grupo 18 - N&M'S
	@desc: xxxxx
	@parameters: xxxxx
	@return: xxxxx
*/
CREATE FUNCTION [N&M'S].fn_calcular_costo_mantenimiento(@camion_id INT, @taller_id INT) RETURNS DECIMAL(18,2) AS
BEGIN
	DECLARE @costo_MO DECIMAL(18,2), @costo_materiales_x_tarea DECIMAL(18,2)

	-- Costo materiales x tarea
	SELECT
		@costo_materiales_x_tarea = SUM(ISNULL(M.precio,0)) -- si dejo solo M.precio da ok, el algoritmo da, aunque x falta de datos en cantidad, siempre da 0
		FROM [N&M'S].Material M
			INNER JOIN [N&M'S].Material_x_Tarea MxT ON M.material_id = MxT.material_id
		WHERE tarea_id IN (SELECT DISTINCT 
								TxO.tarea_id
								FROM [N&M'S].Orden_de_Trabajo OT
									INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden 
								WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id) -- Tareas que se hizo ese camion en ese taller
		GROUP BY tarea_id

	-- Costo MO
	SELECT 
		@costo_MO = SUM((M.costo_x_hora * 8) * TxO.tiempo_ejecucion)  -- costo total de mano de obra x camion, tiempo de ejecucion siempre es 2
		FROM [N&M'S].Orden_de_Trabajo OT
			INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden 
			INNER JOIN [N&M'S].Mecanico M ON m.mecanico_id = TxO.mecanico_id
		WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id -- 1 camion es atendido en un solo taller x varios mecanicos
		GROUP BY OT.camion_id

	RETURN @costo_MO + @costo_materiales_x_tarea
END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: xxxxx
	@parameters: xxxxx
	@return: xxxxx
*/
CREATE FUNCTION [N&M'S].fn_calcular_desvio_tarea_x_taller(@tarea_id INT, @taller_id INT) RETURNS DECIMAL(18,2) AS
BEGIN
	DECLARE @desvio DECIMAL(18,2)

	
	/*
		El desvío se refiere a la diferencia entre la planificación y la ejecución de cada tarea.
		Pueden tomar como desvío la diferencia entre fechas o la diferencia entre tiempos
	*/

	SELECT @desvio = SUM(DATEDIFF(DAY, fecha_inicio_planificada, fecha_inicio_real))
			FROM [N&M'S].Tarea_x_Orden TxO
				INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.nro_orden = TxO.nro_orden 
			WHERE tarea_id = @tarea_id AND taller_id = @taller_id
			GROUP BY taller_id, tarea_id

	IF @desvio IS NULL
		SET @desvio = 0
	
	RETURN @desvio
END
GO

--------------------------------------------------- 
-- CREACION DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------

-- Tablas de dimension

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
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()  
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
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
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
			INSERT INTO [N&M'S].bi_Orden_de_Trabajo (nro_orden,camion_id,fecha_generada,estado)
				SELECT nro_orden, camion_id, fecha_generada, estado FROM [N&M'S].Orden_de_Trabajo
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Modelo AS
	BEGIN
		INSERT INTO [N&M'S].bi_Modelo (modelo_id,descripcion) 
			SELECT modelo_id, descripcion FROM [N&M'S].Modelo
	END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tarea AS
	BEGIN
		INSERT INTO [N&M'S].bi_Tarea (tarea_id, tipo_tarea, nombre, tiempo_estimado)
			SELECT * FROM [N&M'S].Tarea
	END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Taller AS
	BEGIN
		INSERT INTO [N&M'S].bi_Taller (taller_id,ciudad,nombre,direccion,telefono,mail)
			SELECT t.taller_id, c.nombre, t.nombre, t.direccion, t.telefono, t.mail 
				FROM [N&M'S].Taller t
					INNER JOIN [N&M'S].Ciudad C ON t.ciudad_id = c.ciudad_id
	END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Material AS
	BEGIN
		INSERT INTO [N&M'S].bi_Material(material_id,descripcion,precio) SELECT material_id, descripcion, precio FROM [N&M'S].Material
	END
GO


-- Migracion de tablas de hechos

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tiempo_fuera_servicio AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_tiempo_fuera_servicio (camion_id, tiempo_id, nro_orden, tiempo_fuera_de_servicio)
			SELECT DISTINCT
				c.camion_id,
				[N&M'S].fn_obtener_id_tiempo(TxO.fecha_inicio_real),
				OT.nro_orden,
				DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real)
				FROM [N&M'S].Camion C
					INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = C.camion_id
					INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Mantenimiento_camiones AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_Mantenimiento_camiones(camion_id, taller_id, tiempo_id, costo_mantenimiento)
			SELECT OT.camion_id, OT.taller_id,
					[N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
					[N&M'S].fn_calcular_costo_mantenimiento(camion_id,taller_id)
			FROM [N&M'S].Orden_de_Trabajo OT
				INNER JOIN [N&M'S].Tarea_x_Orden TxO ON OT.nro_orden = TxO.nro_orden
			GROUP BY OT.camion_id, OT.taller_id, OT.fecha_generada
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Desvio_taller_x_tarea AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_Desvio_x_taller (taller_id, tarea_id, desvio)
			SELECT DISTINCT 
				OT.taller_id, 
				TxO.tarea_id, 
				[N&M'S].fn_calcular_desvio_tarea_x_taller(OT.taller_id, TxO.tarea_id)
				FROM [N&M'S].Orden_de_Trabajo OT
					INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tareas_x_modelo AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_Tareas_x_modelo (modelo_id,tarea_id,cantidad_veces_realizadas)
			SELECT 
				bm.modelo_id, TxO.tarea_id, COUNT(tarea_id)
			FROM [N&M'S].bi_Camion bc
				INNER JOIN [N&M'S].Modelo bm ON bc.modelo = bm.descripcion
				INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = bc.camion_id
				INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
			GROUP BY bm.modelo_id, TxO.tarea_id
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Materiales_x_taller AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_Materiales_x_taller (taller_id,material_id,tarea_id,cantidad_material_utilizado)
			SELECT ot.taller_id, material_id, t.tarea_id, SUM(ISNULL(MxT.cantidad,0))
				FROM [N&M'S].Orden_de_Trabajo OT 
					INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
					INNER JOIN [N&M'S].Tarea T ON t.tarea_id = TxO.tarea_id
					INNER JOIN [N&M'S].Material_x_Tarea MxT ON MxT.tarea_id = t.tarea_id
				GROUP BY ot.taller_id, material_id, t.tarea_id
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO


CREATE PROCEDURE [N&M'S].sp_cargar_bi_facturacion_x_cuatrimestre AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_facturacion_x_cuatrimestre (recorrido_id,tiempo_id,nro_viaje,paquete_id,camion_id, cantidad_paquete, facturacion_total)
			SELECT r.recorrido_id, t.tiempo_id, v.nro_viaje, p.paquete_id, c.camion_id

	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

/*
CREATE PROCEDURE [N&M'S].sp_cargar_bi_costo_x_rango_etario AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_costo_x_rango_etario (...)
			SELECT ... FROM

	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_ganancia_camiones AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_ganancia_camiones (...)
			SELECT ... FROM

	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE()
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

*/


---------------------------------------------------
-- EJECUCIÓN DE STORED PROCEDURES
---------------------------------------------------
PRINT 'Realizando la migracion del modelo BI' + CHAR(13)
GO

-- EJECUTAR A LO ULTIMO LAS TABLAS DE HECHOS

EXEC [N&M'S].sp_cargar_bi_Tiempo
EXEC [N&M'S].sp_cargar_bi_Edad
EXEC [N&M'S].sp_cargar_bi_Camion
EXEC [N&M'S].sp_cargar_bi_Modelo
EXEC [N&M'S].sp_cargar_bi_Tarea
EXEC [N&M'S].sp_cargar_bi_Taller
EXEC [N&M'S].sp_cargar_bi_Material
EXEC [N&M'S].sp_cargar_bi_Orden_de_Trabajo


-- Tablas de hechos
EXEC [N&M'S].sp_cargar_bi_Tiempo_fuera_servicio
EXEC [N&M'S].sp_cargar_bi_Mantenimiento_camiones
EXEC [N&M'S].sp_cargar_bi_Desvio_taller_x_tarea
EXEC [N&M'S].sp_cargar_bi_Tareas_x_modelo
EXEC [N&M'S].sp_cargar_bi_Materiales_x_taller
EXEC [N&M'S].sp_cargar_bi_facturacion_x_cuatrimestre
-- EXEC [N&M'S].sp_cargar_bi_costo_x_rango_etario
-- EXEC [N&M'S].sp_cargar_bi_ganancia_camiones

GO
--------------------------------------------------- 
-- CREACION DE VISTAS
---------------------------------------------------

CREATE VIEW [N&M'S].vw_max_tiempo_fuera_de_servicio AS
	SELECT bc.camion_id, bt.cuatrimestre, MAX(tiempo_fuera_de_servicio) 'maximo tiempo fuera de servicio'
		FROM [N&M'S].bi_Tiempo_fuera_servicio bf
			INNER JOIN [N&M'S].bi_Tiempo bt ON bt.tiempo_id = bf.tiempo_id
			INNER JOIN [N&M'S].bi_Camion bc ON bc.camion_id = bf.camion_id
		GROUP BY bc.camion_id, bt.cuatrimestre
GO


CREATE VIEW [N&M'S].vw_costo_total_mantenimiento_x_camion AS
	SELECT bc.camion_id, ta.nombre, bt.cuatrimestre, bmc.costo_mantenimiento
		FROM [N&M'S].bi_mantenimiento_camiones bmc
			INNER JOIN [N&M'S].bi_Tiempo bt ON bt.tiempo_id = bmc.tiempo_id
			INNER JOIN [N&M'S].bi_Camion bc ON bc.camion_id = bmc.camion_id
			INNER JOIN [N&M'S].bi_Taller ta ON ta.taller_id = bmc.taller_id
GO

CREATE VIEW [N&M'S].vw_desvio_promedio_tarea_x_taller AS
	SELECT dxt.taller_id, dxt.tarea_id, AVG(dxt.desvio) 'Desvio promedio'
		FROM [N&M'S].bi_Desvio_x_taller dxt
			INNER JOIN [N&M'S].bi_Taller tll ON dxt.taller_id = tll.taller_id
			INNER JOIN [N&M'S].bi_Tarea tr ON dxt.tarea_id = tr.tarea_id
		GROUP BY dxt.taller_id, dxt.tarea_id
GO

CREATE VIEW [N&M'S].vw_tareas_x_modelo AS
	SELECT DISTINCT TOP 5 bm.descripcion 'modelo', bt.nombre 'tarea', btm.cantidad_veces_realizadas
		FROM [N&M'S].bi_Tareas_x_modelo btm
			INNER JOIN [N&M'S].bi_Modelo bm ON bm.modelo_id = btm.modelo_id
			INNER JOIN [N&M'S].bi_Tarea bt ON bt.tarea_id = btm.tarea_id
		ORDER BY cantidad_veces_realizadas DESC
GO

CREATE VIEW [N&M'S].vw_bi_Materiales_x_taller AS
	SELECT bm.descripcion 'material', bt.nombre 'taller', cantidad_material_utilizado
		FROM [N&M'S].bi_Materiales_x_taller bmt
			INNER JOIN [N&M'S].bi_Taller bt ON bt.taller_id = bmt.taller_id
			INNER JOIN [N&M'S].bi_Material bm ON bm.material_id = bmt.material_id
		WHERE bm.material_id IN (SELECT TOP 10 material_id FROM [N&M'S].bi_Materiales_x_taller bmt2 WHERE bmt2.taller_id = bmt.taller_id ORDER BY cantidad_material_utilizado DESC)

-- vista 6° ...
CREATE VIEW [N&M'S].vw_facturacion_x_cuatrimestre AS 
SELECT vi.recorrido_id, bt.cuatrimestre, sum(pqv.cantidad_paquete * pq.precio) FROM bi_facturacion_x_cuatrimestre FC
inner join INNER JOIN [N&M'S].Paquete PQ on pq.paquete_id = fc.paquete_id
inner join INNER JOIN [N&M'S].Paquete_x_Viaje PQV on pqv.paquete_id = fc.paquete_id and pqv.nro_viaje = fc.nro_viaje
inner join INNER JOIN [N&M'S].Viaje VI on vi.nro_viaje = fc.nro_viaje
INNER JOIN [N&M'S].bi_Tiempo bt ON bt.tiempo_id = fc.tiempo_id
group by vi.recorrido_id, bt.cuatrimestre

-- vista 7° ...
-- CREATE VIEW [N&M'S].vw_costo_x_rango_etario AS SELECT * FROM xxx
-- vista 8° ...
-- CREATE VIEW [N&M'S].vw_ganancia_camiones AS SELECT * FROM xxx

GO

/*

-- TABLAS
SELECT * FROM [N&M'S].bi_Tiempo
SELECT * FROM [N&M'S].bi_Edad
SELECT * FROM [N&M'S].bi_Camion
SELECT * FROM [N&M'S].bi_Orden_de_Trabajo
SELECT * FROM [N&M'S].bi_tiempo_fuera_servicio

-- VISTAS

-- 1
SELECT * FROM [N&M'S].vw_max_tiempo_fuera_de_servicio

-- 2
SELECT * FROM [N&M'S].vw_costo_total_mantenimiento_x_camion

-- 3
SELECT * FROM [N&M'S].vw_desvio_promedio_tarea_x_taller

-- 4
SELECT * FROM [N&M'S].vw_tareas_x_modelo

-- 5
SELECT * FROM [N&M'S].vw_bi_Materiales_x_taller

-- 6
SELECT * FROM [N&M'S].vw_facturacion_x_cuatrimestre
-- 7
SELECT * FROM [N&M'S].vw_costo_x_rango_etario
-- 8
SELECT * FROM [N&M'S].vw_ganancia_camiones

*/

-- SELECT @@TRANCOUNT
-- SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'N&M''S'

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

