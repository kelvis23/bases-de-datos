drop database if exists definicion_col;
CREATE DATABASE definicion_col;
use definicion_col;

create table tabla(
  uno int NOT NULL,
  dos varchar(5) DEFAULT 'abc'
);
 INSERT INTO tabla values(1,'HOLA');
 INSERT INTO (uno,dos)values(1,'bye');
 INSERT INTO (dos,uno)values('otra',3);

 INSERT INTO tabla(uno) VALUES(2);
--insert into tabla (dos) values('prueb');
 INSERT INTO tabla(dos) VALUES(5,null);
> 
 select*From tabla;


