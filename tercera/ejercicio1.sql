DROP DATABASE IF EXISTS ejercicio1;
CREATE DATABASE ejercicio1;
USE ejercicio1;

CREATE TABLE ejercicio (
  id INT,
  nombre  varchar (50),
  apellido CHAR (30),
  numero_de_calle FLOAT,
  numero_seguridad DECIMAL (5,2),
  fecha_de_nacimiento DATE,
  fecha_hora_nacimiento DATETIME,
  hora_de_nacimiento TIME
);

INSERT INTO ejercicio VALUES 
(124, 'paco','torres',122.45,12.46,'1969-06-20','1969-06-20 18:30:00','18:30:00');

