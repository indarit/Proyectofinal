import React from "react";
import { notasAlumnoContext } from "./context/notasAlumnoContext";
import { useContext } from "react";

const AlumnoNotas = () => {
  const notasContext = useContext(notasAlumnoContext);
  console.log(notasContext);

  return (
    <>
      <tbody>
        {notasContext.map((item, index) => (
          <tr>
            <td>{item.nombre_modulo}</td>
            <td>{item.semana}</td>
            <td>{item.status_asist1}</td>
            <td>{item.status_asist2}</td>
            <td>{item.status_tarea}</td>
          </tr>
        ))}
      </tbody>
    </>
  );
};
export default AlumnoNotas;
