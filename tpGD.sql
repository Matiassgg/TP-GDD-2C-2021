USE [GD2C2021]
GO

--------------------------------------------------- 
-- CHEQUEO DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------
IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tiempo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tiempo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Orden_de_Trabajo', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Orden_de_Trabajo
GO

IF OBJECT_ID('[N&M''S].sp_cargar_bi_Tarea_x_Orden', 'P') IS NOT NULL
    DROP PROCEDURE [N&M'S].sp_cargar_bi_Tarea_x_Orden
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

IF OBJECT_ID('[N&M''S].bi_Edad', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Edad
GO

IF OBJECT_ID('[N&M''S].bi_Modelo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Modelo
GO

IF OBJECT_ID('[N&M''S].bi_Materiales_x_taller', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Materiales_x_taller
GO

IF OBJECT_ID('[N&M''S].bi_Orden_de_Trabajo', 'U') IS NOT NULL
	DROP TABLE [N&M'S].bi_Orden_de_Trabajo
GO

IF OBJECT_ID('[N&M''S].Tarea_x_Orden', 'U') IS NOT NULL
	DROP TABLE [N&M'S].Tarea_x_Orden
GO

BEGIN TRANSACTION
--------------------------------------------------- 
-- CREACION DE TABLAS DEL MODELO BI
---------------------------------------------------
-- TABLAS DE DIMENSION
CREATE TABLE [N&M'S].bi_Tiempo
(
    tiempo_id INT PRIMARY KEY IDENTITY(1,1),
    anio INT NOT NULL,
    cuatrimestre INT NOT NULL
)


-- restantes para 2� tablas de hechos
CREATE TABLE [N&M'S].bi_Edad
(
    edad_id INT PRIMARY KEY IDENTITY(1,1),
    rango_edad VARCHAR(510) NOT NULL
)


CREATE TABLE [N&M'S].bi_Orden_de_Trabajo
(
    nro_orden INT PRIMARY KEY,
    camion_id INT,
    taller_id INT,
    fecha_generada DATETIME2,
    estado NVARCHAR(510)

)

CREATE TABLE [N&M'S].bi_Tarea_x_Orden
(
    id_tarea_x_nro_orden INT PRIMARY KEY,
    nro_orden INT,
    tarea_id INT,
    mecanico_id INT,
    fecha_inicio_planificada DATETIME2,
    fecha_inicio_real DATETIME2,
    fecha_fin_real DATETIME2,
    tiempo_ejecucion INT
)


-- TABLAS DE HECHOS
-- 1� tabla de hechos
-- tareas
CREATE TABLE [N&M'S].bi_reparaciones_camiones (
    tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
    nro_orden INT REFERENCES [N&M'S].bi_Orden_de_Trabajo(nro_orden),
    id_tarea_x_nro_orden INT REFERENCES [N&M'S].bi_Tarea_x_Orden(id_tarea_x_nro_orden),
    camion_id INT,
    taller_id INT,
    tarea_id INT,
    modelo_id INT,
    tiempo_fuera_de_servicio INT,
    desvio DECIMAL(18,2),
    tarea_cantidad_veces_realizadas INT,
    PRIMARY KEY (tiempo_id,nro_orden,id_tarea_x_nro_orden)
)
GO

CREATE TABLE [N&M'S].bi_costos_ganancias_camiones
(
    tiempo_id INT REFERENCES [N&M'S].bi_Tiempo(tiempo_id),
    camion_id INT,
    nro_orden INT REFERENCES [N&M'S].bi_Orden_de_Trabajo(nro_orden),
    id_tarea_x_nro_orden INT REFERENCES [N&M'S].bi_Tarea_x_Orden(id_tarea_x_nro_orden),
    edad_id INT REFERENCES [N&M'S].bi_Edad(edad_id),
    nro_viaje int,
    tarea_id INT,
	taller_id INT,
    modelo_id INT,
    recorrido_id INT,
    costo_mantenimiento DECIMAL(18,2),
    costo_chofer DECIMAL(18,2),
    facturacion_recorrido DECIMAL(18,2),
    costo_viaje DECIMAL(18,2),
    ingresos DECIMAL(18,2)
	PRIMARY KEY (tiempo_id,camion_id)
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
				WHEN @edad BETWEEN 18 AND 30 THEN (SELECT edad_id
        FROM [N&M'S].bi_edad
        WHERE rango_edad = '18 - 30 a�os')
				WHEN @edad BETWEEN 31 AND 50 THEN (SELECT edad_id
        FROM [N&M'S].bi_edad
        WHERE rango_edad = '31 - 50 a�os')
				ELSE (SELECT edad_id
        FROM [N&M'S].bi_edad
        WHERE rango_edad = '> 50 a�os')
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
CREATE FUNCTION [N&M'S].fn_calcular_costo_mantenimiento(@camion_id INT, @taller_id INT, @fecha DATETIME2) RETURNS DECIMAL(18,2) AS
BEGIN
    DECLARE @costo_MO DECIMAL(18,2), @costo_materiales_x_tarea DECIMAL(18,2)

    -- Costo materiales x tarea
    SELECT @costo_materiales_x_tarea = SUM(ISNULL(M.precio,0))
    -- si dejo solo M.precio da ok, el algoritmo da, aunque x falta de datos en cantidad, siempre da 0
    FROM [N&M'S].Material M
        INNER JOIN [N&M'S].Material_x_Tarea MxT ON M.material_id = MxT.material_id
    WHERE tarea_id IN (SELECT DISTINCT TxO.tarea_id 
						FROM [N&M'S].Orden_de_Trabajo OT
							INNER JOIN [N&M'S].bi_Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
						WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id AND OT.fecha_generada = @fecha	-- Tareas que se hizo ese camion en ese taller
						GROUP BY tarea_id)

    -- Costo MO
    SELECT @costo_MO = SUM((M.costo_x_hora * 8) * TxO.tiempo_ejecucion)	-- costo total de mano de obra x camion, tiempo de ejecucion siempre es 2
		FROM [N&M'S].Orden_de_Trabajo OT				
			INNER JOIN [N&M'S].bi_Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
			INNER JOIN [N&M'S].Mecanico M ON m.mecanico_id = TxO.mecanico_id
		WHERE OT.camion_id = @camion_id AND OT.taller_id = @taller_id
		GROUP BY OT.camion_id	  -- 1 camion es atendido en un solo taller x varios mecanicos

    RETURN @costo_MO + @costo_materiales_x_tarea
END
GO

/*
	@autors: Grupo 18 - N&M'S
	@desc: Calcula la facutrancion de un recorrido en la fechainicio
	@parameters: Recorrido, el Camion y la fecha
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
	@parameters: xxxxx
	@return: xxxxx
*/
CREATE FUNCTION [N&M'S].fn_calcular_desvio_tarea_x_taller(@tarea_id INT, @taller_id INT) RETURNS DECIMAL(18,2) AS
BEGIN
    DECLARE @desvio DECIMAL(18,2)

    SELECT @desvio = SUM(DATEDIFF(DAY, fecha_inicio_planificada, fecha_inicio_real))
    FROM [N&M'S].bi_Tarea_x_Orden TxO
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
    FROM [N&M'S].Camion bc
        INNER JOIN [N&M'S].Modelo bm ON bc.modelo_id = bm.modelo_id
        INNER JOIN [N&M'S].Orden_de_Trabajo OT ON OT.camion_id = bc.camion_id
        INNER JOIN [N&M'S].bi_Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
    WHERE bm.modelo_id = @modelo_id AND TxO.tarea_id = @tarea_id
    GROUP BY bm.modelo_id, TxO.tarea_id
    RETURN @cantidad
END
GO

CREATE FUNCTION [N&M'S].fn_calcular_ingresos(@camion_id INT, @recorrido_id INT) RETURNS INT AS
	BEGIN
    DECLARE @ingresos INT
    SELECT @ingresos = SUM(pqv.cantidad_paquete * pq.precio)
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
        INNER JOIN [N&M'S].bi_Tarea_x_Orden TxO ON TxO.nro_orden = OT.nro_orden
        INNER JOIN [N&M'S].Tarea T ON t.tarea_id = TxO.tarea_id
        INNER JOIN [N&M'S].Material_x_Tarea MxT ON MxT.tarea_id = t.tarea_id
    GROUP BY ot.taller_id, material_id, t.tarea_id

    RETURN @cantidad
END
GO

CREATE FUNCTION [N&M'S].fn_calcular_costo_viaje(@litrosConsumidos DECIMAL(18,2), @costoChofer INT )RETURNS INT AS
BEGIN
    RETURN @costoChofer + 100*@litrosConsumidos
END
GO


--------------------------------------------------- 
-- CREACION DE STORED PROCEDURES DEL MODELO BI
---------------------------------------------------

-- Tablas de dimension
CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tiempo
AS
BEGIN
    INSERT INTO [N&M'S].bi_Tiempo
        (anio, cuatrimestre)
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

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Edad
AS
BEGIN
    INSERT INTO [N&M'S].bi_Edad
        (rango_edad)
    VALUES
        ('18 - 30 años'),
        ('31 - 50 años'),
        ('> 50 años')
END
GO



CREATE PROCEDURE [N&M'S].sp_cargar_bi_Orden_de_Trabajo
AS
BEGIN

    INSERT INTO [N&M'S].bi_Orden_de_Trabajo
        (nro_orden,camion_id, taller_id, fecha_generada, estado)
    SELECT nro_orden, camion_id, taller_id, fecha_generada, estado
    FROM [N&M'S].Orden_de_Trabajo
END
GO

CREATE PROCEDURE [N&M'S].sp_cargar_bi_Tarea_x_Orden
AS
BEGIN

    INSERT INTO [N&M'S].bi_Tarea_x_Orden
        (id_tarea_x_nro_orden,nro_orden,tarea_id,mecanico_id,fecha_inicio_planificada,fecha_inicio_real,fecha_fin_real,tiempo_ejecucion)
		SELECT 
			id_tarea_x_nro_orden, 
			nro_orden, 
			tarea_id, 
			mecanico_id,
			fecha_inicio_planificada,
			fecha_inicio_real,
			fecha_fin_real, 
			tiempo_ejecucion
			FROM [N&M'S].bi_Tarea_x_Orden
END
GO

-- Migracion de tablas de hechos
-- tareas
CREATE PROCEDURE [N&M'S].sp_migrar_bi_reparaciones_camiones
AS
DECLARE @ErrorMessage NVARCHAR(MAX)
DECLARE @ErrorSeverity INT
DECLARE @ErrorState INT

BEGIN TRY
		INSERT INTO [N&M'S].bi_reparaciones_camiones
    (
    tiempo_id,
    nro_orden,
    id_tarea_x_nro_orden,
    camion_id,
    taller_id,
    tarea_id,
    modelo_id,
    tiempo_fuera_de_servicio,
    desvio,
    tarea_cantidad_veces_realizadas
    )

SELECT
    [N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
    OT.nro_orden,
    TXO.id_tarea_x_nro_orden,
    OT.camion_id,
    OT.taller_id,
    TXO.tarea_id,
    C.modelo_id,
    DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real), -- tiempo fuera de servicio
    [N&M'S].fn_calcular_desvio_tarea_x_taller(OT.taller_id, TxO.tarea_id),-- desvio de tarea para ese taller
    [N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo(c.modelo_id, TXO.tarea_id)-- cantidad de veces realizada la tarea para un modelo
FROM [N&M'S].bi_Orden_de_Trabajo OT
    INNER JOIN [N&M'S].bi_Tarea_x_Orden TXO ON TXO.nro_orden = OT.nro_orden
    INNER JOIN [N&M'S].Camion C ON C.camion_id = OT.camion_id
GROUP BY 
	[N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
    OT.nro_orden,
    TXO.id_tarea_x_nro_orden,
    OT.camion_id,
    OT.taller_id,
    TXO.tarea_id,
    C.modelo_id,
    DATEDIFF(DAY,TxO.fecha_inicio_real,TxO.fecha_fin_real), -- tiempo fuera de servicio
    [N&M'S].fn_calcular_desvio_tarea_x_taller(OT.taller_id, TxO.tarea_id),-- desvio de tarea para ese taller
    [N&M'S].fn_calcular_cantidad_de_veces_tarea_realizada_para_modelo(c.modelo_id, TXO.tarea_id)
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE() 
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
		ROLLBACK TRANSACTION
	END CATCH
GO

-- costos


CREATE PROCEDURE [N&M'S].sp_migrar_bi_costos_ganancias_camiones
AS
DECLARE @ErrorMessage NVARCHAR(MAX)
DECLARE @ErrorSeverity INT
DECLARE @ErrorState INT

BEGIN TRY
	INSERT INTO [N&M'S].bi_costos_ganancias_camiones (
		tiempo_id,
		camion_id,
		nro_orden,
		id_tarea_x_nro_orden,
		edad_id,
		nro_viaje,
		tarea_id,
		taller_id,
		modelo_id,
		recorrido_id,
		costo_mantenimiento,
		costo_chofer,
		facturacion_recorrido,
		costo_viaje,
		ingresos)

SELECT
    [N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
    OT.camion_id,
    OT.nro_orden,
    TXO.id_tarea_x_nro_orden,
    [N&M'S].fn_obtener_id_rango_edad(CH.fecha_nacimiento), --CALCULA LA EDAD DEL CHOFER
    V.nro_viaje,
    OT.taller_id,
    TXO.tarea_id,
    C.modelo_id,
    V.recorrido_id,
    [N&M'S].fn_calcular_costo_mantenimiento(OT.camion_id,OT.taller_id,OT.fecha_generada), --obtengo el gasto de un camion en una taller de una fecha en particular
    CH.costo_x_hora,
    [N&M'S].fn_calcular_facturacion_recorrido(V.recorrido_id, OT.camion_id, V.fecha_fin), --obtengo la facutacion de un recorido en una fecha en particular
    [N&M'S].fn_calcular_costo_viaje(V.consumo_combustible, CH.costo_x_hora),
    [N&M'S].fn_calcular_ingresos(OT.camion_id,V.recorrido_id)
FROM [N&M'S].bi_Orden_de_Trabajo OT
    INNER JOIN [N&M'S].bi_Tarea_x_Orden TXO ON TXO.nro_orden = OT.nro_orden
    INNER JOIN [N&M'S].Camion C ON C.camion_id = OT.camion_id
    INNER JOIN [N&M'S].Viaje V ON V.camion_id = OT.camion_id
    INNER JOIN [N&M'S].Chofer CH ON CH.chofer_id = V.chofer_id
GROUP BY 
	[N&M'S].fn_obtener_id_tiempo(OT.fecha_generada),
    OT.camion_id,
    OT.nro_orden,
    TXO.id_tarea_x_nro_orden,
    [N&M'S].fn_obtener_id_rango_edad(CH.fecha_nacimiento), --CALCULA LA EDAD DEL CHOFER
    V.nro_viaje,
    OT.taller_id,
    TXO.tarea_id,
    C.modelo_id,
	 V.recorrido_id,
    [N&M'S].fn_calcular_costo_mantenimiento(OT.camion_id,OT.taller_id,OT.fecha_generada), --obtengo el gasto de un camion en una taller de una fecha en particular
    CH.costo_x_hora,
    [N&M'S].fn_calcular_facturacion_recorrido(V.recorrido_id, OT.camion_id, V.fecha_fin), --obtengo la facutacion de un recorido en una fecha en particular
    [N&M'S].fn_calcular_costo_viaje(V.consumo_combustible, CH.costo_x_hora),
    [N&M'S].fn_calcular_ingresos(OT.camion_id,V.recorrido_id)
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
EXEC [N&M'S].sp_cargar_bi_Orden_de_Trabajo
EXEC [N&M'S].sp_cargar_bi_Tarea_x_Orden


-- Tablas de hechos
EXEC [N&M'S].sp_migrar_bi_reparaciones_camiones
EXEC [N&M'S].sp_migrar_bi_costos_ganancias_camiones


GO
--------------------------------------------------- 
-- CREACION DE VISTAS
---------------------------------------------------

--1
CREATE VIEW [N&M'S].vw_max_tiempo_fuera_de_servicio
AS
    SELECT rc.camion_id, T.cuatrimestre, MAX(rc.tiempo_fuera_de_servicio) 'maximo tiempo fuera de servicio'
    FROM [N&M'S].bi_reparaciones_camiones RC
        INNER JOIN [N&M'S].bi_Tiempo T on T.tiempo_id = RC.tiempo_id
    GROUP BY RC.camion_id, T.cuatrimestre
GO

--3
CREATE VIEW [N&M'S].vw_desvio_promedio_tarea_x_taller
AS
    SELECT RC.taller_id, RC.tarea_id, AVG(RC.desvio) 'Desvio promedio'
    FROM [N&M'S].bi_reparaciones_camiones RC
    GROUP BY RC.taller_id, RC.tarea_id
GO


--4
CREATE VIEW [N&M'S].vw_tareas_x_modelo AS
    SELECT DISTINCT TOP 5
        M.descripcion 'modelo', T.nombre 'tarea', RC.tarea_cantidad_veces_realizadas
    FROM [N&M'S].bi_reparaciones_camiones RC
        INNER JOIN [N&M'S].Modelo M ON M.modelo_id = RC.modelo_id
        INNER JOIN [N&M'S].Tarea T ON T.tarea_id = RC.tarea_id
    ORDER BY RC.tarea_cantidad_veces_realizadas DESC
GO


--6
CREATE VIEW [N&M'S].vw_facturacion_total_por_recorrido_por_cuatrimestre AS
	select CGC.recorrido_id, T.cuatrimestre, sum(CGC.facturacion_recorrido) 'facturacion' FROM [N&M'S].bi_costos_ganancias_camiones CGC
	INNER JOIN [N&M'S].bi_Tiempo T on T.tiempo_id = CGC.tiempo_id
	GROUP BY CGC.recorrido_id, T.cuatrimestre
GO

--7
CREATE VIEW [N&M'S].costo_promedio_x_rango_etario_de_choferes
AS
	SELECT CGC.edad_id, E.rango_edad,avg(CGC.costo_chofer) 'costo promedio' FROM [N&M'S].bi_costos_ganancias_camiones CGC
		INNER JOIN [N&M'S].bi_Edad E on E.edad_id = CGC.edad_id
	GROUP BY CGC.edad_id, E.rango_edad
GO

/*
CREATE VIEW [N&M'S].vw_costo_total_mantenimiento_x_camion AS
	SELECT bc.camion_id, ta.nombre, bt.cuatrimestre, bmc.costo_mantenimiento
		FROM [N&M'S].bi_mantenimiento_camiones bmc
			INNER JOIN [N&M'S].bi_Tiempo bt ON bt.tiempo_id = bmc.tiempo_id
			INNER JOIN [N&M'S].bi_Camion bc ON bc.camion_id = bmc.camion_id
			INNER JOIN [N&M'S].bi_Taller ta ON ta.taller_id = bmc.taller_id
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
SELECT * FROM [N&M'S].vw_facturacion_total_por_recorrido_por_cuatrimestre
-- 7
-- 8
*/

-- SELECT @@TRANCOUNT
-- SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'N&M''S'

/*SELECT *
FROM [N&M'S].bi_reparaciones_camiones*/

SELECT * FROM [N&M'S].vw_max_tiempo_fuera_de_servicio
SELECT * FROM [N&M'S].vw_desvio_promedio_tarea_x_taller
SELECT * FROM [N&M'S].vw_tareas_x_modelo


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