-- ==========================================
-- TABLAS PRINCIPALES
-- ==========================================

CREATE TABLE areas (
    idArea SERIAL PRIMARY KEY,
    area VARCHAR(100) NOT NULL
);

CREATE TABLE personas (
    idPersona SERIAL PRIMARY KEY,
    idArea INTEGER REFERENCES areas(idArea),
    nombre VARCHAR(100),
    apellidos VARCHAR(150),
    dni VARCHAR(20),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE cuentas (
    idCuenta SERIAL PRIMARY KEY,
    idPersona INTEGER REFERENCES personas(idPersona),
    user_name VARCHAR(100) UNIQUE NOT NULL,
    pass VARCHAR(255) NOT NULL
);

-- ==========================================
-- CATÁLOGOS
-- ==========================================

CREATE TABLE categorias (
    idCategoria SERIAL PRIMARY KEY,
    categoria VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE subcategorias_incidencia (
    idSubCategoria SERIAL PRIMARY KEY,
    subCategoria VARCHAR(100)
);

CREATE TABLE categorias_incidencia (
    idCategoria SERIAL PRIMARY KEY,
    categoria VARCHAR(100)
);

CREATE TABLE marcas (
    idMarca SERIAL PRIMARY KEY,
    marca VARCHAR(100)
);

CREATE TABLE modelos (
    idModelo SERIAL PRIMARY KEY,
    idMarca INTEGER REFERENCES marcas(idMarca),
    modelo VARCHAR(100)
);

CREATE TABLE proveedores (
    idProveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(150),
    celular VARCHAR(20),
    correo VARCHAR(150),
    contacto VARCHAR(150)
);

-- ==========================================
-- ACTIVOS
-- ==========================================

CREATE TABLE activos (
    uuidActivo UUID PRIMARY KEY,
    idCategoria INTEGER REFERENCES categorias(idCategoria),
    fechaRegistro DATE,
    nombre VARCHAR(150),
    idProveedor INTEGER REFERENCES proveedores(idProveedor),
    fechaAdquisicion DATE
);

CREATE TABLE activos_tangibles (
    uuidActivo UUID PRIMARY KEY REFERENCES activos(uuidActivo),
    idModelo INTEGER REFERENCES modelos(idModelo),
    serie VARCHAR(100),
    idArea INTEGER REFERENCES areas(idArea),
    idResponsable INTEGER REFERENCES personas(idPersona),
    idContactoSoporte INTEGER
);

CREATE TABLE activos_intangibles (
    uuidActivo UUID PRIMARY KEY REFERENCES activos(uuidActivo),
    idSoporte INTEGER,
    urlSoporte TEXT
);

-- ==========================================
-- LICENCIAS
-- ==========================================

CREATE TABLE licencias (
    idLicencia SERIAL PRIMARY KEY,
    licencia_key TEXT,
    estado VARCHAR(50),
    uuidActivo UUID REFERENCES activos(uuidActivo)
);

CREATE TABLE licencias_asignadas (
    idLicencia INTEGER REFERENCES licencias(idLicencia),
    uuidActivo UUID REFERENCES activos(uuidActivo),
    asignacion DATE,
    designacion VARCHAR(150),
    PRIMARY KEY(idLicencia, uuidActivo)
);

-- ==========================================
-- CUENTAS / CREDENCIALES
-- ==========================================

CREATE TABLE credenciales (
    idCuenta SERIAL PRIMARY KEY,
    pass VARCHAR(255),
    usuario VARCHAR(100),
    uuidActivo UUID REFERENCES activos(uuidActivo)
);

CREATE TABLE cuentas_asignadas (
    idCuenta INTEGER REFERENCES credenciales(idCuenta),
    uuidActivo UUID REFERENCES activos(uuidActivo),
    asignacion DATE,
    designacion VARCHAR(150),
    PRIMARY KEY(idCuenta, uuidActivo)
);

-- ==========================================
-- SOPORTE
-- ==========================================

CREATE TABLE contactos_soporte (
    idSoporte SERIAL PRIMARY KEY,
    nombre VARCHAR(150),
    celular VARCHAR(20),
    correo VARCHAR(150),
    contacto VARCHAR(150)
);

CREATE TABLE garantias (
    idGarantia SERIAL PRIMARY KEY,
    idGarantiaProveedor INTEGER,
    idSoporte INTEGER REFERENCES contactos_soporte(idSoporte),
    uuidActivo UUID REFERENCES activos(uuidActivo)
);

-- ==========================================
-- SUSCRIPCIONES
-- ==========================================

CREATE TABLE tipos_suscripcion (
    idTipoSuscripcion SERIAL PRIMARY KEY,
    modalidad VARCHAR(50),
    precio NUMERIC(10,2),
    pago_divisa VARCHAR(20),
    link TEXT,
    uuidActivo UUID REFERENCES activos(uuidActivo)
);

CREATE TABLE historial_pagos (
    idPago SERIAL PRIMARY KEY,
    idTipoSuscripcion INTEGER REFERENCES tipos_suscripcion(idTipoSuscripcion),
    fecha DATE
);

-- ==========================================
-- INVENTARIO Y CARACTERÍSTICAS
-- ==========================================

CREATE TABLE caracteristicas (
    idCaracteristica SERIAL PRIMARY KEY,
    caracteristica TEXT
);

CREATE TABLE especificaciones (
    idEspecificacion SERIAL PRIMARY KEY,
    uuidActivo UUID REFERENCES activos(uuidActivo),
    idCaracteristica INTEGER REFERENCES caracteristicas(idCaracteristica),
    especificacion TEXT,
    fecha DATE
);

CREATE TABLE historial_estados (
    idEstado SERIAL PRIMARY KEY,
    tipoEstado VARCHAR(100),
    fecha DATE,
    uuidActivo UUID REFERENCES activos(uuidActivo)
);

-- ==========================================
-- CONSUMIBLES
-- ==========================================

CREATE TABLE consumibles (
    idConsumible SERIAL PRIMARY KEY,
    nombre VARCHAR(150),
    stock INTEGER,
    idModelo INTEGER REFERENCES modelos(idModelo)
);

CREATE TABLE consumidos (
    uuidActivo UUID REFERENCES activos(uuidActivo),
    idConsumible INTEGER REFERENCES consumibles(idConsumible),
    asignacion DATE,
    designacion VARCHAR(150),
    cantidad INTEGER,
    PRIMARY KEY(uuidActivo,idConsumible)
);

CREATE TABLE subactivos (
    idSubActivo SERIAL PRIMARY KEY,
    uuidActivo UUID REFERENCES activos(uuidActivo),
    asignacion DATE,
    designacion VARCHAR(150)
);

-- ==========================================
-- MANTENIMIENTOS
-- ==========================================

CREATE TABLE mantenimientos (
    idMantenimiento SERIAL PRIMARY KEY,
    fecha DATE,
    observaciones TEXT,
    uuidActivo UUID REFERENCES activos(uuidActivo),
    empresa VARCHAR(150)
);

-- ==========================================
-- CÓDIGOS DE INVENTARIO
-- ==========================================

CREATE TABLE codigo_inventario (
    idCodigo SERIAL PRIMARY KEY,
    uuidCodigo UUID,
    uuidActivo UUID REFERENCES activos(uuidActivo),
    fecha DATE
);

-- ==========================================
-- INCIDENCIAS
-- ==========================================

CREATE TABLE incidencias (
    uuidIncidencia UUID PRIMARY KEY,
    idPersona INTEGER REFERENCES personas(idPersona),
    idArea INTEGER REFERENCES areas(idArea),
    idCuenta INTEGER REFERENCES cuentas(idCuenta),
    idSubCategoria INTEGER REFERENCES subcategorias_incidencia(idSubCategoria),
    idCategoria INTEGER REFERENCES categorias_incidencia(idCategoria)
);

-- ==========================================
-- AUDITORÍA
-- ==========================================

CREATE TABLE logs_auditoria (
    idLog BIGSERIAL PRIMARY KEY,
    idCuenta INTEGER REFERENCES cuentas(idCuenta),
    entidadAfectada VARCHAR(150),
    fecha DATE,
    hora TIME,
    preCambioJson JSONB,
    postCambioJson JSONB
);