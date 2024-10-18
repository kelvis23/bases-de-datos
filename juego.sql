DROP DATABASE IF EXISTS juego;
CREATE DATABASE juego;
use juego;

CREATE TABLE desarrolladora(
 nombre varchar (50) PRIMARY KEY
);

CREATE TABLE juego(
 id  INT PRIMARY KEY,
 nombre VARCHAR (60),
 fk_desarrolladora VARCHAR(50),
 FOREIGN KEY (fk_desarrolladora) REFERENCES desarrolladora (nombre)
 on delete cascade
);

CREATE TABLE personajes (
 nombre  VARCHAR(50) PRIMARY KEY,
 vida float ,
 fk_juego INT,
 FOREIGN KEY (fk_juego) REFERENCES juego (id)
 on delete set null
 );
 
 INSERT INTO desarrolladora Values('buggy Soft');
 INSERT INTO juego VALUES
 (0,'Las aventuras del capitan salami','buggy Soft'),
 (1,'Las aventuras del capitan salami -Vegan ed','buggy Soft');
 
 INSERT INTO personajes VALUES
 ('Cap.salami',10.0,0),
 ('Señor cuchilller',10.0,0),
 ('Cap.Seitan',10.0,1),
 ('señor chucharilla', 10.0,1);
 
 SELECT *FROM personajes;
 SELECT *FROM juego;
 SELECT *FROM desarrolladora;
 
-- DELETE FROM juego Where id =0;
DELETE from desarrolladora WHERE nombre = 'buggy Soft';
 SELECT *FROM juego;
 SELECT *FROM desarrolladora;
 
 
 
  
