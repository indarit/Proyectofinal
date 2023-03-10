import React from 'react';
import './App.css';
import { Route, Routes } from 'react-router-dom';
import LoginMain from "./componentes/login/LoginMain.jsx";
import AlumnoEvalucionMain from './componentes/alumnos/alumno-evaluacion/AlumnoEvaluacionMain.jsx';
import ManagerEvaluacionGrupalMain from './componentes/manager/Manager-Evaluacion-Grupal/ManagerEvaluacionGrupalMain.jsx';
import ManagerEvaluacionIndividualMain from './componentes/manager/Manager-Evaluacion-Individual/ManagerEvaluacionIndividualMain.jsx';
import { UserContextProvider } from './componentes/context/UserContext';
const App = () => {
  return (
    
<UserContextProvider>
      <Routes>
        <Route path='/' element={<LoginMain/>}></Route>
        <Route path='/manager-evaluacion-grupal' element={<ManagerEvaluacionGrupalMain/>}></Route>
        <Route path='/manager-evaluacion-individual' element={<ManagerEvaluacionIndividualMain/>}></Route>
        <Route path='/alumno-evaluacion' element={<AlumnoEvalucionMain/>}></Route>
      </Routes>
</UserContextProvider>


    
  );
};

export default App;
