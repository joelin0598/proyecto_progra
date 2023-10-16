--CATALOGO TIPO ESTADO SOLICITUD - CATALOGO CU2 - RN8
create table tipo_estado_solicitud(
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CATALOGO TIPO SOPORTE - CATALOGO CU1 - RN8
create table tipo_soporte(
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CATALOGO TIPO USUARIOS - CATALOGO
create table tipo_usuario(
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CAMBIAR NOMBRE DE TABLA DE TIPO USUARIO A ROL
alter table tipo_usuario rename to rol;

--CATALOGO TIPO DE SOLICITUD - CATALOGO CU1 - RN4
create table tipo_solicitud (
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CATALOGO TIPO SOLICITANTE - CATALOGO CU1 - RN1
create table tipo_solicitante(
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CATALOGO PRIVILEGIOS
create table privilegios(
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--TABLA SOPORTE
create table soporte (
	id SERIAL,
	id_tipo_soporte integer,
	primary key (id)
);


alter table soporte 
add constraint soporte_tipo_soporte_fkey foreign key (id_tipo_soporte)
references tipo_soporte (id) match simple;

--TABLA ESTADO SOLICITUD
create table estado_solicitud (
	id SERIAL,
	id_tipo_estado_solicitud integer not null,
	primary key (id)
);

drop table estado_solicitud;

alter table estado_solicitud 
add constraint estado_solicitud_tipo_estado_solicitud_fkey foreign key (id_tipo_estado_solicitud)
references tipo_estado_solicitud (id) match simple;

--TABLA EXPEDIENTE MEDICO
create table expediente (
	id SERIAL,	
	nit_cliente varchar(8) not null,
	direccion varchar(255) not null,
	id_soporte integer null,
	primary key (id)
);

--FKEY ENTRE EXPEDIENTE - SOPORTE
alter table expediente 
add constraint expediente_id_soporte_fkey foreign key (id_soporte)
references soporte (id) match simple;

--ELIMINAR ENTRE EXPEDIENTE - SOPORTE
alter table expediente 
drop constraint expediente_id_soporte_fkey;

alter table soporte
add column id_expediente integer;

alter table soporte 
add constraint soporte_id_expediente_fkey foreign key (id_expediente)
references expediente (id) match simple;


--TABLA USUARIO
create table usuario (
	id SERIAL,
	id_rol integer,
	id_expediente integer,
	nombres varchar(255) not null,
	apellidos varchar(255) not null,
	email varchar(255) not null,
	genero varchar(255) not null,
	telefono varchar(8) not null,
	password varchar(255) not null,
	primary key (id)
);

alter table usuario drop column id_tipo_usuario;


alter table usuario 
add constraint usuario_id_expediente_fkey foreign key (id_expediente)
references expediente (id) match simple;

create table solicitud_muestra_medica (
	id SERIAL,
	id_usuario integer not null,
	id_expediente integer not null,
	id_tipo_solicitante integer not null,
	id_tipo_solicitud integer not null,
	id_estado_solicitud integer null,
	descripcion_solicitud_muestra_medica varchar(2000) null,
	fecha_creacion_solicitud date not null,
	dias_vencimiento_solicitud integer null,
	cantidad_muestra integer,
	primary key (id)
);

alter table solicitud_muestra_medica 
add column id_cliente integer;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_usuario_fkey foreign key (id_usuario)
references usuario (id) match simple;

alter table solicitud_muestra_medica
drop constraint solicitud_muestra_medica_id_usuario_fkey;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_cliente_fkey foreign key (id_cliente)
references cliente (id) match simple;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_expediente_fkey foreign key (id_expediente)
references expediente (id) match simple;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_tipo_solicitante_fkey foreign key (id_tipo_solicitante)
references tipo_solicitante (id) match simple;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_tipo_solicitud_fkey foreign key (id_tipo_solicitud)
references tipo_solicitud (id) match simple;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_estado_solicitud_fkey foreign key (id_estado_solicitud)
references estado_solicitud (id) match simple;

ALTER TABLE solicitud_muestra_medica
DROP CONSTRAINT solicitud_muestra_medica_id_expediente_fkey;

alter table solicitud_muestra_medica
drop column id_expediente;

--CATALOGO UNIDAD MEDIDA
create table unidad_medida (
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CATALOGO TIPO MUESTRA
create table tipo_muestra (
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

---CATALOGO PRESENTACION MUESTRA
create table presentacion_muestra (
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--CATALOGO TIPO DE ITEMS
create table tipo_items (
	id SERIAL,
	nombre varchar(50) not null, 
	descripcion varchar (255) not null,
	fecha_creacion date not null,
	fecha_modificacion date null,
	creado_por varchar(255) not null,
	modificado_por varchar (255) null,
	primary key (id)
);

--TABLA ITEMS
create table items (
	id SERIAL,
	id_tipo_items integer not null,
	id_solicitud_muestra_medica integer not null,
	primary key (id)
);


alter table items 
add constraint items_tipo_items_fkey foreign key (id_tipo_items)
references tipo_items (id) match simple;

alter table items 
add constraint items_solicitud_muestra_medica_fkey foreign key (id_solicitud_muestra_medica)
references solicitud_muestra_medica (id) match simple;

--TABLA DE DOCUMENTOS ADJUNTOS
create table documento_muestra_adjunto (
	id SERIAL,
	formato_documento varchar(4),
	tamaño_documento varchar (4),
	primary key (id)
);

create table muestra_medica (
	id SERIAL,
	id_solicitud_muestra_medica integer not null,
	id_presentacion_muestra integer not null,
	id_tipo_muestra integer not null,
	id_documento_muestra_adjunto integer null,
	id_unidad_medida integer not null,
	fecha_recepcion_muestra date not null,
	fecha_creacion_muestra date not null,
	--cantidad_items integer,
	--cantidad_documento_muestra_adjunto integer,
	observacion_expediente varchar(2000),
	primary key (id)
);


--alter table items 
--drop constraint items_muestra_medica_fkey;

--alter table muestra_medica
--drop constraint muestra_medica_items_fkey;

create table muestra_items (
	id SERIAL,
	id_muestra_medica integer not null,
	id_items integer not null,
	primary key (id)
);

alter table muestra_items
add constraint muestra_items_id_muestra_medica_fkey foreign key (id_muestra_medica)
references muestra_medica (id) match simple;

alter table muestra_items
add constraint muestra_items_id_items_fkey foreign key (id_items)
references items (id) match simple;

alter table muestra_medica
add constraint muestra_medica_id_solicitud_muestra_medica_fkey foreign key (id_solicitud_muestra_medica)
references solicitud_muestra_medica (id)match simple;


alter table muestra_medica
add constraint muestra_medica_id_presentacion_muestra_fkey foreign key (id_presentacion_muestra)
references presentacion_muestra (id) match simple;

alter table muestra_medica
add constraint muestra_medica_id_tipo_muestra_fkey foreign key (id_tipo_muestra)
references tipo_muestra (id) match simple;

alter table muestra_medica
add constraint muestra_medica_id_documento_muestra_adjunto_fkey foreign key (id_documento_muestra_adjunto)
references documento_muestra_adjunto (id) match simple;

alter table muestra_medica
add constraint muestra_medica_id_unidad_medida_fkey foreign key (id_unidad_medida)
references unidad_medida (id) match simple;

add column id_unidad_medida integer;
alter table muestra_medica

--alter table solicitud_muestra_medica
--drop column cantidad_muestra;

--alter table solicitud_muestra_medica 
--add column cantidad_muestra_medica varchar(4);

create table documento_analisis(
	id SERIAL,
	id_muestra_medica integer,
	primary key (id)
);

alter table documento_analisis 
add constraint documento_analisis_id_muestra_medica_fkey foreign key (id_muestra_medica)
references muestra_medica (id) match simple;

select * from usuario ;

drop database db_proyecto;

--TABLA EMPLEADOS
create table empleado (
	id SERIAL,
	id_rol integer,
	id_usuario integer,
	primary key (id)
);

--FKEY EMPLEADOS
alter table empleado
add constraint empleado_id_rol_fkey foreign key (id_rol)
references rol (id) match simple;

alter table empleado
add constraint empleado_id_usuario_fkey foreign key (id_usuario)
references usuario (id) match simple;

--TABLA CLIENTE
create table cliente(
	id SERIAL,
	fecha_creacion date,
	primary key (id)
);

alter table cliente add column id_usuario integer;

alter table cliente
add constraint cliente_id_usuario_fkey foreign key (id_usuario)
references usuario (id) match simple;

create table bitacora

--INGRESO DE DATOS A CATOLOGO DE TIPO DE SOPORTE
insert into tipo_soporte(nombre, descripcion,fecha_creacion,creado_por) 
values
('SM','Solicitud Médica','2023-10-15 22:30:00','Jonathan'),
('ET','Examen Externo','2023-10-15 22:30:00','Jonathan'),
('FP','Factura','2023-10-15 22:30:00','Jonathan'),
('HO','Hoja Oficio','2023-10-15 22:30:00','Jonathan"');

select * from expediente;

--ELIMINACION DE RELACION ENTRE SOPORTE Y TABLA EXPEDIENTE
ALTER TABLE soporte DROP CONSTRAINT soporte_tipo_soporte_fkey;

--ELIMINACION DE TABLA SOPORTE
drop table soporte;

--MODIFICACION CAMPO DE SOPORTE A TIPO DE SOPORTE
alter table expediente rename column id_soporte to id_tipo_soporte;

--CREACION DE RELLACION DE EXPEDIENTE A TIPO DE SOPORTE
alter table expediente 
add constraint expediente_tipo_soporte_fkey foreign key (id_tipo_soporte)
references tipo_soporte (id) match simple;

--CREACION DE EXPEDIENTE DE PRUEBA
insert into expediente (nit_cliente,direccion,id_tipo_soporte)
values
('99914190','Ciudad Quetazal, San Juan Sac.',4);

select * from expediente;

--CREACION DE USUARIO DE PRUEBA
insert into usuario (id_expediente,nombres,apellidos,email,genero,telefono,password)
values
(1,'Jonathan','Guamuch','joelmorales0598@gmail.com','Masculino','46740797','prueba123');

select * from usuario;







	
















