USE [GD2C2021]
GO

--------------------------------------------------- 
-- CHEQUEO DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tiempo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tiempo
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

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Edad', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Edad
GO

IF OBJECT_ID('[N&M''S].sp_migrar_bi_reparaciones_camiones', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_bi_reparaciones_camiones
GO

IF OBJECT_ID('[N&M''S].sp_migrar_bi_costos_ganancias_camiones', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_migrar_bi_costos_ganancias_camiones
GO

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

IF OBJECT_ID('[N&M''S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo
GO

IF OBJECT_ID('[N&M''S].fn_calcular_ingresos') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_ingresos
GO

IF OBJECT_ID('[N&M''S].fn_calcular_cantidad_de_materiales_utilizados_en_taller') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_cantidad_de_materiales_utilizados_en_taller
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

-- 6� vista ...
-- 7� vista ...
-- 8� vista ...

--------------------------------------------------- 
-- CHEQUEO DE TABLAS DEL MODELO BI
---------------------------------------------------
-- Tablas de hechos
IF OBJECT_ID('[N&M''S].bi_reparaciones_camiones', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_reparaciones_camiones
GO

IF OBJECT_ID('[N&M''S].bi_costos_ganancias_camiones', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_costos_ganancias_camiones
GO

-- Tablas de dimension
IF OBJECT_ID('[N&M''S].bi_Tiempo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].bi_Camion', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Camion
GO

IF OBJECT_ID('[N&M''S].bi_Edad', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO

IF OBJECT_ID('[N&M''S].bi_Modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Modelo
GO

IF OBJECT_ID('[N&M''S].bi_Materiales_x_taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Materiales_x_taller
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

IF OBJECT_ID('[N&M''S].bi_Chofer', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Chofer
GO

IF OBJECT_ID('[N&M''S].bi_Recorrido', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Recorrido
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

CREATE TABLE [N&M'S].bi_Camion (
	camion_id INT PRIMARY KEY,
	marca NVARCHAR(510) NOT NULL,
	modelo NVARCHAR(510) NOT NULL,
	patente NVARCHAR(510) NOT NULL,
	nro_chasis NVARCHAR(510),
	nro_motor NVARCHAR(510),
	fecha_alta DATETIME2
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

-- restantes para 2� tablas de hechos
CREATE TABLE [N&M'S].bi_Edad (
	edad_id INT PRIMARY KEY IDENTITY(1,1),
	rango_edad VARCHAR(510) NOT NULL
)

CREATE TABLE [N&M'S].bi_Recorrido (
	recorrido_id INT PRIMARY KEY IDENTITY(1,1),
	ciudad_origen VARCHAR(510), 
	ciudad_destino VARCHAR(510),
	km_recorridos INT,
	precio_recorrido decimal(18,2)
)

CREATE TABLE [N&M'S].bi_Chofer (
	chofer_id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(510),
	apellido VARCHAR(510),
	dni DECIMAL(18,0),
	direccion VARCHAR(510),
	telefono INT,
	mal VARCHAR(510),
	fecha_nacimiento DATETIME2(7),
	legajo INT,
	costo_x_hora INT
)


-- TABLAS DE HECHOS
-- 1� tabla de hechos
CREATE TABLE [N&M'S].bi_reparaciones_camiones (
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
	taller_id INT REFERENCES [N&M'S].bi_Taller(taller_id),
	tarea_id INT REFERENCES [N&M'S].bi_Tarea(tarea_id),
	modelo_id INT REFERENCES [N&M'S].bi_Modelo(modelo_id),
	material_id INT REFERENCES [N&M'S].bi_Material(material_id),
	tiempo_fuera_de_servicio INT NOT NULL,
	desvio DECIMAL(18,2) NOT NULL,
	tarea_cantidad_veces_realizadas INT NOT NULL,
	cantidad_material_utilizado INT NOT NULL,
	costo_mantenimiento INT NOT NULL,
	PRIMARY KEY (camion_id,tiempo_id,taller_id,tarea_id,modelo_id,material_id)
)

/*CREATE TABLE [N&M'S].bi_reparaciones_camiones (
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
	taller_id INT REFERENCES [N&M'S].bi_Taller(taller_id),
	recorrido_id INT REFERENCES [N&M'S].bi_Recorido(tarea_id),
	chofer_id INT REFERENCES [N&M'S].bi_Chofer(modelo_id),
	edad_id INT REFERENCES [N&M'S].bi_Edad(material_id),
	costo_matenimiento DECIMAL(18,2) NOT NULL,
	costo_chofer DECIMAL(18,2) NOT NULL,
	ingresos DECIMAL(18,2) NOT NULL,
	costo_viaje DECIMAL(18,2) NOT NULL,
	ganancias DECIMAL(18,2) NOT NULL,
	PRIMARY KEY (camion_id,tiempo_id,taller_id,tarea_id,recorrido_id,chofer_id)
)*/

-- cantidad de reparaciones
-- dias reparados

-- Dividido cantidad de dias del cuatrimestre

-- tiempo contra promedio / Count(*)
-- desvio = hacer subselect que calcule el promedio para tener el desvio promedio pre-calculado
-- desvio promedio x taller x tarea (de forma especifica)

-- menor detalle en la tabla de hechos marca la tabla de hechos


-- 2� tabla de hechos
/*CREATE TABLE [N&M'S].bi_costos_ganancias_camiones (
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
	tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
	taller_id INT REFERENCES [N&M'S].bi_Taller(taller_id),
	tiempo_fuera_de_servicio INT NOT NULL,
	PRIMARY KEY (camion_id, tiempo_id, nro_orden)
)*/
/*
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
)*/

GO

---------------------------------------------------
-- CREACION DE FUNCIONES
---------------------------------------------------

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dada una fecha, devuelve el id correspondiente para los datos de combinados de cuatrimestre-a�o segun la fecha
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
				WHEN @edad BETWEEN 18 AND 30 THEN (SELECT edad_id FROM [N&M'S].bi_edad WHERE rango_edad = '18 - 30 a�os')
				WHEN @edad BETWEEN 31 AND 50 THEN (SELECT edad_id FROM [N&M'S].bi_edad WHERE rango_edad = '31 - 50 a�os')
				ELSE (SELECT edad_id FROM [N&M'S].bi_edad WHERE rango_edad = '> 50 a�os')
			END

		RETURN @edad_id
	END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula el costo de mantenimiento de un camion que estuvo en cierto taller
	@parameters: El camion y el taller donde se hizo las reparaciones
	@return: El costo de mantenimiento
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
	@desc: Calcula el desvio de una tarea para cierto taller
	@parameters: xxxxx
	@return: xxxxx
*/
CREATE FUNCTION [N&M'S].fn_calcular_desvio_tarea_x_taller(@tarea_id INT, @taller_id INT) RETURNS DECIMAL(18,2) AS
BEGIN
	DECLARE @desvio DECIMAL(18,2)

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

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula la cantidad de veces que una tarea fue hecha en cierto modelo
	@parameters: Tarea y modelo
	@return: La cantidad de veces que fue realizada la tarea para ese modelo
*/
CREATE FUNCTION [N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo(@modelo_id INT, @tarea_id INT) RETURNS INT AS
	BEGIN
		DECLARE @cantidad INT
			SELECT @cantidad = COUNT(tarea_id)
				FROM [N&M'S].bi_Camion bc
					INNER JOIN [N&M'S].Modelo bm ON bc.modelo = bm.descripcion
					INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = bc.camion_id
					INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
				WHERE bm.modelo_id = @modelo_id AND TxO.tarea_id = @tarea_id
				GROUP BY bm.modelo_id, TxO.tarea_id
		RETURN @cantidad
	END
GO

CREATE FUNCTION [N&M'S].fn_calcular_ingresos(@camion_id INT, @recorrido_id INT) RETURNS INT AS
	BEGIN
		DECLARE @ingresos INT
			SELECT @ingresos = SUM(cantidad_paquete * pq.precio)
				FROM [N&M'S].Paquete PQ				
				inner join Paquete_x_Viaje PQV on pqv.paquete_id = pq.paquete_id
				inner join Viaje VI on vi.nro_viaje = pqv.nro_viaje 	
				where vi.camion_id = @camion_id and vi.recorrido_id = @recorrido_id
				GROUP BY vi.camion_id, vi.recorrido_id
		RETURN @ingresos
	END
GO

CREATE FUNCTION [N&M'S].fn_calcular_cantidad_de_materiales_utilizados_en_taller(@taller_id INT, @material_id INT) RETURNS INT AS
	BEGIN
		DECLARE @cantidad INT
		
			SELECT @cantidad = SUM(ISNULL(MxT.cantidad,0))
				FROM [N&M'S].Orden_de_Trabajo OT 
					INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
					INNER JOIN [N&M'S].Tarea T ON t.tarea_id = TxO.tarea_id
					INNER JOIN [N&M'S].Material_x_Tarea MxT ON MxT.tarea_id = t.tarea_id
				GROUP BY ot.taller_id, material_id, t.tarea_id
		
		RETURN @cantidad
	END
GO

/*CREATE FUNCTION [N&M'S].fn_calcular_ingresos(@camion_id INT, @recorrido_id INT) RETURNS INT AS
	BEGIN
		DECLARE @ingresos INT
			SELECT @ingresos = SUM(pqv.cantidad_paquete * pq.precio)
				FROM [N&M'S].Paquete PQ				
				inner join [N&M'S].Paquete_x_Viaje PQV on pqv.paquete_id = pq.paquete_id
				inner join [N&M'S].Viaje VI on vi.nro_viaje = pqv.nro_viaje 	
				where vi.camion_id = @camion_id and vi.recorrido_id = @recorrido_id
				GROUP BY vi.camion_id, vi.recorrido_id
		RETURN @ingresos
	END
GO*/

--------------------------------------------------- 
-- CREACION DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------

-- Tablas de dimension
CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tiempo AS
	BEGIN
		INSERT INTO [N&M'S].bi_Tiempo (anio, cuatrimestre)
			SELECT DISTINCT YEAR(c.fecha_alta), DATEPART(QUARTER, C.fecha_alta) FROM [N&M'S].Camion C
				UNION
			SELECT DISTINCT YEAR(ot.fecha_generada), DATEPART(QUARTER, OT.fecha_generada) FROM [N&M'S].Orden_de_Trabajo OT
				UNION
			SELECT DISTINCT YEAR(V.fecha_fin), DATEPART(QUARTER, V.fecha_fin) FROM [N&M'S].Viaje V
				UNION
			SELECT DISTINCT YEAR(V.fecha_inicio), DATEPART(QUARTER, V.fecha_inicio) FROM [N&M'S].Viaje V
	END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Edad AS
	BEGIN
		INSERT INTO [N&M'S].bi_Edad (rango_edad) VALUES ('18 - 30 años'), ('31 - 50 años'), ('> 50 años')
	END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Camion AS
	BEGIN
		INSERT INTO [N&M'S].bi_Camion (camion_id,marca,modelo,patente,nro_chasis,nro_motor,fecha_alta)
			SELECT DISTINCT camion_id, ma.descripcion, md.descripcion, patente, nro_chasis, nro_motor, fecha_alta
				FROM [N&M'S].Camion C
					INNER JOIN [N&M'S].Marca MA ON ma.marca_id = c.marca_id
					INNER JOIN [N&M'S].Modelo MD ON md.modelo_id = c.modelo_id
	END
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
CREATE PROCEDURE [N&M'S].sp_migrar_bi_reparaciones_camiones AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_reparaciones_camiones
			(camion_id,tiempo_id,taller_id,tarea_id,modelo_id,material_id,tiempo_fuera_de_servicio,desvio,tarea_cantidad_veces_realizadas,cantidad_material_utilizado,costo_mantenimiento)
			SELECT 
				COUNT(*)
				--C.camion_id,
				--[N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
				--OT.taller_id,
				--TXO.tarea_id,
				--MO.modelo_id,
				--MXT.material_id,
				--DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real), -- tiempo fuera de servicio
				--[N&M'S].fn_calcular_desvio_tarea_x_taller(OT.taller_id, TxO.tarea_id),1,1,1 -- desvio de tarea para ese taller
				--[N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo(MO.modelo_id, TXO.tarea_id), -- cantidad de veces realizada la tarea para un modelo
				--[N&M'S].fn_calcular_cantidad_de_materiales_utilizados_en_taller(OT.taller_id, MXT.material_id), -- cantidad material utilizado en ese taller
				--[N&M'S].fn_calcular_costo_mantenimiento(C.camion_id, OT.taller_id) -- costo de mantenimiento de camion en cierto taller
				FROM [N&M'S].Camion C
					INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = C.camion_id
					INNER JOIN [N&M'S].Modelo MO ON MO.modelo_id = C.modelo_id
					INNER JOIN [N&M'S].Tarea_x_Orden TXO ON TXO.nro_orden = OT.nro_orden
					INNER JOIN [N&M'S].Material_x_Tarea MXT ON MXT.tarea_id = TXO.tarea_id
				--GROUP BY 
					--C.camion_id,
					--[N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
					--OT.taller_id,
					--TXO.tarea_id,
					--MO.modelo_id,
					--MXT.material_id,
					--DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real),
					--[N&M'S].fn_calcular_desvio_tarea_x_taller(OT.taller_id, TxO.tarea_id)
					----[N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo(MO.modelo_id, TXO.tarea_id),
					----[N&M'S].fn_calcular_cantidad_de_materiales_utilizados_en_taller(OT.taller_id, MXT.material_id),
					----[N&M'S].fn_calcular_costo_mantenimiento(C.camion_id, OT.taller_id)
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

/*CREATE PROCEDURE [N&M'S].sp_migrar_bi_costos_ganancias_camiones AS
	DECLARE @ErrorMessage NVARCHAR(MAX)
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT

	BEGIN TRY
		INSERT INTO [N&M'S].bi_costos_ganancias_camiones
			(camion_id, tiempo_id, taller_id, recorrido_id, chofer_id, edad_id, nro_viaje, costo_material, costo_mantenimiento, facturacion_total, costo_chofer, ingresos, costo_viaje)
			SELECT
				C.camion_id,
				[N&M'S].fn_obtener_id_tiempo(),
				T.taller_id,
				
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO*/

/*
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
GO*/
---------------------------------------------------
-- EJECUCION DE STORED PROCEDURES
---------------------------------------------------
PRINT 'Realizando la migracion del modelo BI' + CHAR(13)
GO

-- Tablas de dimensiones
EXEC [N&M'S].sp_cargar_bi_Tiempo
EXEC [N&M'S].sp_cargar_bi_Edad
EXEC [N&M'S].sp_cargar_bi_Camion
EXEC [N&M'S].sp_cargar_bi_Modelo
EXEC [N&M'S].sp_cargar_bi_Tarea
EXEC [N&M'S].sp_cargar_bi_Taller
EXEC [N&M'S].sp_cargar_bi_Material
-- EXEC [N&M'S].sp_cargar_bi_Recorrido
-- EXEC [N&M'S].sp_cargar_bi_Chofer

-- Tablas de hechos
-- EXEC [N&M'S].sp_migrar_bi_reparaciones_camiones
-- EXEC [N&M'S].sp_migrar_bi_costos_ganancias_camiones

GO
--------------------------------------------------- 
-- CREACION DE VISTAS
---------------------------------------------------
/*
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

-- vista 6 ...
-- vista 7 ...
-- vista 8 ...

GO*/

/*

-- TABLAS

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
-- 7
-- 8

*/

-- SELECT @@TRANCOUNT
-- SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'N&M''S'

SELECT * FROM [N&M'S].bi_reparaciones_camiones

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

