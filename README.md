# Crediya Applications Database - Liquibase

Versionamiento de base de datos para el microservicio de solicitudes de Crediya usando Liquibase.

## Estructura

```
crediya-applications-db/
├── liquibase.properties
└── db/
    └── changelog/
        ├── db.changelog-master.xml
        └── versions/
            └── v1.0.0/
                ├── 001-create-table-estados.sql
                ├── 002-create-table-tipo-prestamo.sql
                ├── 003-create-table-solicitud.sql
                ├── 004-add-foreign-keys-solicitudes.sql
                ├── 005-insert-initial-estados.sql
                └── 006-insert-initial-tipos-prestamo.sql
```

## Módulo de Solicitudes de Préstamos

### Tablas Principales
- **`estados`**: Estados de las solicitudes (PENDIENTE, EN_REVISION, APROBADO, RECHAZADO)
- **`tipo_prestamo`**: Tipos de préstamos básicos (PERSONAL, VEHICULAR, HIPOTECARIO)
- **`solicitud`**: Solicitudes de préstamos de los usuarios

## Características Implementadas

### Funcionalidad Básica
- ✅ Tablas principales con relaciones
- ✅ Claves foráneas con integridad referencial
- ✅ Validación básica de email
- ✅ Índices esenciales para consultas
- ✅ Datos iniciales mínimos

### Para Ejecutar
```bash
# Validar configuración
liquibase validate

# Ver estado
liquibase status

# Ejecutar migraciones
liquibase update
```

## Uso

```bash
# Actualizar base de datos
liquibase update

# Ver estado
liquibase status

# Validar
liquibase validate
```

## Configuración

Configurar variables de entorno:
```bash
export DB_USERNAME=crediya_user
export DB_PASSWORD=your_password
```
