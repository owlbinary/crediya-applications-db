--liquibase formatted sql

--changeset crediya:007-add-missing-fields-solicitud
--comment: Agregar campos faltantes a la tabla solicitud

-- Agregar campo deuda_total_mensual_solicitudes_aprobadas
ALTER TABLE solicitud 
ADD COLUMN deuda_total_mensual_solicitudes_aprobadas DECIMAL(15,2) NOT NULL DEFAULT 0.00 
CHECK (deuda_total_mensual_solicitudes_aprobadas >= 0);

--rollback ALTER TABLE solicitud DROP COLUMN IF EXISTS deuda_total_mensual_solicitudes_aprobadas;