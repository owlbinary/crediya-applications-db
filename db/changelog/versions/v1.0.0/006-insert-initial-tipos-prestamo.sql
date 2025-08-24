--liquibase formatted sql

--changeset crediya:006-insert-initial-tipos-prestamo
--comment: Insertar tipos de préstamo iniciales

INSERT INTO tipo_prestamo (nombre, monto_minimo, monto_maximo, tasa_interes, validacion_automatica) VALUES 
('PERSONAL', 500000.00, 50000000.00, 0.1800, true),
('VEHICULAR', 5000000.00, 150000000.00, 0.1500, false),
('HIPOTECARIO', 20000000.00, 800000000.00, 0.1200, false);

--rollback DELETE FROM tipo_prestamo WHERE nombre IN ('PERSONAL', 'VEHICULAR', 'HIPOTECARIO');
