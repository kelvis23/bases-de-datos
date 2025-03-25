drop database if exists tipos_datos;
create database tipos_datos;
use tipos_datos;

create table tiposDatos(
   flotante float(10,5),
   decimales DECIMAL(7,3),
   codigo CHAR(4),
   texto TEXT,
   dia DATE,
   momento DATETIME,
   hora TIME,
   color ENUM('Rojo','Verde','Azul')
 );
 
 INSERT INTO tiposDatos values
 (23.1,7.12,'ABCD',
  'texto largooooooo',
  '2024-09-04','2024-09-04 11:59:00',
  '11:59:27','Verde')
  (7.15,8.3,'hola'
  ;
