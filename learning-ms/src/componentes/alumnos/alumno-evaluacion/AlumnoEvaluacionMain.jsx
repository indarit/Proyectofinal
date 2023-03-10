import React from "react";
import NavbarMain from "../../navbar/NavbarMain";
import Table from 'react-bootstrap/Table';
import Container from 'react-bootstrap/Container';
import {InfoUserContextProvider} from './context/infoUserContext'
import AlumnoDatos from "./AlumnoDatos";

const AlumnoEvalucionMain = () => {



    return (
      <>
<NavbarMain/>
        
        <InfoUserContextProvider>
<AlumnoDatos/>
      </InfoUserContextProvider>


<Container className="container-data-table-ai">
<Table  borderless hover variant="lght" size="md" >
      <thead className="cabecera-tabla-alumno-individual">
        <tr>
          <th>Modulo</th>
          <th>Semana</th>
          <th>Asistencia 1</th>
          <th>Asistencia 2</th>
          <th>Tarea</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Intro</td>
          <td>1</td>
          <td>Yes</td>
          <td>No</td>
          <td>Done</td>
        </tr>

        <tr>
          <td>Intro</td>
          <td>2</td>
          <td>Yes</td>
          <td>No</td>
          <td>Done</td>
        </tr>

        <tr>
          <td>HTML/CSS</td>
          <td>1</td>
          <td>Yes</td>
          <td>No</td>
          <td>Done</td>
        </tr>
        
      </tbody>
    </Table>
</Container>
        </>
    ) ;
} ;
export default AlumnoEvalucionMain