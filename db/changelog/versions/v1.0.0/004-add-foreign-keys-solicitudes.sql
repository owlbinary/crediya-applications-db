--liquibase formatted sql

--changeset crediya:004-add-foreign-keys-solicitudes
--comment: Agregar claves foráneas para las tablas del módulo de solicitudes

-- Agregar claves foráneas en la tabla solicitud
ALTER TABLE solicitud 
ADD CONSTRAINT fk_solicitud_estado 
FOREIGN KEY (id_estado) REFERENCES estados(id_estado) 
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE solicitud 
ADD CONSTRAINT fk_solicitud_tipo_prestamo 
FOREIGN KEY (id_tipo_prestamo) REFERENCES tipo_prestamo(id_tipo_prestamo) 
ON UPDATE CASCADE ON DELETE RESTRICT;

-- Agregar constraint para validar email
ALTER TABLE solicitud 
ADD CONSTRAINT chk_solicitud_email_format 
CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

--rollback ALTER TABLE solicitud DROP CONSTRAINT IF EXISTS chk_solicitud_email_format;
--rollback ALTER TABLE solicitud DROP CONSTRAINT IF EXISTS fk_solicitud_tipo_prestamo;
--rollback ALTER TABLE solicitud DROP CONSTRAINT IF EXISTS fk_solicitud_estado;
