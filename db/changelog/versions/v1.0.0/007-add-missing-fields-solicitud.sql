--liquibase formatted sql

--changeset crediya:007-add-missing-fields-solicitud
--comment: Agregar campos faltantes a la tabla solicitud

-- Agregar campo nombre
ALTER TABLE solicitud 
ADD COLUMN nombre VARCHAR(255) NOT NULL DEFAULT '';

-- Agregar campo tasa_interes
ALTER TABLE solicitud 
ADD COLUMN tasa_interes DECIMAL(5,4) NOT NULL DEFAULT 0.0000 
CHECK (tasa_interes >= 0 AND tasa_interes <= 1);

-- Agregar campo estado_solicitud como texto adicional al id_estado
ALTER TABLE solicitud 
ADD COLUMN estado_solicitud VARCHAR(100);

-- Agregar campo salario_base
ALTER TABLE solicitud 
ADD COLUMN salario_base DECIMAL(15,2) NOT NULL DEFAULT 0.00 
CHECK (salario_base >= 0);

-- Agregar campo deuda_total_mensual_solicitudes_aprobadas
ALTER TABLE solicitud 
ADD COLUMN deuda_total_mensual_solicitudes_aprobadas DECIMAL(15,2) NOT NULL DEFAULT 0.00 
CHECK (deuda_total_mensual_solicitudes_aprobadas >= 0);

-- Agregar campo validacion_automatica
ALTER TABLE solicitud 
ADD COLUMN validacion_automatica BOOLEAN NOT NULL DEFAULT FALSE;

-- Crear índices para optimizar búsquedas en los nuevos campos
CREATE INDEX idx_solicitud_nombre ON solicitud(nombre);
CREATE INDEX idx_solicitud_salario_base ON solicitud(salario_base);
CREATE INDEX idx_solicitud_validacion_automatica ON solicitud(validacion_automatica);

--rollback ALTER TABLE solicitud DROP COLUMN IF EXISTS nombre, DROP COLUMN IF EXISTS tasa_interes, DROP COLUMN IF EXISTS estado_solicitud, DROP COLUMN IF EXISTS salario_base, DROP COLUMN IF EXISTS deuda_total_mensual_solicitudes_aprobadas, DROP COLUMN IF EXISTS validacion_automatica;
