import React from "react";
import NavbarMain from "../../navbar/NavbarMain";
import Table from "react-bootstrap/Table";
import Container from "react-bootstrap/Container";
import { InfoUserContextProvider } from "./context/infoUserContext";
import AlumnoDatos from "./AlumnoDatos";
import AlumnoNotas from "./AlumnoNotas";
import { AlumnoNotasContextProvider } from "./context/notasAlumnoContext";

const AlumnoEvalucionMain = () => {
  return (
    <>
      <NavbarMain />

      <InfoUserContextProvider>
        <AlumnoDatos />
      </InfoUserContextProvider>

      <Container className="container-data-table-ai">
        <Table borderless hover variant="lght" size="md">
          <thead className="cabecera-tabla-alumno-individual">
            <tr>
              <th>Modulo</th>
              <th>Semana</th>
              <th>Asistencia 1</th>
              <th>Asistencia 2</th>
              <th>Tarea</th>
            </tr>
          </thead>
          <AlumnoNotasContextProvider>
            <AlumnoNotas />
          </AlumnoNotasContextProvider>
        </Table>
      </Container>
    </>
  );
};
export default AlumnoEvalucionMain;
