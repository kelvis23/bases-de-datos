drop database if  exists   libreria;
create database  libreria;
use libreria;

create table autor (
  id INT auto_increment primary key,
  nombre VARCHAR (50),
  dni VARCHAR (50) unique key
);

create table  tienda (
  cif VARCHAR (50) primary key,
  ubicasion VARCHAR (50), 
  web VARCHAR (50) 
);
create table libros (
  isbn VARCHAR(50) primary key,
  titulo VARCHAR (50),
  genero VARCHAR (50) DEFAULT 'FANSTASIA',
  presio DOUBLE check (presio >50),
  fecha_publicasion date,
  id_autor INT,
  cif_tienda VARCHAR (50),
FOREIGN KEY (id_autor) REFERENCES autor (id),
FOREIGN KEY (cif_tienda) REFERENCES tienda( cif)
);

insert into autor values
(28,'Graham McNeil', 250);
insert into tienda values
('manolo fatasi','madrid centro', 'MULTIVERSO');
insert into libros values
('8496348830' ,'Warhammer 40k', 40, '1987',28,'manolo fatasi');

