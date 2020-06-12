-- Eliminación de la base de datos
DROP DATABASE IF EXISTS biblioteca;
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca;
-- Selección de la base de datos
USE biblioteca;

-- Creación de la tabla autores
CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F') NOT NULL,
    fecha_nacimiento Date NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    creat_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserción de registros en la tabla autores
INSERT INTO autores(nombre, apellido, genero, fecha_nacimiento, pais_origen) 
VALUES
    ('Gabriel', 'García Márquez', 'M', '1927-03-06', 'Colombia'),
    ('Jorge Luis', 'Borges', 'M', '1899-08-24', 'Argentina'),
    ('Charles', 'Dickens', 'M', '1812-02-07', 'Inglaterra'),
    ('Franz', 'Kafka', 'M', '1883-07-03', 'Austria'),
    ('Jane', 'Austen', 'F', '1775-12-16', 'Inglaterra');

-- Vista de registros de la tabla autores
SELECT * FROM autores;