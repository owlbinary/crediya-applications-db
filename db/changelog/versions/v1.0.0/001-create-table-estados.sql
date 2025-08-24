--liquibase formatted sql

--changeset crediya:001-create-table-estados
--comment: Crear tabla estados para gestionar los estados de las solicitudes

CREATE TABLE estados (
    id_estado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Crear índice para búsquedas por nombre
CREATE INDEX idx_estados_nombre ON estados(nombre);

--rollback DROP TABLE estados CASCADE;
