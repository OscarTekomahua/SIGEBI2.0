create database intesigebi;
use intesigebi;
-- Creacion de tablas --

-- Crear Tabla Persona --
CREATE TABLE persona (
	id_persona INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50)
);

-- Crear Tabla Rol --
CREATE TABLE rol (
	id_rol INT PRIMARY KEY,
    tipo_usuario VARCHAR(20)
);
-- Crear Tabla Usuario --
CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY,
    id_persona INT,
    rol INT,
    correo_institucional VARCHAR(50),
    contraseña VARCHAR(64),
    codigo VARCHAR(64),
    FOREIGN KEY (rol) REFERENCES rol (id_rol)
);
-- Crear Tabla Libro --
CREATE TABLE libro (
	id_libro INT PRIMARY KEY,
    titulo VARCHAR(50),
    autor VARCHAR(64),
    ejemplares INT,
    isbn VARCHAR(50),
    imagen text
);
-- Crear Tabla Categoria --
CREATE TABLE categoria (
	id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);
-- Crear Tabla Editorial --
CREATE TABLE editorial (
	id_editorial INT PRIMARY KEY,
    nombre VARCHAR(50)
);
-- Crear Tabla LibroHasEditorial --
CREATE TABLE librohaseditorial (
	id_libroHasEditorial INT PRIMARY KEY,
    id_editorial INT,
    id_libro INT,
    FOREIGN KEY (id_editorial) REFERENCES editorial (id_editorial),
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
);
-- Crear Tabla LibroHasCategoria --
CREATE TABLE librohascategoria (
	id_libroHasCategoria INT PRIMARY KEY,
    id_categoria INT,
    id_libro INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
);
-- Crear Tabla Sala --
CREATE TABLE sala (
	id_sala INT PRIMARY KEY,
    nombre VARCHAR(50),
    capacidad_maxima INT,
    imagen text
);
-- Crear Tabla PrestamoLibro --
CREATE TABLE prestamolibro (
	id_prestamo INT PRIMARY KEY,
    id_libro INT,
    id_usuario INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
    
);
-- Crear Tabla PrestamoSala --
CREATE TABLE prestamosala (
	id_prestamosala INT PRIMARY KEY,
    id_sala INT,
    id_usuario INT,
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_sala) REFERENCES sala (id_sala),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

-- Insercion de datos en la tabla Persona --
insert into persona (id_persona, nombre, apellido1, apellido2) 
values (123, 'Alejandro', 'Hernandez', 'Diaz');
insert into persona (id_persona, nombre, apellido1, apellido2) 
values (456, 'Gonzalo', 'Bahena', 'Perez');
insert into persona (id_persona, nombre, apellido1, apellido2) 
values (701, 'Joaquin', 'Guzman', 'Loera');
insert into persona (id_persona, nombre, apellido1, apellido2) 
values (789, 'Oscar', 'Avila', 'Tekomahua');

-- Insercion de datos en la tabla Rol --
insert into rol (id_rol, tipo_usuario) 
values (1, 'Administrador');
insert into rol (id_rol, tipo_usuario) 
values (2, 'Bibliotecario');
insert into rol (id_rol, tipo_usuario) 
values (3, 'Usuario UTEZ');

-- Insercion de datos en la tabla Usuario --
insert into usuario (id_usuario, id_persona, rol, correo_institucional, contraseña, codigo)
values (1, 123, 1, '20223tn077@utez.edu.mx', sha2('admin', 256), sha2('admin123', 256));
insert into usuario (id_usuario, id_persona, rol, correo_institucional, contraseña, codigo)
values (2, 456, 2, '20223tn053@utez.edu.mx', sha2('bibliotecario', 256), sha2('biblio321', 256));
insert into usuario (id_usuario, id_persona, rol, correo_institucional, contraseña, codigo)
values (3, 789, 3, '20223tn042@utez.edu.mx', sha2('osc4r1t0', 256), sha2('0sc4r13', 256));
insert into usuario (id_usuario, id_persona, rol, correo_institucional, contraseña, codigo)
values (4, 701, 3, '20223tn058@utez.edu.mx', sha2('j04qu1n', 256), sha2('ch4p1t0', 256));

-- Insercion de datos en la tabla Libro --
insert into libro (id_libro, titulo, autor, ejemplares, isbn, imagen) 
values (1, 'El Principito', 'Antoine de Saint-Exupéry', 4, '742780', "img");
insert into libro (id_libro, titulo, autor, ejemplares, isbn, imagen) 
values (2, 'Harry Potter: El Caliz de Fuego', 'J.K. Rowling', 5, '123456', "img");
insert into libro (id_libro, titulo, autor, ejemplares, isbn, imagen) 
values (3, 'Romeo y Julieta', 'William Shakespeare', 3, '890765', "img");
insert into libro (id_libro, titulo, autor, ejemplares, isbn, imagen) 
values (4, 'Orgullo y Prejuicio', 'Jane Austen', 5, '456780', "img");
insert into libro (id_libro, titulo, autor, ejemplares, isbn, imagen) 
values (5, 'Yo, Robot', 'Isaac Asimov', 4, '902340', "img");

-- Insercion de datos en la tabla Categoria --
insert into categoria (id_categoria, nombre_categoria) 
values (1, 'Fantasia');
insert into categoria (id_categoria, nombre_categoria) 
values (2, 'Ciencia Ficcion');
insert into categoria (id_categoria, nombre_categoria) 
values (3, 'Romance');
insert into categoria (id_categoria, nombre_categoria) 
values (4, 'Novelas');
insert into categoria (id_categoria, nombre_categoria) 
values (5, 'Terror');

-- Insercion de datos en la tabla Editorial --
insert into editorial (id_editorial, nombre) 
values (1, 'Casa Grande');
insert into editorial (id_editorial, nombre) 
values (2, 'Fantasia');
insert into editorial (id_editorial, nombre) 
values (3, 'Trillas');
insert into editorial (id_editorial, nombre) 
values (4, 'Planeta');
insert into editorial (id_editorial, nombre) 
values (5, 'Alba');

-- Insercion de datos en la tabla LibroHasEditorial --
insert into librohaseditorial (id_libroHasEditorial, id_editorial, id_libro) 
values (1, 1, 1);
insert into librohaseditorial (id_libroHasEditorial, id_editorial, id_libro) 
values (2, 3, 2);
insert into librohaseditorial (id_libroHasEditorial, id_editorial, id_libro) 
values (3, 5, 3);
insert into librohaseditorial (id_libroHasEditorial, id_editorial, id_libro) 
values (4, 2, 4);
insert into librohaseditorial (id_libroHasEditorial, id_editorial, id_libro) 
values (5, 1, 5);

-- Insercion de datos en la tabla LibroHasCategoria --
insert into librohascategoria (id_libroHasCategoria, id_categoria, id_libro)
values (1, 1, 1);
insert into librohascategoria (id_libroHasCategoria, id_categoria, id_libro)
values (2, 2, 2);
insert into librohascategoria (id_libroHasCategoria, id_categoria, id_libro)
values (3, 3, 3);
insert into librohascategoria (id_libroHasCategoria, id_categoria, id_libro)
values (4, 4, 4);
insert into librohascategoria (id_libroHasCategoria, id_categoria, id_libro)
values (5, 4, 5);

-- Insercion de la tabla Sala --
insert into sala (id_sala, nombre, capacidad_maxima, imagen)
values (1, 'Sala 1', 20, "img");
insert into sala (id_sala, nombre, capacidad_maxima, imagen)
values (2, 'Sala 2', 10, "img");
insert into sala (id_sala, nombre, capacidad_maxima, imagen)
values (3, 'Sala 3', 10, "img");

-- Inserción de datos en la tabla PrestamoLibro --
insert into prestamolibro (id_prestamo, id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (1, 1, 3, '2023-03-10', '2023-03-20');
insert into prestamolibro (id_prestamo, id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (2, 2, 3, '2023-04-11', '2023-04-21');
insert into prestamolibro (id_prestamo, id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (3, 3, 4, '2023-06-07', '2023-06-17');
insert into prestamolibro (id_prestamo, id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (4, 4, 4, '2023-07-12', '2023-07-22');

-- Insercion de datos en la tabla PrestamoSala --
insert into prestamosala (id_prestamoSala, id_sala, id_usuario, hora_inicio, hora_fin)
values (1, 1, 3, '10:00:00', '11:00:00');
insert into prestamosala (id_prestamoSala, id_sala, id_usuario, hora_inicio, hora_fin)
values (2, 2, 3, '11:00:00', '12:00:00');
insert into prestamosala (id_prestamoSala, id_sala, id_usuario, hora_inicio, hora_fin)
values (3, 3, 4, '15:00:00', '16:00:00');
insert into prestamosala (id_prestamoSala, id_sala, id_usuario, hora_inicio, hora_fin)
values (4, 2, 4, '13:00:00', '15:00:00');
