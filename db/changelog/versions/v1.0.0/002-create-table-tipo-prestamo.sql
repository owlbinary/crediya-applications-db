--liquibase formatted sql

--changeset crediya:002-create-table-tipo-prestamo
--comment: Crear tabla tipo_prestamo para gestionar los tipos de préstamos disponibles

CREATE TABLE tipo_prestamo (
    id_tipo_prestamo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    monto_minimo DECIMAL(15,2) NOT NULL CHECK (monto_minimo > 0),
    monto_maximo DECIMAL(15,2) NOT NULL CHECK (monto_maximo > monto_minimo),
    tasa_interes DECIMAL(5,4) NOT NULL CHECK (tasa_interes >= 0),
    validacion_automatica BOOLEAN NOT NULL DEFAULT false,
    activo BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Crear índices para optimizar búsquedas
CREATE INDEX idx_tipo_prestamo_nombre ON tipo_prestamo(nombre);
CREATE INDEX idx_tipo_prestamo_activo ON tipo_prestamo(activo);

--rollback DROP TABLE tipo_prestamo CASCADE;
