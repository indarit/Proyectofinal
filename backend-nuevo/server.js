const express = require('express');
const app = express();
const cors = require('cors');
const api = require('./api')
const bodyParser = require('body-parser');
const user = require('./user/routes/user');
require('dotenv').config();
const PORT = process.env.PORT || 4000;

const myLogger = (req, res, next) => {
  const log = {
    date: new Date(),
    url: req.url
  };
  console.log(JSON.stringify(log, null, 2));
  next();
};

const corsOptions = { origin: 'http://localhost:3000' };
app.use(cors(corsOptions)); // enable CORS
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(myLogger);
app.use('/user', user);


app.get('/alumno', api.getAlumnos)
app.get('/alumno/:userId' , api.getAlumnoById)
app.get("/evaluacion", api.getEvaluacion)
app.get("/evaluacion/:userId", api.getEvaluacionById)
app.get("/modulo/:userId", api.getmoduloById)
app.get("/grupo/:userId", api.getgrupoById)
app.get("/modulo", api.getmodulos)
app.get("/grupos", api.getGrupos)
app.put("/evaluacion", api.putevaluacion)







const url = `http://localhost:${PORT}`;
app.listen(PORT, () => console.log(`Listening on port ${url}`));
