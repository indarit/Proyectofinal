const database = require('./database')

const getAlumnos = async(req,res) =>{
    await database.pool.query('SELECT * FROM alumnos')
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e))
};

const getAlumnoById = async (req,res) =>{
    const userId = req.params.userId;
    const query = `SELECT firstname, lastname, github FROM alumnos WHERE users_Id=$1`;
    await database.pool.query(query,[userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e))
}

const getEvaluacionById = async (req,res) =>{
    const userId = req.params.userId;
    const query = `select users_id,semana , status_tarea, status_asist1, status_asist2, nombre_modulo from evaluacion join modulo on modulo.id = evaluacion.modulo_id where users_id= $1`
    await database.pool.query(query,[userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e))
}
const getmoduloById = async (req, res) => {
  const userId = req.params.userId;
  const query = `select * from modulo where id=$1`;
  await database.pool
    .query(query, [userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

const getgrupoById = async (req, res) => {
  const userId = req.params.userId;
  const query = `select * from grupo where codigo_grupo=$1`;
  await database.pool
    .query(query, [userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e));
};

/* const getEvaluacion = async (req, res) => {
  
    const evaluacionGrupal= `select alumno_id, modulo_id, semana, , status_asist1, status_asist2, status_tarea from grupo g join modulo m on m.curso_id = g.curso_id join evaluacion e on e.modulo_id = m.id join alumnos a ON a.id = e.alumno_id and a.codigo_grupo = g.codigo_grupo where g.codigo_grupo = $1 and m.id =$2 and e.semana = $3`
    let codigoGrupo = req.query.grupo;
    let moduloId = req.query.moduloId;
    let semana = req.query.semana;
    await database.pool.query(evaluacionGrupal,[codigoGrupo, moduloId, semana])
 .then((result)=> res.status(200).json(result.rows))
.catch((e)=> console.error(e))} */

module.exports = {
  getAlumnos,
  getAlumnoById,
  getEvaluacionById,
  getmoduloById,
  getgrupoById,
  //getEvaluacion,
}