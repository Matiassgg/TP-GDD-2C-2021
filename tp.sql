
USE [GD2C2021];
GO

--------------------------------------------------- 
-- CREACION DE ESQUEMA
---------------------------------------------------
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = "[N&M'S]")
  DROP SCHEMA "[N&M'S]"
GO

CREATE SCHEMA "[N&M'S]"

--------------------------------------------------- 
-- CREACION DE TABLAS
---------------------------------------------------
IF OBJECT_ID("[N&M'S].Ciudad", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Ciudad

IF OBJECT_ID("[N&M'S].Recorrido", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Recorrido

IF OBJECT_ID("[N&M'S].Taller", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Taller

IF OBJECT_ID("[N&M'S].Modelo", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Modelo

IF OBJECT_ID("[N&M'S].Marca", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Marca

IF OBJECT_ID("[N&M'S].Camion", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Camion

IF OBJECT_ID("[N&M'S].Chofer", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Chofer

IF OBJECT_ID("[N&M'S].Viaje", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Viaje

IF OBJECT_ID("[N&M'S].Paquete", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Paquete

IF OBJECT_ID("[N&M'S].Paquete_x_Viaje", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Paquete_x_Viaje
    
IF OBJECT_ID("[N&M'S].Orden_de_Trabajo", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Orden_de_Trabajo

IF OBJECT_ID("[N&M'S].Tarea", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Tarea

IF OBJECT_ID("[N&M'S].Mecanico", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Mecanico

IF OBJECT_ID("[N&M'S].Material", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Material

IF OBJECT_ID("[N&M'S].Material_x_Tarea", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Material_x_Tarea

IF OBJECT_ID("[N&M'S].Tarea_x_Orden", 'U') IS NOT NULL
    DROP TABLE [N&M'S].Tarea_x_Orden

-- Nose si habria que hacerlo onda asi tambien : CREATE TABLE `[N&M'S].Ciudad` (asi con los demas)
CREATE TABLE `Ciudad` (
  `ciudad_id` int,
  `nombre` nvarchar(510),
  PRIMARY KEY (`ciudad_id`)
);


CREATE TABLE `Recorrido` (
  `recorrido_id` int,
  `id_ciudad_origen` int,
  `id_ciudad_destino` int,
  `km_recorridos` int,
  `precio` decimal,
  PRIMARY KEY (`recorrido_id`),
  FOREIGN KEY ( `id_ciudad_origen`) 
  REFERENCES `Ciudad`(`ciudad_id`)
  FOREIGN KEY ( `id_ciudad_destino`) 
  REFERENCES `Ciudad`(`ciudad_id`)     
);


CREATE TABLE `Taller` (
  `taller_id` int,
  `ciudad_id` int,
  `nombre` nvarchar(510),
  `direccion` nvarchar(510),
  `telefono` decimal,
  `mail` nvarchar(510),
  PRIMARY KEY (`taller_id`)
);


CREATE TABLE `Modelo` (
  `modelo_id` int,
  `descripcion` nvarchar(510),
  `velocidad_max` int,
  `capacidad_tanque` int,
  `capacidad_carga` int,
  PRIMARY KEY (`modelo_id`)
);


CREATE TABLE `Marca` (
  `marca_id` int,
  `descripcion` nvarchar(510),
  PRIMARY KEY (`marca_id`)
);


CREATE TABLE `Camion` (
  `camion_id` int,
  `marca_id` int,
  `modelo_id` int,
  `patente` nvarchar(510),
  `nro_chasis` nvarchar(510),
  `nro_motor` nvarchar(510),
  `fecha_alta` datetime2,
  PRIMARY KEY (`camion_id`),
  FOREIGN KEY ( `marca_id`) 
  REFERENCES `Marca`(`marca_id`),
  FOREIGN KEY ( `modelo_id`) 
  REFERENCES `Modelo`(`modelo_id`)
);


CREATE TABLE `Chofer` (
  `chofer_id` int,
  `nombre` nvarchar(510),
  `apellido` nvarchar(510),
  `dni` decimal,
  `direccion` nvarchar(510),
  `telefono` int,
  `mail` nvarchar(510),
  `fecha_nacimiento` datetime2,
  `legajo` int,
  `costo_x_hora` int,
  PRIMARY KEY (`chofer_id`)
);


CREATE TABLE `Viaje` (
  `nro_viaje` int,
  `camion_id` int,
  `chofer_id` int,
  `recorrido_id` int,
  `fecha_inicio` datetime2,
  `fecha_fin` datetime2,
  `consumo_combustible` decimal,
  PRIMARY KEY (`nro_viaje`),
    FOREIGN KEY ( `camion_id`) 
  REFERENCES `Camion`(`camion_id`),
    FOREIGN KEY ( `chofer_id`) 
  REFERENCES `Chofer`(`chofer_id`),
      FOREIGN KEY ( `recorrido_id`) 
  REFERENCES `Recorrido`(`recorrido_id`)
);


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
  FOREIGN KEY ( `nro_viaje`) 
  REFERENCES `Viaje`(`nro_viaje`),
  FOREIGN KEY ( `paquete_id`) 
  REFERENCES `Paquete`(`paquete_id`)
);


CREATE TABLE `Orden_de_Trabajo` (
  `nro_orden` int,
  `camion_id` int,
  `taller_id` int,
  `fecha_generada` datetime2,
  `estado` nvarchar(510),
  PRIMARY KEY (`nro_orden`),
    FOREIGN KEY ( `camion_id`) 
  REFERENCES `Camion`(`camion_id`),
    FOREIGN KEY ( `taller_id`) 
  REFERENCES `Taller`(`taller_id`),
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
    FOREIGN KEY ( `tarea_id`) 
  REFERENCES `Tarea`(`tarea_id`),
    FOREIGN KEY ( `mecanico_id`) 
  REFERENCES `Mecanico`(`mecanico_id`)
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
      FOREIGN KEY ( `tarea_id`) 
  REFERENCES `Tarea`(`tarea_id`),
    FOREIGN KEY ( `material_id`) 
  REFERENCES `Material`(`material_id`)
);

---------------------------------------------------
-- STORED PROCEDURES
---------------------------------------------------

-- Algo asi habria que hacerlo por cada sp
IF OBJECT_ID("[N&M'S].spXXX") IS NOT NULL
    DROP PROCEDURE [N&M'S].Ciudad

-- CREAR SP's para migrar los datos a cada tabla

