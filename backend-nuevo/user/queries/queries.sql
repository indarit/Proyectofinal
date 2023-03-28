drop  table if exists curso cascade;
drop  table if exists modulo cascade;
drop  table if exists grupo cascade;
drop  table if exists users cascade;
drop  table if exists alumnos cascade;
drop  table if exists evaluacion cascade;
drop  table if exists usuario cascade;
drop  table if exists manager cascade;

CREATE TABLE users (
    id          SERIAL   PRIMARY KEY,
    email       VARCHAR(120) NOT NULL,
    password    VARCHAR(120) NOT NULL,
    isadmin     bool,
	created_at  DATE,
    UNIQUE (email)
);
select * from users

CREATE TABLE curso (
    id             SERIAL PRIMARY KEY,
    nombre_curso     VARCHAR(30) NOT null);
    
INSERT INTO curso (nombre_curso) VALUES ('Web Development');
select * from curso;

drop table if exists modulo;
CREATE TABLE modulo (
    id              SERIAL PRIMARY KEY,
    nombre_modulo   VARCHAR(30) NOT null,
    total_semanas   INT,
    curso_id        INT REFERENCES curso(id));
    
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('Intro', 1,2);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('Html/Ccs', 1,3);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('JS1', 1,3);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('JS2', 1,3);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('JS3', 1,3);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('React', 1,3);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('Node', 1,3);
INSERT INTO modulo (nombre_modulo, curso_id,total_semanas) VALUES ('SQL', 1,3);

select * from modulo;
select nombre_curso, nombre_modulo, total_semanas  from modulo m join curso c on m.curso_id  = c.id ;

CREATE TABLE grupo (
   codigo_grupo     VARCHAR(40) PRIMARY KEY,
   curso_id        INT REFERENCES curso(id),
   estado_grupo          BOOLEAN not null);
  
INSERT INTO grupo (codigo_grupo, curso_id,  estado_grupo) VALUES ('JUL2022SP',1,'1');
INSERT INTO grupo (codigo_grupo, curso_id,  estado_grupo) VALUES ('JUL2022EN',1,'1');
select * from grupo;
select nombre_curso, codigo_grupo,  estado_grupo  from grupo g join curso c on g.curso_id = c.id  where estado_grupo = TRUE ;


 
CREATE TABLE alumnos (
    id              SERIAL        PRIMARY KEY,
	users_Id        SERIAL        REFERENCES users(id),
    firstname       VARCHAR(30)   NOT NULL,
    lastname        VARCHAR(120)  NOT NULL,
    github           VARCHAR(100) NOT null,
    nro_identif      VARCHAR(15)  NOT null,
    telefono         VARCHAR(15),
    nacionalidad     VARCHAR(20),
    fecha_nac        DATE,
    codigo_grupo     VARCHAR(40)  REFERENCES grupo(codigo_grupo),
    unique (nro_identif),
    estado_alumno    Boolean);
   
   

INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('LUIS','RAMOS','https://github.com/luistramos','Y-7867254-A',671246544,'VENEZOLANA','1978-12-13','JUL2022SP','1',2);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Natalia','Rosa','https://github.com/@nrosa','Y-7788665-H',574878101,'Argentina','1986-06-06','JUL2022SP','1',3);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Karelys','AMADOR','https://github.com/@kare','Y-7988665-V',824878101,'VENEZOLANA','1990-07-06','JUL2022SP','1',4);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Linda','Rosado','https://github.com/@linda','Y-9878667-Z',824678101,'VENEZOLANA','1999-01-06','JUL2022SP','1',5);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Litzy','Cabrera','https://github.com/@litzy','Y-9878665-Z',824878101,'VENEZOLANA','2003-07-06','JUL2022SP','1',6);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Miguel','Desimone','https://github.com/@migueldesimone','Y-546824679',678542047,'ARGENTINO','1996-08-06','JUL2022SP','1',7);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Oswaldo','Viloria','https://github.com/@oswaldoviloria','Y-759438499',658794562,'VENEZOLANO','1998-08-07','JUL2022SP','1',8);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id)
VALUES ('GABRIEL','ARNO','https://github.com/Gabrielarnof','Y-7688174-T',765453265,'VENEZOLANO','1981-02-10','JUL2022SP','1',9);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Laura','Beleño','https://github.com/@laurabeleño','Y-7489546',876498215,'COLOMBIANA','1995-12-07','JUL2022SP','1',10);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Wiston','Uribe','https://github.com/@wistonuribe','Y-987675214',687942144,'COLOMBIANO','1993-08-11','JUL2022SP','1',11); 
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Elimar','Finol','https://github.com/@elimarfinol','Y-26789758',634765247,'VENEZOLANA','1994-10-22','JUL2022SP','1',12);  
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Ricardo','Manzano','https://github.com/@ricardomanzano','Y-75963147',658791347,'MEXICANO','1988-02-24','JUL2022EN','1',13); 
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('NUNO','LUIS','https://github.com/@NUNO','Y-7931865-V',564778101,'CARIBE;O','1990-12-22','JUL2022EN','1',14);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Nimra','Shahzadi','https://github.com/actuallyyun,','Y-79318641-C',5647791013,'MARROQUI','1993-12-22','JUL2022EN','1',15);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Amanda','Maria','https://github.com/@Amandam,','Y-79318643-A',5647791099,'Basileña','1995-11-22','JUL2022EN','1',16);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Oday','Ajam','https://github.com/@Ajam,','Y-79318644-B',5647791099,'China','1995-11-21','JUL2022EN','1',17);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Muazzam','Shahzad','https://github.com/@Shahzad,','Y-79318645-c',5647791091,'Paquistani','1995-11-22','JUL2022EN','1',18);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Ali','Murtaza','https://github.com/@Murtaza,','Y-79318646-D',5647791092,'Paquistani','1995-11-23','JUL2022EN','1',19);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Yun','Ji','https://github.com/@Ji,','Y-79318647-F',5647791093,'China','1995-11-24','JUL2022EN','1',20);
INSERT INTO alumnos (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
VALUES ('Manpreet','Singh','https://github.com/@Murtaza,','Y-79318647-E',5647791093,'Paquistani','1995-11-24','JUL2022EN','1',21);

 
select * from  alumnos;
  select * from alumnos a  where id =2;
   
   
   create table manager(
    id SERIAL primary key, 
    firstname       VARCHAR(30) NOT NULL,
    lastname        VARCHAR(120) NOT null,
    users_id        INT references users(id));
 
 select * from manager
 
 INSERT INTO manager (firstname,  lastname, id)
	values ('Alí','Raza', 1);

drop  table if exists evaluacion;
    CREATE TABLE evaluacion (
    alumnos_id      INT REFERENCES alumnos(id),
    modulo_id       INT references modulo(id),
    semana          INT,
    status_tarea    VARCHAR(20),
    status_asist1   VARCHAR(20),
    status_asist2   VARCHAR(20),  
    PRIMARY KEY(alumnos_id, modulo_id,semana));
   
select * from evaluacion;
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,1,'Uncomplete','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,4,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,4,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,6,2,'Done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,6,3,'Done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,8,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,8,3,'Not done','Yes','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,1,2,'Uncomplete','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,4,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,4,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,5,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,6,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,7,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,8,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,8,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,4,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,5,1,'Done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,5,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,5,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,6,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,7,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,5,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,6,1,'Done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,6,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,7,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,1,1,'Not done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,2,1,'Uncomplete','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,2,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,2,3,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,3,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,3,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,4,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,4,3,'Not done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,5,3,'Done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,6,1,'Done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,6,2,'Done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,6,3,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,7,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,7,3,'Done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,8,1,'Done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (5,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,1,2,'Not done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,2,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,2,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,4,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,4,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,6,2,'Done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,6,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,7,2,'Done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (6,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,1,1,'Uncomplete','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,2,3,'Not done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,3,3,'Not done','Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,4,2,'Uncomplete','Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,4,3,'Not done','Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,5,1,'Done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,5,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,5,3,'Done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,6,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,7,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,8,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (7,8,3,'Not done','Unnoticed Missing','Unnoticed Delay');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,1,1,'Not done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,3,1,'Done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,3,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,4,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,5,1,'Done','Unnoticed Delay','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,5,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,6,2,'Uncomplete','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,6,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,7,1,'Done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,7,2,'Uncomplete','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,7,3,'Not done','Unnoticed Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,8,2,'Uncomplete','Missing','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (8,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,1,1,'Uncomplete','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,2,1,'Done','Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,2,2,'Uncomplete','Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,2,3,'Not done','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,3,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,3,3,'Not done','Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,4,2,'Uncomplete','Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,4,3,'Not done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,5,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,5,3,'Not done','Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,6,3,'Not done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,7,3,'Not done','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,8,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,8,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (9,8,3,'Not done','Yes','Delay');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,1,1,'Not done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,1,2,'Done','Yes','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,2,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,2,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,2,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,3,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,3,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,4,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,4,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,5,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,7,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,7,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,8,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (10,8,3,'Not done','Yes','Yes');


INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,1,1,'Uncomplete','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,4,3,'Not done','Yes','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,5,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,5,3,'Not done','Yes','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,6,3,'Not done','Yes','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,8,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (11,8,3,'Not done','Unnoticed Missing','Yes');


INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,2,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,2,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,2,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,3,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,3,3,'Not done','Unnoticed Missing','Unnoticed Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,4,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,5,1,'Done','Unnoticed Delay','Unnoticed Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,5,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,5,3,'Not done','Unnoticed Missing','Unnoticed Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,6,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,7,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,7,2,'Done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (12,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,1,1,'Done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,2,3,'Not done','Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,3,1,'Done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,3,3,'Not done','Missing','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,4,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,6,3,'Not done','Unnoticed Missing','Unnoticed Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,7,1,'Done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,7,3,'Not done','Unnoticed Missing','Unnoticed Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (13,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,3,3,'Not done','Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,4,1,'Done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,4,3,'Not done','Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,5,1,'Done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,7,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,8,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (14,8,3,'Not done','Yes','Yes');


INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,1,1,'Done','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,2,1,'Done','Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,2,3,'Not done','Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,4,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,6,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,6,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,8,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (15,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,2,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,3,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,4,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,4,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,5,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,6,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,6,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,7,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,7,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (16,8,3,'Not done','Unnoticed Missing','Yes');

INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,1,1,'Uncomplete','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,1,2,'Done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,2,1,'Done','Unnoticed Delay','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,2,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,4,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,4,3,'Not done','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,5,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,5,3,'Not done','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,6,3,'Not done','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,7,3,'Not done','Unnoticed Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,8,2,'Not done','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (17,8,3,'Not done','Unnoticed Missing','Yes');


INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,1,2,'Not done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,2,1,'Not done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,3,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,3,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,4,1,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,4,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,4,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,5,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,5,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,6,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,6,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,7,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,7,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,7,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (18,8,3,'Not done','Unnoticed Missing','Yes');


INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,1,1,'Done','Yes','Unnoticed Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,1,2,'Not done','Delay','Missing');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,2,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,2,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,2,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,3,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,3,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,3,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,4,1,'Done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,4,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,4,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,5,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,5,2,'Uncomplete','Yes','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,5,3,'Not done','Unnoticed Missing','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,6,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,6,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,6,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,7,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,7,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,7,3,'Not done','Yes','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,8,1,'Done','Unnoticed Delay','Yes');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,8,2,'Uncomplete','Missing','Delay');
INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (19,8,3,'Not done','Yes','Yes');



select * from evaluacion 


select users_id,semana , status_tarea, status_asist1, status_asist2, nombre_modulo 
from evaluacion 
join modulo on modulo.id = evaluacion.modulo_id
where users_id= 2;

select * from modulo where id =1;

select * from grupo where codigo_grupo  = 'JUL2022SP';

 
select E.semana, E.semana , E.status_tarea, E.status_asist1, E.status_asist2, M.nombre_modulo from evaluacion E, modulo M where (E.modulo_id = M.id) and (id=1);

    
select alumno_id, modulo_id, semana, status_asist1, status_asist2, status_tarea from grupo g join modulo m on m.curso_id = g.curso_id join evaluacion e on e.modulo_id = m.id join alumnos a ON a.id = e.alumno_id and a.codigo_grupo = g.codigo_grupo where g.codigo_grupo = $1 and m.id =$2 and e.semana = $3

select * from evaluacion where alumnos_id =1 and modulo_id =2 and semana=3 limit 1;
update evaluacion set  status_tarea= 'UM', status_asist1= 'UM', status_asist2= 'UM' where alumnos_id =1 and modulo_id =2 and semana =2 ;
    
   
select *from  evaluacion where alumnos_id =1; 

select firstname, lastname, semana , status_tarea, status_asist1, status_asist2, nombre_modulo
from alumnos a 
join evaluacion e on e.alumnos_id = a.id
join modulo m on m.id = e.modulo_id 
where users_Id = 2 order  by modulo_id asc;

