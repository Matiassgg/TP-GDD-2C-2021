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

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tarea', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tarea
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Modelo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Modelo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Material', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Material
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Taller', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Taller
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Mecanico', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Mecanico
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Chofer', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Chofer
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Recorrido', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Recorrido
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Ordenes_Trabajo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Ordenes_Trabajo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Viajes', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Viajes
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

IF OBJECT_ID('[N&M''S].fn_calcular_facturacion_recorrido') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_facturacion_recorrido
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

IF OBJECT_ID('[N&M''S].fn_calcular_costo_viaje') IS NOT NULL
	DROP FUNCTION [N&M'S].fn_calcular_costo_viaje
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

IF OBJECT_ID('[N&M''S].vw_facturacion_total_por_recorrido_por_cuatrimestre', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_facturacion_total_por_recorrido_por_cuatrimestre
GO

IF OBJECT_ID('[N&M''S].vw_bi_Materiales_x_taller', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_bi_Materiales_x_taller
GO

IF OBJECT_ID('[N&M''S].vw_costo_promedio_x_rango_etario_de_choferes', 'V') IS NOT NULL
	DROP VIEW [N&M'S].vw_costo_promedio_x_rango_etario_de_choferes
GO

IF OBJECT_ID('[N&M''S].vw_ganancia_x_camion', 'V') IS NOT NULL
    DROP VIEW [N&M'S].vw_ganancia_x_camion
GO

--------------------------------------------------- 
-- CHEQUEO DE TABLAS DEL MODELO BI
---------------------------------------------------
-- Tablas de hechos
IF OBJECT_ID('[N&M''S].bi_Ordenes_Trabajo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Ordenes_Trabajo
GO

IF OBJECT_ID('[N&M''S].bi_Viajes', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Viajes
GO

-- Tablas de dimension
IF OBJECT_ID('[N&M''S].bi_Tiempo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].bi_Camion', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Camion
GO

IF OBJECT_ID('[N&M''S].bi_Tarea', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Tarea
GO

IF OBJECT_ID('[N&M''S].bi_Modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Modelo
GO

IF OBJECT_ID('[N&M''S].bi_Material', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Material
GO

IF OBJECT_ID('[N&M''S].bi_Mecanico', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Mecanico
GO

IF OBJECT_ID('[N&M''S].bi_Chofer', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Chofer
GO

IF OBJECT_ID('[N&M''S].bi_Taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Taller
GO

IF OBJECT_ID('[N&M''S].bi_Recorrido', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Recorrido
GO
------------------------------------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('[N&M''S].bi_Viaje', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Viaje
GO

IF OBJECT_ID('[N&M''S].bi_Edad', 'U') IS NOT NULL
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
GO

CREATE TABLE [N&M'S].bi_Edad (
    edad_id INT PRIMARY KEY IDENTITY(1,1),
    rango_edad VARCHAR(510) NOT NULL
)
GO

CREATE TABLE [N&M'S].bi_Camion (
	camion_id INT PRIMARY KEY,
	modelo_id INT NOT NULL,
	marca_id INT NOT NULL,
	patente NVARCHAR(510) NOT NULL
)
GO

CREATE TABLE [N&M'S].bi_Tarea (
	tarea_id INT PRIMARY KEY,
	tipo_tarea NVARCHAR(510),
	nombre NVARCHAR(510),
	tiempo_estimado INT,
)
GO

CREATE TABLE [N&M'S].bi_Modelo (
	modelo_id INT PRIMARY KEY,
	descripcion NVARCHAR(510) NOT NULL
)
GO

CREATE TABLE [N&M'S].bi_Material (
	material_id INT PRIMARY KEY,
	descripcion NVARCHAR(510),
	precio DECIMAL(18,2)
)
GO

CREATE TABLE [N&M'S].bi_Mecanico (
	mecanico_id INT PRIMARY KEY,
	costo_x_hora INT
)
GO


CREATE TABLE [N&M'S].bi_Recorrido (
	recorrido_id INT PRIMARY KEY,
	precio DECIMAL(18,2)
)
GO

CREATE TABLE [N&M'S].bi_Chofer (
	chofer_id INT PRIMARY KEY,
    fecha_nacimiento DATETIME2,
	costo_x_hora INT
)
GO

CREATE TABLE [N&M'S].bi_Taller (
	taller_id INT PRIMARY KEY,
	nombre NVARCHAR(510) NOT NULL
)
GO

-- TABLAS DE HECHOS
CREATE TABLE [N&M'S].bi_Ordenes_Trabajo (
	camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
    tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
    taller_id INT REFERENCES [N&M'S].bi_Taller(taller_id),
    tarea_id INT REFERENCES [N&M'S].bi_Tarea(tarea_id),
    modelo_id INT REFERENCES [N&M'S].bi_Modelo(modelo_id),
	material_id INT REFERENCES [N&M'S].bi_material(material_id),
    mecanico_id INT REFERENCES [N&M'S].bi_mecanico(mecanico_id),
    maximo_tiempo_fuera_servicio INT,
	costo_mantenimiento DECIMAL(18,2),
    desvio DECIMAL(18,2)
	PRIMARY KEY (camion_id,tiempo_id,taller_id,tarea_id,modelo_id,material_id, mecanico_id)
)

GO

CREATE TABLE [N&M'S].bi_Viajes (
    tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
    camion_id INT REFERENCES [N&M'S].bi_Camion(camion_id),
    edad_id INT REFERENCES [N&M'S].bi_Edad(edad_id),
    recorrido_id INT REFERENCES [N&M'S].bi_Recorrido(recorrido_id),
	chofer_id INT REFERENCES [N&M'S].bi_Chofer(chofer_id),
    facturacion_recorrido DECIMAL(18,2),
    costo_viaje DECIMAL(18,2)
	PRIMARY KEY (tiempo_id,camion_id,edad_id,recorrido_id,chofer_id)
)
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

    SELECT @id_tiempo = tiempo_id
    FROM [N&M'S].bi_Tiempo
    WHERE anio = @anio_de_fecha AND cuatrimestre = @cuatrimestre_de_fecha

    RETURN @id_tiempo
END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Funcion que dada una fecha de nacimiento, devuelve el id rango de edad de la persona
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
	@desc: Calcula el costo de mantenimiento de un camion que estuvo en cierto taller
	@parameters: El camion y el taller donde se hizo las reparaciones
	@return: El costo de mantenimiento
*/
CREATE FUNCTION [N&M'S].fn_calcular_costo_mantenimiento(@camion_id INT, @taller_id INT, @fecha DATETIME2, @tarea_id INT, @material_id INT) RETURNS DECIMAL(18,2) AS
BEGIN
    DECLARE @costo_MO DECIMAL(18,2), @costo_materiales_x_tarea DECIMAL(18,2)

    -- Costo materiales x tarea
    SELECT @costo_materiales_x_tarea = SUM(ISNULL(M.precio,0))
    FROM [N&M'S].bi_Material M
        INNER JOIN [N&M'S].Material_x_Tarea MxT ON M.material_id = MxT.material_id
		--INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.tarea_id = MxT.tarea_id
		--INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.nro_orden = TxO.nro_orden
	--WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id AND OT.fecha_generada = @fecha
	WHERE MxT.tarea_id = @tarea_id AND M.material_id = @material_id /*IN (SELECT DISTINCT TxO.tarea_id 
								FROM [N&M'S].Orden_de_Trabajo OT
									INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
								WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id AND OT.fecha_generada = @fecha
								GROUP BY tarea_id)*/

    -- Costo MO
    SELECT @costo_MO = SUM((M.costo_x_hora * 8) * TxO.tiempo_ejecucion)
		FROM [N&M'S].Orden_de_Trabajo OT
			INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
			INNER JOIN [N&M'S].Mecanico M ON m.mecanico_id = TxO.mecanico_id
		WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id AND TxO.tarea_id = @tarea_id
		GROUP BY OT.camion_id

    RETURN @costo_MO + @costo_materiales_x_tarea
END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula la facutrancion de un recorrido en la fechainicio
	@parameters: Recorrido, Camion y fecha en la que se finalizo el recorrido para el camion
	@return: La facturacion del recorrido
*/
CREATE FUNCTION [N&M'S].fn_calcular_facturacion_recorrido(@recorrido_id INT, @camion_id INT, @fechaFin DATETIME2) RETURNS DECIMAL(18,2) AS
BEGIN
    DECLARE @facturacion DECIMAL(18,2)

    SELECT @facturacion = R.precio
		FROM [N&M'S].Viaje V
			INNER JOIN [N&M'S].Recorrido R on R.recorrido_id = V.recorrido_id
		WHERE V.recorrido_id = @recorrido_id and V.camion_id =  @camion_id and V.fecha_fin = @fechaFin

    RETURN @facturacion
END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula el desvio de una tarea para cierto taller
	@parameters: La tarea y el taller donde se realizo la tarea
	@return: El desvio de cierto tarea para un taller
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
	@parameters: Id de la Tarea y id del modelo
	@return: La cantidad de veces que fue realizada la tarea para ese modelo
*/
CREATE FUNCTION [N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo(@modelo_id INT, @tarea_id INT) RETURNS INT AS
	BEGIN
    DECLARE @cantidad INT
    SELECT @cantidad = COUNT(tarea_id)
        FROM [N&M'S].Camion bc
            INNER JOIN [N&M'S].Modelo bm ON bc.modelo_id = bm.modelo_id
            INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = bc.camion_id
            INNER JOIN [N&M'S].Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
        WHERE bm.modelo_id = @modelo_id AND TxO.tarea_id = @tarea_id
        GROUP BY bm.modelo_id, TxO.tarea_id
    RETURN @cantidad
END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula los ingresos para un cierto camion en un recorrido
	@parameters: Id del Camion y id del recorrido 
	@return: Los ingresos obtenidos para un camion
*/

CREATE FUNCTION [N&M'S].fn_calcular_ingresos(@camion_id INT, @recorrido_id INT) RETURNS INT AS
    BEGIN
        DECLARE @ingresos INT
        SELECT @ingresos = SUM(pqv.cantidad_paquete * pq.precio)
            FROM [N&M'S].Paquete PQ
                INNER JOIN  Paquete_x_Viaje PQV on pqv.paquete_id = pq.paquete_id
                INNER JOIN  Viaje VI on vi.nro_viaje = pqv.nro_viaje
            WHERE vi.camion_id = @camion_id and vi.recorrido_id = @recorrido_id
            GROUP BY vi.camion_id, vi.recorrido_id
        RETURN @ingresos
    END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula la cantidad de materiales utilizados en el taller
	@parameters: Taller y material
	@return: Cantidad de materiales utilizados
*/
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

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula el costo de viaje a partir de la cantidad de combustible consumido y del costo del chofer
	@parameters: consumo_combustible y costo_chofer
	@return: Costo de viaje
*/
CREATE FUNCTION [N&M'S].fn_calcular_costo_viaje(@litrosConsumidos DECIMAL(18,2), @costoChofer INT )RETURNS INT AS
    BEGIN
        RETURN @costoChofer + 100*@litrosConsumidos
    END
GO

--------------------------------------------------- 
-- CREACION DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------

-- Tablas de dimension
CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tiempo AS
    BEGIN
        INSERT INTO [N&M'S].bi_Tiempo (anio, cuatrimestre)
            SELECT DISTINCT YEAR(c.fecha_alta), DATEPART(QUARTER, C.fecha_alta)
                FROM [N&M'S].Camion C
            UNION
            SELECT DISTINCT YEAR(ot.fecha_generada), DATEPART(QUARTER, OT.fecha_generada)
                FROM [N&M'S].Orden_de_Trabajo OT
            UNION
            SELECT DISTINCT YEAR(V.fecha_fin), DATEPART(QUARTER, V.fecha_fin)
                FROM [N&M'S].Viaje V
            UNION
            SELECT DISTINCT YEAR(V.fecha_inicio), DATEPART(QUARTER, V.fecha_inicio)
                FROM [N&M'S].Viaje V
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Edad AS
    BEGIN
        INSERT INTO [N&M'S].bi_Edad (rango_edad) VALUES ('18 - 30 años'), ('31 - 50 años'), ('> 50 años')
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Camion AS
    BEGIN
        INSERT INTO [N&M'S].bi_Camion (camion_id,modelo_id,marca_id,patente) SELECT camion_id,modelo_id,marca_id,patente FROM [N&M'S].Camion
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tarea AS
    BEGIN
        INSERT INTO [N&M'S].bi_Tarea (tarea_id,tipo_tarea,nombre,tiempo_estimado) SELECT tarea_id,tipo_tarea,nombre,tiempo_estimado FROM [N&M'S].Tarea
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Modelo AS
    BEGIN
        INSERT INTO [N&M'S].bi_Modelo (modelo_id,descripcion) SELECT modelo_id,descripcion FROM [N&M'S].Modelo
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Material AS
    BEGIN
        INSERT INTO [N&M'S].bi_Material (material_id,descripcion,precio) SELECT material_id,descripcion,precio FROM [N&M'S].Material
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Taller AS
    BEGIN
        INSERT INTO [N&M'S].bi_Taller (taller_id,nombre) SELECT taller_id,nombre FROM [N&M'S].Taller
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Mecanico AS
    BEGIN
        INSERT INTO [N&M'S].bi_Mecanico (mecanico_id,costo_x_hora) SELECT mecanico_id, costo_x_hora FROM [N&M'S].Mecanico
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Chofer AS
    BEGIN
        INSERT INTO [N&M'S].bi_Chofer (chofer_id, fecha_nacimiento, costo_x_hora) SELECT chofer_id, fecha_nacimiento, costo_x_hora FROM [N&M'S].Chofer
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Recorrido AS
    BEGIN
        INSERT INTO [N&M'S].bi_Recorrido (recorrido_id, precio) SELECT recorrido_id, precio FROM [N&M'S].Recorrido
    END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Ordenes_Trabajo AS
    DECLARE @ErrorMessage NVARCHAR(MAX)
    DECLARE @ErrorSeverity INT
    DECLARE @ErrorState INT

    BEGIN TRY
        INSERT INTO [N&M'S].bi_Ordenes_Trabajo(
				camion_id,
				tiempo_id,
				taller_id,
				tarea_id,
				modelo_id,
				material_id,
                mecanico_id,
				maximo_tiempo_fuera_servicio,
				costo_mantenimiento,
				desvio
        )
        SELECT DISTINCT
            OT.camion_id,
            [N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
            OT.taller_id,
            TXO.tarea_id,
            C.modelo_id,
			MXT.material_id,
            TXO.mecanico_id,
            DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real), -- tiempo fuera de servicio
            SUM(ISNULL(MA.precio,0)) + SUM((ME.costo_x_hora * 8) * TxO.tiempo_ejecucion),-- costo mantenimiento
            SUM(DATEDIFF(DAY, TXO.fecha_inicio_planificada, TXO.fecha_inicio_real))-- desvio de tarea
            FROM [N&M'S].Tarea_x_Orden TXO
                INNER JOIN [N&M'S].Orden_de_Trabajo OT ON TXO.nro_orden = OT.nro_orden
                INNER JOIN [N&M'S].Camion C ON C.camion_id = OT.camion_id
				INNER JOIN [N&M'S].Tarea T ON T.tarea_id = TXO.tarea_id
				INNER JOIN [N&M'S].Material_x_Tarea MXT ON MXT.tarea_id = TXO.tarea_id
                INNER JOIN [N&M'S].Material MA ON MA.material_id = MXT.material_id
                INNER JOIN [N&M'S].Mecanico ME ON ME.mecanico_id = TXO.mecanico_id
           GROUP BY 
				OT.camion_id,
				[N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
				OT.taller_id,
				TXO.tarea_id,
				C.modelo_id,
				MXT.material_id,
                TXO.mecanico_id,
                TxO.fecha_inicio_real,
                TxO.fecha_fin_real
    END TRY
    BEGIN CATCH
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
        ROLLBACK TRANSACTION
    END CATCH
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Viajes AS
    DECLARE @ErrorMessage NVARCHAR(MAX)
    DECLARE @ErrorSeverity INT
    DECLARE @ErrorState INT

    BEGIN TRY
        INSERT INTO [N&M'S].bi_Viajes (
            tiempo_id,
            camion_id,
            edad_id,
            recorrido_id,
			chofer_id,
            facturacion_recorrido,
            costo_viaje
        )
        SELECT
            [N&M'S].fn_obtener_id_tiempo(V.fecha_fin),
            C.camion_id,
            [N&M'S].fn_obtener_id_rango_edad(CH.fecha_nacimiento), --CALCULA LA EDAD DEL CHOFER   
            R.recorrido_id,
            CH.chofer_id,
            SUM((PXV.cantidad_paquete * P.precio) + R.precio), -- facturacion
            CH.costo_x_hora*DATEDIFF(HOUR,V.fecha_inicio,V.fecha_fin) + 100*V.consumo_combustible --costo de viaje
            FROM [N&M'S].Viaje V 
                INNER JOIN [N&M'S].Paquete_x_Viaje PXV ON PXV.nro_viaje = V.nro_viaje
                INNER JOIN [N&M'S].Paquete P ON P.paquete_id = PXV.paquete_id
                INNER JOIN [N&M'S].Recorrido R ON R.recorrido_id = V.recorrido_id
                INNER JOIN [N&M'S].Camion C ON C.camion_id = V.camion_id
                INNER JOIN [N&M'S].Chofer CH ON CH.chofer_id = V.chofer_id
            GROUP BY 
                [N&M'S].fn_obtener_id_tiempo(V.fecha_fin),
                C.camion_id,
                [N&M'S].fn_obtener_id_rango_edad(CH.fecha_nacimiento), --CALCULA LA EDAD DEL CHOFER
                R.recorrido_id,
                CH.chofer_id,
                CH.costo_x_hora,
                V.fecha_fin,
                V.fecha_inicio,
                V.consumo_combustible
        END TRY
        BEGIN CATCH
            SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
            RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
            ROLLBACK TRANSACTION
        END CATCH
GO

---------------------------------------------------
-- EJECUCION DE STORED PROCEDURES
---------------------------------------------------
PRINT 'Realizando la migracion del modelo BI' + CHAR(13)
GO

-- Tablas de dimensiones
EXEC [N&M'S].sp_cargar_bi_Tiempo
EXEC [N&M'S].sp_cargar_bi_Edad
EXEC [N&M'S].sp_cargar_bi_Camion
EXEC [N&M'S].sp_cargar_bi_Tarea
EXEC [N&M'S].sp_cargar_bi_Modelo
EXEC [N&M'S].sp_cargar_bi_Material
EXEC [N&M'S].sp_cargar_bi_Taller
EXEC [N&M'S].sp_cargar_bi_Mecanico
EXEC [N&M'S].sp_cargar_bi_Chofer
EXEC [N&M'S].sp_cargar_bi_Recorrido
-- Tablas de hechos
EXEC [N&M'S].sp_cargar_bi_Ordenes_Trabajo
EXEC [N&M'S].sp_cargar_bi_Viajes

GO
--------------------------------------------------- 
-- CREACION DE VISTAS
---------------------------------------------------

--1
CREATE VIEW [N&M'S].vw_max_tiempo_fuera_de_servicio AS
    SELECT BOT.camion_id, TMP.cuatrimestre, MAX(BOT.maximo_tiempo_fuera_servicio) 'Maximo Tiempo Fuera de Servicio'
    FROM [N&M'S].bi_Ordenes_Trabajo BOT
        INNER JOIN [N&M'S].bi_Tiempo TMP on TMP.tiempo_id = BOT.tiempo_id
    GROUP BY BOT.camion_id, TMP.cuatrimestre
GO

-- 2
CREATE VIEW [N&M'S].vw_costo_total_mantenimiento_x_camion AS
	SELECT BOT.camion_id, BOT.taller_id, BT.cuatrimestre, BOT.costo_mantenimiento 
		FROM [N&M'S].bi_Ordenes_Trabajo BOT
			INNER JOIN [N&M'S].bi_Tiempo BT ON BT.tiempo_id = BOT.tiempo_id
		GROUP BY BOT.camion_id, BOT.taller_id, BT.cuatrimestre, BOT.costo_mantenimiento 
GO

-- 3
CREATE VIEW [N&M'S].vw_desvio_promedio_tarea_x_taller AS
    SELECT BOT.taller_id, BOT.tarea_id, AVG(BOT.desvio) 'Desvio Promedio'
        FROM [N&M'S].bi_Ordenes_Trabajo BOT
        GROUP BY BOT.taller_id, BOT.tarea_id
GO

-- 4
CREATE VIEW [N&M'S].vw_tareas_x_modelo AS
    SELECT T.nombre 'Tarea', M.descripcion 'Modelo', COUNT(BOT.tarea_id) 'Cantidad veces realizada'
        FROM [N&M'S].bi_Ordenes_Trabajo BOT
            INNER JOIN [N&M'S].bi_Modelo M ON M.modelo_id = BOT.modelo_id
            INNER JOIN [N&M'S].bi_Tarea T ON T.tarea_id = BOT.tarea_id
        WHERE T.tarea_id IN (SELECT TOP 5 T2.tarea_id 
                                FROM [N&M'S].bi_Ordenes_Trabajo BOT2
                                    INNER JOIN [N&M'S].bi_Modelo M2 ON M2.modelo_id = BOT2.modelo_id
                                    INNER JOIN [N&M'S].bi_Tarea T2 ON T2.tarea_id = BOT2.tarea_id
                                WHERE T2.tarea_id = BOT2.tarea_id
                                GROUP BY M2.modelo_id, T2.tarea_id
                                ORDER BY COUNT(BOT2.tarea_id) DESC)
        GROUP BY M.descripcion, T.nombre
		
GO

-- 5
CREATE VIEW [N&M'S].vw_bi_materiales_x_taller AS
    SELECT BT.nombre, BM.descripcion , COUNT(BOT.material_id) 'Cantidad veces utilizado'
		FROM [N&M'S].bi_Ordenes_Trabajo BOT
            INNER JOIN [N&M'S].bi_Material BM ON BM.material_id = BOT.material_id
            INNER JOIN [N&M'S].bi_Taller BT ON BT.taller_id = BOT.material_id
        WHERE BOT.material_id IN (SELECT TOP 10 BOT2.material_id 
                                    FROM [N&M'S].bi_Ordenes_Trabajo BOT2
                                        INNER JOIN [N&M'S].bi_Material BM2 ON BM2.material_id = BOT2.material_id
                                        INNER JOIN [N&M'S].bi_Taller BT2 ON BT2.taller_id = BOT2.taller_id
									GROUP BY BOT2.material_id
                                    ORDER BY COUNT(BOT2.material_id) DESC)
		GROUP BY BT.nombre, BM.descripcion
GO

-- 6
CREATE VIEW [N&M'S].vw_facturacion_total_por_recorrido_por_cuatrimestre AS
	SELECT BV.recorrido_id, BT.cuatrimestre, SUM(BV.facturacion_recorrido) 'Facturacion' 
        FROM [N&M'S].bi_Viajes BV
		    INNER JOIN [N&M'S].bi_Tiempo BT on BT.tiempo_id = BV.tiempo_id
	    GROUP BY BV.recorrido_id, BT.cuatrimestre
GO

-- 7
/*
CREATE VIEW [N&M'S].vw_costo_promedio_x_rango_etario_de_choferes AS
	SELECT E.rango_edad, AVG(BV.costo_chofer) 'Costo Promedio' 
        FROM [N&M'S].bi_Viajes BV
		    INNER JOIN [N&M'S].bi_Edad E on E.edad_id = BV.edad_id
	    GROUP BY E.rango_edad
GO
*/

-- 8
CREATE VIEW [N&M'S].vw_ganancia_x_camion AS
    SELECT BV.camion_id, (SUM(BV.facturacion_recorrido) - SUM(BV.costo_viaje) - SUM(BOT.costo_mantenimiento)) 'Ganancia'
        FROM [N&M'S].bi_Viajes BV
            INNER JOIN [N&M'S].bi_Ordenes_Trabajo BOT on BOT.camion_id = BV.camion_id
        GROUP BY BV.camion_id
GO

--------------------------------------------------- 
-- SELECCION DE VISTAS
---------------------------------------------------

-- 1

SELECT * FROM [N&M'S].vw_max_tiempo_fuera_de_servicio

-- 2
SELECT * FROM [N&M'S].vw_costo_total_mantenimiento_x_camion

-- 3
SELECT * FROM [N&M'S].vw_desvio_promedio_tarea_x_taller

-- 4
SELECT * FROM [N&M'S].vw_tareas_x_modelo

-- 5
SELECT * FROM [N&M'S].vw_bi_materiales_x_taller

-- 6
SELECT * FROM [N&M'S].vw_facturacion_total_por_recorrido_por_cuatrimestre

-- 7
--SELECT * FROM [N&M'S].vw_costo_promedio_x_rango_etario_de_choferes

-- 8
SELECT * FROM [N&M'S].vw_ganancia_x_camion

--------------------------------------------------- 
-- FIN TRANSACCION
---------------------------------------------------
--SELECT * FROM [N&M'S].bi_Viajes
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

--------------------------------------------------- 
-- FIN
---------------------------------------------------