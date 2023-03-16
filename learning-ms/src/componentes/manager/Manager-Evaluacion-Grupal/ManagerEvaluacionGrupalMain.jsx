import React from "react";
import NavbarMain from "../../navbar/NavbarMain";
import CabeceraBotones from "./DropdownsBtnsCabecera.jsx";
import Table from "./tablaevaluacion.jsx";
import "../../../App.css";
import { DataAlumnosContextProvider } from "../context/dataAlumnosContext";

const ManagerEvaluacionGrupalMain = () => {
  const baseClassName = "ManagerEvaluacion";
  return (
    <>
      <NavbarMain />
      <div className={`${baseClassName}-contenedor-principal`}>
        <div className={`${baseClassName}-contenedor-title-button`}>
          <h1 className={`${baseClassName}-title-evaluacion`}>
            Evaluación Grupal
          </h1>
        </div>
        <DataAlumnosContextProvider>
          <CabeceraBotones />
          <Table />
        </DataAlumnosContextProvider>
      </div>
    </>
  );
};

export default ManagerEvaluacionGrupalMain;
