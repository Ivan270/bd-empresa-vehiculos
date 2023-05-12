CREATE TABLE empresa (
	rut VARCHAR(10) PRIMARY KEY NOT NULL,
	nombre VARCHAR(120) NOT NULL,
	direccion VARCHAR(120) NOT NULL,
	telefono NUMERIC(15) NOT NULL,
	correo VARCHAR(80) NOT NULL,
	web VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_vehiculo (
	id NUMERIC(12) PRIMARY KEY NOT NULL,
	nombre VARCHAR(120) NOT NULL
);

CREATE TABLE cliente (
	rut VARCHAR(10) PRIMARY KEY NOT NULL,
	nombre VARCHAR(120) NOT NULL,
	correo VARCHAR(80) NOT NULL,
	direccion VARCHAR(120) NOT NULL,
	celular NUMERIC(15) NOT NULL,
	alta CHAR(1) NOT NULL
);

CREATE TABLE marca (
	id NUMERIC(12) PRIMARY KEY NOT NULL,
	nombre VARCHAR(120) NOT NULL
);

CREATE TABLE vehiculo (
	id NUMERIC(12) PRIMARY KEY UNIQUE,
	patente VARCHAR(10) NOT NULL,
	marca VARCHAR(20) NOT NULL,
	modelo VARCHAR(20) NOT NULL,
	color VARCHAR(15) NOT NULL,
	precio NUMERIC(14,2) NOT NULL,
	frecuencia_mantencion NUMERIC(12) NOT NULL,
	marca_idMarca NUMERIC(12) NOT NULL,
	tipoVehiculo_idTipoVehiculo NUMERIC(12) NOT NULL,
	FOREIGN KEY (marca_idMarca) REFERENCES marca(id),
	FOREIGN KEY (tipoVehiculo_idTipoVehiculo) REFERENCES tipo_vehiculo(id)
);
CREATE TABLE venta (
	folio NUMERIC(12) PRIMARY KEY NOT NULL,
	fecha DATE NOT NULL,
	monto NUMERIC(14,2) NOT NULL,
	vehiculo_id NUMERIC(12) NOT NULL,
	cliente_rut VARCHAR(10) NOT NULL,
	FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id),
	FOREIGN KEY (cliente_rut) REFERENCES cliente(rut)
);
CREATE UNIQUE INDEX venta__idx ON
	venta (
		vehiculo_id
	ASC );
CREATE TABLE mantencion (
	id NUMERIC(12) PRIMARY KEY NOT NULL NOT NULL,
	fecha DATE NOT NULL,
	trabajos_realizados VARCHAR(1000) NOT NULL,
	venta_folio NUMERIC(12) NOT NULL,
	FOREIGN KEY (venta_folio) REFERENCES venta(folio)
);