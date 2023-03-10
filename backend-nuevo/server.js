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


app.get('/alumnos', api.getAlumnos)
app.get('/alumnos/:userId' , api.getAlumnoById)
app.get('/notas/:userId', api.getNotasById)


const url = `http://localhost:${PORT}`;
app.listen(PORT, () => console.log(`Listening on port ${url}`));
