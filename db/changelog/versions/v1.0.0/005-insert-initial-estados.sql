--liquibase formatted sql

--changeset crediya:005-insert-initial-estados
--comment: Insertar estados iniciales para las solicitudes

INSERT INTO estados (nombre, descripcion) VALUES 
('PENDIENTE_REVISION', 'Solicitud pendiente de revisión'),
('APROBADO', 'Solicitud aprobada'),
('RECHAZADO', 'Solicitud rechazada'),
('REVISION_MANUAL', 'Solicitud en revisión manual');

--rollback DELETE FROM estados WHERE nombre IN ('PENDIENTE', 'EN_REVISION', 'APROBADO', 'RECHAZADO');
