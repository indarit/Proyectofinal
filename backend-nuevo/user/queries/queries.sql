CREATE TABLE users (
    id          SERIAL   PRIMARY KEY,
    email       VARCHAR(120) NOT NULL,
    password    VARCHAR(120) NOT NULL,
    isadmin     bool,
	created_at  DATE,
    UNIQUE (email)
);

CREATE TABLE alumnos (
    id          SERIAL   PRIMARY KEY,
	userId      INT REFERENCES users(id),
    firstname   VARCHAR(30) NOT NULL,
    lastname    VARCHAR(120) NOT NULL,
    github     VARCHAR(100) NOT NULL 
);

CREATE TABLE notas_alumno(
    id          SERIAL   PRIMARY KEY,
	userId      INT REFERENCES users(id),
    modulo_name   VARCHAR(120) NOT NULL,
    semana_number    DEC(1) NOT NULL,
    asistencia_1     VARCHAR(10) NOT NULL,
	asistencia_2     VARCHAR(10) NOT NULL,
	tarea     VARCHAR(100) NOT NULL
)


INSERT INTO notas_alumno (userId, modulo_name,semana_number,asistencia_1,asistencia_2,tarea)
VALUES (2,'Intro',1,'yes','yes','done'), (2,'Intro',2,'yes','yes','done'),(2,'HTML/CSS',1,'yes','yes','done'), (2,'HTML/CSS',2,'yes','no','done'),
(2,'JAVASCRIPT',1,'yes','yes','done'),(2,'JAVASCRIPT',2,'yes','yes','done'), (2,'REACT',1,'yes','yes','done'), (2,'REACT',2,'yes','yes','delay'),
(2,'NODE JS',1,'yes','yes','done'), (2,'NODE JS',2,'yes','yes','done'), (2,'BASE DE DATOS',1,'yes','yes','done'),(2,'BASE DE DATOS',2,'yes','yes','undone')

