drop database If exists ejercicios;
create database ejercicios;
use ejercicios;

create table ej1 (
 a int,
 b date,
 c varchar(5)
);
-- insertar:
-- 1. valores en a,b y c
insert into ej1 (a, b, c) values (21, '2024-10-08','hola');
-- 2. valores en orden b,c,a
insert into ej1(b,c,a)values ('1992-04-06','adios',22);
-- 3. valores en c y b
insert into ej1 (c, b) values ('dia','2000-12-06');
-- 4. valor en b
insert into ej1 (b) values ('2019-8-24');

select*from ej1;

-- Ejercicio 2
create table ej2 (
 a int NOT NULL ,
 b int not NULL DEFAULT 0,
 c varchar (5),
 d varchar(5) default 'hola'
 );

 -- insertar;
 -- 1. valores en a,b,d
 insert into ej2 (a,b,d) values ( 12, 16,'adios');
 -- 2. valores en a, b,c
 insert into ej2 (a,b,c) values (19, 24, 'bye');
 -- 3. valores en c, a y default en b
 insert into  ej2 (c,a ,d) values('buena',34,NULL);
 -- 4. valor en a con default en b y d
 insert into ej2 (a,c) values (14,'lol');
 -- 5. valor en a con null end
 insert into ej2(a,d) values (9,NULL);

select*from ej2;

-- Ejercicio 3
create table ej3(
 a int auto_increment unique key,
 b varchar (5) unique key comment'columan imorante',
 c varchar (5) DEFAULT 'hola'
 );
 
 INSERT INTO ej3 (b,c) VALUES
 ('papap','prue'),
 ('batma','cosa');
 INSERT INTO ej3 VALUES
 (5,'bala','pepe');
 INSERT INTO ej3 (b,c) VALUES
 ('otra','mas');
 
 select*from ej3; 
 
