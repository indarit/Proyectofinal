const database = require("./database");

const getAlumnos = async (req, res) => {
  await database.pool
    .query("SELECT * FROM alumnos")
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

const getAlumnoById = async (req, res) => {
  const userId = req.params.userId;
  const query = `SELECT firstname, lastname, github FROM alumnos WHERE users_Id=$1`;
  await database.pool
    .query(query, [userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

const getEvaluacionById = async (req, res) => {
  const userId = req.params.userId;
  const query = `select firstname, lastname, github, semana , status_tarea, status_asist1, status_asist2, nombre_modulo from alumnos a join evaluacion e on e.alumnos_id = a.id join modulo m on m.id = e.modulo_id where users_Id =$1 order  by modulo_id asc`;
  await database.pool
    .query(query, [userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};
const getmoduloById = async (req, res) => {
  const modulo_Id = req.params.moduloId;
  const query = `select * from modulo where id=$1`;
  await database.pool
    .query(query, [modulo_Id])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

const getgrupoById = async (req, res) => {
  const grupo_Id = req.params.grupoId;
  const query = `select * from grupo where codigo_grupo=$1`;
  await database.pool
    .query(query, [grupo_Id])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

const get_evaluacion =
  "select alumnos_id, modulo_id, nombre_modulo, semana, firstname, status_asist1, status_asist2, status_tarea \
from grupo g \
join modulo m on m.curso_id = g.curso_id \
join evaluacion e on e.modulo_id = m.id \
join alumnos a ON a.id = e.alumnos_id and a.codigo_grupo = g.codigo_grupo \
where g.codigo_grupo = $1 and m.id =$2 and e.semana = $3  order by firstname asc";
const getEvaluacion = async (req, res) => {
  try {
    let codigoGrupo = req.query.grupo;
    let moduloId = req.query.moduloId;
    let semana = req.query.semana;
    await database.pool.query(
      get_evaluacion,
      [codigoGrupo, moduloId, semana],
      (error, result) => {
        console.log(error);
        res.json(result.rows);
      }
    );
  } catch (error) {
    res.json({ error: error.message });
  }
};
const putevaluacion = async (req, res) => {
  const selectEvaluacionAlumno = `select * from evaluacion where alumnos_id= $1 and modulo_id= $2 and semana= $3 limit 1`;
  const sqlUpdateAlumnos = `update evaluacion set  status_tarea= $1, status_asist1= $2, status_asist2= $3 where alumnos_id=$4 and modulo_id =$5 and semana =$6`;
  const sqlinsetevaluacion = `INSERT INTO evaluacion (alumnos_id, modulo_id, semana , status_tarea, status_asist1, status_asist2) values ($1,$2,$3,$4,$5,$6)`;
  const evaluaciones = req.body;
  evaluaciones.forEach(async (e) => {
    console.log("!!!!", e);
    const evaluacionactual = await database.pool.query(selectEvaluacionAlumno, [
      e.alumnos_id,
      e.modulo_id,
      e.semana,
    ]);
    console.log(evaluacionactual.rows);
    if (evaluacionactual.rows.length) {
      const evaluacionactual = await database.pool.query(sqlUpdateAlumnos, [
        e.status_tarea,
        e.status_asist1,
        e.status_asist2,
        e.alumnos_id,
        e.modulo_id,
        e.semana,
      ]);
    } else {
      await database.pool.query(sqlinsetevaluacion, [
        e.alumnos_id,
        e.modulo_id,
        e.semana,
        e.status_tarea,
        e.status_asist1,
        e.status_asist2,
      ]);
    }
  });
  res.status(200).json("ok");
};
const getGrupos = async (req, res) => {
  await database.pool
    .query("SELECT * FROM grupo")
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

const getmodulos = async (req, res) => {
  await database.pool
    .query("SELECT * FROM modulo")
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

module.exports = {
  getAlumnos,
  getAlumnoById,
  getEvaluacionById,
  getmoduloById,
  getgrupoById,
  getEvaluacion,
  putevaluacion,
  getGrupos,
  getmodulos,
};
