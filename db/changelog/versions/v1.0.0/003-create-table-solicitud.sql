--liquibase formatted sql

--changeset crediya:003-create-table-solicitud
--comment: Crear tabla solicitud para gestionar las solicitudes de préstamos

CREATE TABLE solicitud (
    id_solicitud SERIAL PRIMARY KEY,
    documento_identidad VARCHAR(20) NOT NULL,  
    monto DECIMAL(15,2) NOT NULL CHECK (monto > 0),
    plazo INTEGER NOT NULL CHECK (plazo > 0),
    email VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    id_tipo_prestamo INTEGER NOT NULL,
    fecha_solicitud TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT
);

-- Crear índices para optimizar búsquedas
CREATE INDEX idx_solicitud_email ON solicitud(email);
CREATE INDEX idx_solicitud_estado ON solicitud(id_estado);
CREATE INDEX idx_solicitud_tipo_prestamo ON solicitud(id_tipo_prestamo);

--rollback DROP TABLE solicitud CASCADE;
