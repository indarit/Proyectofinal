const database = require('./database')

const getAlumnos = async(req,res) =>{
    await database.pool.query('SELECT * FROM alumnos')
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e))
};

const getAlumnoById = async (req,res) =>{
    const userId = req.params.userId;
    const query = `SELECT firstname, lastname, github FROM alumnos WHERE userid=$1`;
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

module.exports = {
  getAlumnos,
  getAlumnoById,
  getEvaluacionById,
};