import React from "react";
import NavbarMain from "../../navbar/NavbarMain";
import AutoCloseExample from "./botonesdropdown.jsx";
import Table from './tablaevaluacion.jsx';
import "../../../App.css"

const arrGroup = [
  {
    value:"1",
    text:"JUL22-ES"
  },
  {
    value:"2",
    text:"JUL22-EN"
  },
]

const arrModule = [
  {
    value:"1",
    text:"HTML/CSS"
  },
  {
    value:"2",
    text:"JavaScript I"
  },
    {
    value:"3",
    text:"JavaScript II"
  },
    {
    value:"4",
    text:"JavaScript III"
  },
    {
    value:"5",
    text:"React"
  },
    {
    value:"6",
    text:"Node"
  },
    {
    value:"7",
    text:"SQL"
  },
]

const arrWeek = [
  {
    value:"1",
    text:"1"
  },
  {
    value:"2",
    text:"2"
  },
    {
    value:"3",
    text:"3"
  },
]


const ManagerEvaluacionGrupalMain = () => {
    const baseClassName = "ManagerEvaluacion"
    return (
        <>
        <NavbarMain/>
        <div className={`${baseClassName}-contenedor-principal`}>
            <div className={`${baseClassName}-contenedor-title-button`}>
                <h1 className={`${baseClassName}-title-evaluacion`}>Evaluación Grupal</h1> 
                     
            </div>
            <div className={`${baseClassName}-selectores-principales`}>
                <AutoCloseExample title="Grupo" array={arrGroup}/>
                <AutoCloseExample title="Módulo"array={arrModule}/>
                <AutoCloseExample title="Semana"array={arrWeek}/>
            </div>
            <Table/>
        </div>
        </>
    ) ;
} ;

export default ManagerEvaluacionGrupalMain;

