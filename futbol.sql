drop database if exists futbol;
create database futbol;
use futbol;

create table equipo(
   id INT primary key,
   nombre varchar(100),
   ciudad varchar(100)
);

create table jugador(
   dni varchar(100) primary key,
   nombre varchar(100),
   nacionalidad varchar (100),
   dorsal varchar (100),
   altura float,
   id_equipo INT,
   FOREIGN KEY(id_equipo) REFERENCES equipo(id)
);

insert into equipo values ( 30,'Real Madrid','madrid');
insert into equipo values ( 20,'Barcelona','barcelona');

insert into jugador values
('200','Kylian Mbappe','francesa',9,1.80,30),
('150','Vinicius Junior','brasileña',7,1.76,30),
('800','Lamine Yamal','española',19,1.80,20),
('650','Gavi','española',6,1.73,20);

