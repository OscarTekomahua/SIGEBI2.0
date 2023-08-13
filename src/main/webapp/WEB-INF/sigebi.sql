create database sigebi;
use sigebi;

-- Creacion de tablas --
-- Crear Tabla Persona --
CREATE TABLE persona (
	id_persona INT PRIMARY KEY auto_increment,
    nombres VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50)
);

-- Crear Tabla Rol --
CREATE TABLE rol (
	id_rol INT PRIMARY KEY auto_increment,
    tipo_usuario VARCHAR(20)
);
-- Crear Tabla Usuario --
CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY auto_increment,
    id_persona INT,
    rol INT,
    correo_institucional VARCHAR(50),
    contraseña VARCHAR(64),
    codigo VARBINARY(100),
    FOREIGN KEY (rol) REFERENCES rol (id_rol)
);
-- Crear Tabla Libro --
CREATE TABLE libro (
	id_libro INT PRIMARY KEY auto_increment,
    titulo VARCHAR(50),
    autor VARCHAR(64),
    ejemplares INT,
    isbn VARCHAR(50),
    imagen text
);
-- Crear Tabla Categoria --
CREATE TABLE categoria (
	id_categoria INT PRIMARY KEY auto_increment,
    nombre_categoria VARCHAR(50)
);
-- Crear Tabla Editorial --
CREATE TABLE editorial (
	id_editorial INT PRIMARY KEY auto_increment,
    nombre VARCHAR(50)
);
-- Crear Tabla LibroHasEditorial --
CREATE TABLE librohaseditorial (
	id_libroHasEditorial INT PRIMARY KEY auto_increment,
    id_editorial INT,
    id_libro INT,
    FOREIGN KEY (id_editorial) REFERENCES editorial (id_editorial),
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
);
-- Crear Tabla LibroHasCategoria --
CREATE TABLE librohascategoria (
	id_libroHasCategoria INT PRIMARY KEY auto_increment,
    id_categoria INT,
    id_libro INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
);
-- Crear Tabla Sala --
CREATE TABLE sala (
	id_sala INT PRIMARY KEY auto_increment,
    nombre VARCHAR(50),
    capacidad_maxima INT,
    imagen text
);
-- Crear Tabla PrestamoLibro --
CREATE TABLE prestamolibro (
	id_prestamo INT PRIMARY KEY auto_increment,
    id_libro INT,
    id_usuario INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES libro (id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
    
);
-- Crear Tabla PrestamoSala --
CREATE TABLE prestamosala (
	id_prestamosala INT PRIMARY KEY auto_increment,
    id_sala INT,
    id_usuario INT,
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_sala) REFERENCES sala (id_sala),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

-- Insercion de datos en la tabla Persona --
insert into persona (nombres, apellido1, apellido2) 
values ('Oscar', 'Avila', 'Tekomahua');
insert into persona (nombres, apellido1, apellido2) 
values ('Abril', 'Garcia', 'Bustos');
insert into persona (nombres, apellido1, apellido2) 
values ('Alejandro', 'Hernandez', 'Diaz');
insert into persona (nombres, apellido1, apellido2) 
values ('Jose Antonio', 'Diaz', 'Garcia');
select * from persona;

-- Insercion de datos en la tabla Rol --
insert into rol (tipo_usuario) 
values ('Administrador');
insert into rol (tipo_usuario) 
values ('Bibliotecario');
insert into rol (tipo_usuario) 
values ('Usuario UTEZ');
select * from rol;

-- Insercion de datos en la tabla Usuario --
insert into usuario (id_persona, rol, correo_institucional, contraseña, codigo)
values (1, 1, '20223tn042@utez.edu.mx', sha2('admin', 256), aes_encrypt('admin123', 'secret_keyForPas'));
insert into usuario (id_persona, rol, correo_institucional, contraseña, codigo)
values (2, 2, '20223tn053@utez.edu.mx', sha2('bibliotecario', 256), aes_encrypt('biblio123', 'secret_keyForPas'));
insert into usuario (id_persona, rol, correo_institucional, contraseña, codigo)
values (3, 3, '20223tn058@utez.edu.mx', sha2('alejandr0', 256), aes_encrypt('alejandro123', 'secret_keyForPas'));
insert into usuario (id_persona, rol, correo_institucional, contraseña, codigo)
values (4, 3, '20223tn047@utez.edu.mx', sha2('antoine', 256), aes_encrypt('ant0in3', 'secret_keyForPas'));
select * from usuario;
ALTER TABLE usuario ADD COLUMN multa DECIMAL(10, 2) DEFAULT 0;

-- Insercion de datos en la tabla Libro --
insert into libro (titulo, autor, ejemplares, isbn, imagen) 
values ('El Principito', 'Antoine de Saint-Exupéry', 4, '742780', "img");
insert into libro (titulo, autor, ejemplares, isbn, imagen) 
values ('Harry Potter: El Caliz de Fuego', 'J.K. Rowling', 5, '123456', "img");
insert into libro (titulo, autor, ejemplares, isbn, imagen) 
values ('Romeo y Julieta', 'William Shakespeare', 3, '890765', "img");
insert into libro (titulo, autor, ejemplares, isbn, imagen) 
values ('Orgullo y Prejuicio', 'Jane Austen', 5, '456780', "img");
insert into libro (titulo, autor, ejemplares, isbn, imagen) 
values ('Yo, Robot', 'Isaac Asimov', 4, '902340', "img");
select * from libro;
DELIMITER $$
CREATE PROCEDURE ELIMINAR_LIBRO(in id int )
BEGIN
    
    DELETE FROM
        librohascategoria
    WHERE
        id_libro = id;
        delete from
        librohaseditorial
        where
        id_libro = id;
        delete from 
        prestamoLibro
        where
        id_libro = id;
        DELETE FROM
        libro
    WHERE
        id_libro = id;
END
$$
DELIMITER ;

-- Insercion de datos en la tabla Categoria --
insert into categoria (nombre_categoria) 
values ('Fantasia');
insert into categoria (nombre_categoria) 
values ('Ciencia Ficcion');
insert into categoria (nombre_categoria) 
values ('Romance');
insert into categoria (nombre_categoria) 
values ('Novelas');
insert into categoria (nombre_categoria) 
values ('Terror');
select * from categoria;

-- Insercion de datos en la tabla Editorial --
insert into editorial (nombre) 
values ('Casa Grande');
insert into editorial (nombre) 
values ('Fantasia');
insert into editorial (nombre) 
values ('Trillas');
insert into editorial (nombre) 
values ('Planeta');
insert into editorial (nombre) 
values ('Alba');
select * from editorial;
DELIMITER $$
CREATE PROCEDURE ELIMINAR_EDITORIAL(in idEditorial int )
BEGIN

DELETE FROM
    librohaseditorial
WHERE
        id_editorial = idEditorial;
delete from
    editorial
where
        id_editorial = idEditorial;
END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE elimninarcategoria(in idCategoria int )
BEGIN

DELETE FROM
    librohascategoria
WHERE
        id_categoria = idCategoria;
delete from
    categoria
where
        id_categoria = idCategoria;
END
$$
DELIMITER ;

-- Insercion de datos en la tabla LibroHasEditorial --
insert into librohaseditorial (id_editorial, id_libro) 
values (1, 1);
insert into librohaseditorial (id_editorial, id_libro) 
values (3, 2);
insert into librohaseditorial (id_editorial, id_libro) 
values (5, 3);
insert into librohaseditorial (id_editorial, id_libro) 
values (2, 4);
insert into librohaseditorial (id_editorial, id_libro) 
values (1, 5);
select * from librohaseditorial;

-- Insercion de datos en la tabla LibroHasCategoria --
insert into librohascategoria (id_categoria, id_libro)
values (1, 1);
insert into librohascategoria (id_categoria, id_libro)
values (2, 2);
insert into librohascategoria (id_categoria, id_libro)
values (3, 3);
insert into librohascategoria (id_categoria, id_libro)
values (4, 4);
insert into librohascategoria (id_categoria, id_libro)
values (4, 5);
select * from librohascategoria;

-- Insercion de la tabla Sala --
insert into sala (nombre, capacidad_maxima, imagen)
values ('Sala 1', 20, "img");
insert into sala (nombre, capacidad_maxima, imagen)
values ('Sala 2', 10, "img");
insert into sala (nombre, capacidad_maxima, imagen)
values ('Sala 3', 10, "img");
select * from sala;
ALTER TABLE sala ADD COLUMN estado BOOLEAN DEFAULT true;

-- Inserción de datos en la tabla PrestamoLibro --
insert into prestamolibro (id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (1, 3, '2023-03-10', '2023-03-20');
insert into prestamolibro (id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (2, 3, '2023-04-11', '2023-04-21');
insert into prestamolibro (id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (3, 4, '2023-06-07', '2023-06-17');
insert into prestamolibro (id_libro, id_usuario, fecha_prestamo, fecha_devolucion) 
values (4, 4, '2023-07-12', '2023-07-22');
select * from prestamolibro;
ALTER TABLE prestamolibro ADD COLUMN estado_prestamo VARCHAR(40) DEFAULT 'Devuelto';
ALTER TABLE prestamolibro ADD COLUMN multa DECIMAL(10, 2) DEFAULT 0;

-- Insercion de datos en la tabla PrestamoSala --
insert into prestamosala (id_sala, id_usuario, hora_inicio, hora_fin)
values (1, 3, '10:00:00', '11:00:00');
insert into prestamosala (id_sala, id_usuario, hora_inicio, hora_fin)
values (2, 3, '11:00:00', '12:00:00');
insert into prestamosala (id_sala, id_usuario, hora_inicio, hora_fin)
values (3, 4, '15:00:00', '16:00:00');
insert into prestamosala (id_sala, id_usuario, hora_inicio, hora_fin)
values (2, 4, '13:00:00', '15:00:00');
select * from prestamosala;
ALTER TABLE prestamosala ADD COLUMN estado VARCHAR(40) DEFAULT 'Devuelto'; 
ALTER TABLE prestamosala ADD COLUMN extras VARCHAR(150);

-- Trigger para Cambio Inmediato de Estado en 'PrestamoSala' --
DELIMITER //
CREATE TRIGGER tr_prestamo_estado
    BEFORE INSERT ON PrestamoSala
    FOR EACH ROW
BEGIN
    DECLARE v_hora_actual TIME;
    DECLARE v_hora_inicio TIME;

    SET v_hora_actual = CURRENT_TIME();
    SET v_hora_inicio = NEW.hora_inicio;

    IF v_hora_inicio <= v_hora_actual THEN
        SET NEW.estado = 'Prestada';
    ELSE
        SET NEW.estado = 'Reservada';
END IF;
END;
//
DELIMITER ;

-- Evento para Cambio de Estado en 'PrestamoSala' y 'Sala' al Tiempo de Inicio --
DELIMITER //
CREATE EVENT ev_cambio_estado
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    DECLARE v_hora_actual TIME;

    SET v_hora_actual = CURRENT_TIME();

UPDATE PrestamoSala
SET estado = 'Prestada'
WHERE estado = 'Reservada' AND hora_inicio <= v_hora_actual;

UPDATE Sala
SET estado = false
WHERE id_sala IN (SELECT id_sala FROM PrestamoSala WHERE estado = 'Prestada' AND hora_inicio <= v_hora_actual);
END;
//
DELIMITER ;

-- Evento para Cambio de Estado en 'PrestamoSala' y 'Sala' al Tiempo de Fin --
DELIMITER //
CREATE EVENT ev_cambio_estado_fin
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    DECLARE v_hora_actual TIME;

    SET v_hora_actual = CURRENT_TIME();

UPDATE PrestamoSala
SET estado = 'Devuelta'
WHERE estado = 'Prestada' AND hora_fin <= v_hora_actual;

UPDATE Sala
SET estado = true
WHERE id_sala IN (SELECT id_sala FROM PrestamoSala WHERE estado = 'Devuelta' AND hora_fin <= v_hora_actual);
END;
//
DELIMITER ;


