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

const getNotasById = async (req,res) =>{
    const userId = req.params.userId;
    const query = `SELECT modulo_name, semana_number, asistencia_1, asistencia_2,tarea FROM notas_alumno WHERE userid=$1`;
    await database.pool.query(query,[userId])
    .then((result) => res.status(200).json(result.rows))
    .catch((e) => console.error(e))
}

module.exports = {
    getAlumnos,
    getAlumnoById,
    getNotasById
}