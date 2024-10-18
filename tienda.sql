drop database if exists tienda;
create database tienda;
use tienda;

create table fabricante(
   codigo INT PRIMARY KEY,
   nombre varchar (100)
);

create table producto(
   codigo  INT PRIMARY KEY,
   nombre varchar (100),
   precio double,
   codigo_fabricante INT,
   FOREIGN KEY(codigo_fabricante) REFERENCES fabricante (codigo)  
);

insert into fabricante values (50,'intel');
insert into fabricante values (51,'asus');

insert into producto values
(1,'procesador i3',70.12,50),
(2,'procesador i5',90.55,50),
(3,'procesador i7',120.90,50);

