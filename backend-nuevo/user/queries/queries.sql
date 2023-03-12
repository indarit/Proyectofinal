drop  table if exists curso cascade;
drop  table if exists modulo cascade;
drop  table if exists grupo cascade;
drop  table if exists users cascade;
drop  table if exists alumnos cascade;
drop  table if exists evaluacion cascade;
drop  table if exists usuario cascade;
drop  table if exists manager cascade;


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

CREATE TABLE users (
    id          SERIAL   PRIMARY KEY,
    email       VARCHAR(120) NOT NULL,
    password    VARCHAR(120) NOT NULL,
    isadmin     bool,
	created_at  DATE,
    UNIQUE (email)
);
select * from users
 
CREATE TABLE alumnos (
    id              SERIAL   PRIMARY KEY,
	users_Id        SERIAL REFERENCES users(id),
    firstname       VARCHAR(30) NOT NULL,
    lastname        VARCHAR(120) NOT NULL,
    github           VARCHAR(100) NOT null,
    nro_identif      VARCHAR(15),
    telefono         VARCHAR(15),
    nacionalidad     VARCHAR(20),
    fecha_nac        DATE,
    codigo_grupo     VARCHAR(40) REFERENCES grupo(codigo_grupo),
    estado_alumno    Boolean);
   

INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
   VALUES ('Andrea','Acosta','https://github.com/@indarit','Y-7788664-C',651300967,'VENEZOLANA','1980-10-27','JUL2022SP','1',1);
INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
   VALUES ('LUIS','RAMOS','https://github.com/luistramos','Y-7867254-A',671246544,'VENEZOLANA','1978-12-13','JUL2022SP','1',2);
 INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
   VALUES ('Natalia','Rosa','https://github.com/@nrosa','Y-7788665-H',574878101,'Argentina','1986-06-06','JUL2022EN','1',3);
 INSERT INTO alumnos  (firstname, lastname, github, nro_identif, telefono,nacionalidad,fecha_nac,codigo_grupo, estado_alumno , users_Id) 
   VALUES ('Karelys','AMADOR','https://github.com/@kare','Y-7988665-V',824878101,'VENEZOLANA','1990-07-06','JUL2022EN','1',4);
   
  select * from  alumnos;
  select * from alumnos a  where id =2;
   
   
   create table manager(
    id SERIAL primary key, 
    firstname       VARCHAR(30) NOT NULL,
    lastname        VARCHAR(120) NOT null);
    
  users_id INT references users(id));
 
 select * from manager
 
 INSERT INTO manager (firstname,  lastname, id)
	values ('Alí','Raza', 1);

drop  table if exists evaluacion;
    CREATE TABLE evaluacion (
    users_Id        INT references users (id),
    alumnos_id      INT REFERENCES alumnos(id),
    modulo_id       INT references modulo(id),
    semana          INT,
    status_tarea    VARCHAR(2),
    status_asist1   VARCHAR(2),
    status_asist2   VARCHAR(2),  
    PRIMARY KEY( users_Id, modulo_id,semana));
   
   
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,1,1,'Y','Y','UM');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,1,2,'Y','D','M');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,2,1,'Y','UD','UD');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,2,2,'U','M','D');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (1,1,2,3,'N','UM','Y');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,1,1,'Y','Y','UM');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,1,2,'Y','D','M');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,2,1,'Y','UD','UD');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,2,2,'U','M','D');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (2,2,2,3,'N','UM','Y');

INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,1,1,'Y','Y','UM');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,1,2,'Y','D','M');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,2,1,'Y','UD','UD');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,2,2,'U','M','D');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (3,3,2,3,'N','UM','Y');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,1,1,'Y','Y','UM');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,1,2,'Y','D','M');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,2,1,'Y','UD','UD');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) VALUES (4,4,2,2,'U','M','D');
INSERT INTO evaluacion (users_Id, alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) values (4,4,2,3,'N','UM','Y');

select * from evaluacion;

select users_id,semana , status_tarea, status_asist1, status_asist2, nombre_modulo 
from evaluacion 
join modulo on modulo.id = evaluacion.modulo_id
where users_id= 2;


 
select E.semana, E.semana , E.status_tarea, E.status_asist1, E.status_asist2, M.nombre_modulo from evaluacion E, modulo M where (E.modulo_id = M.id) and (id=1);

    
    
    
    



