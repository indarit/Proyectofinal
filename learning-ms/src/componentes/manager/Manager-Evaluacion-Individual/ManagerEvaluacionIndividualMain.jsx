import React from "react";
import NavbarMain from "../../navbar/NavbarMain";
import Table from './tablaevaluacion.jsx';
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import "../../../App.css"


const ManagerEvaluacionIndividualMain = () => {
    const baseClassName = "ManagerEvaluacion"
    return (
        <>
        <NavbarMain/>
        <div className={`${baseClassName}-contenedor-principal`}>
            <div className={`${baseClassName}-contenedor-title-button`}>
                <h1 className={`${baseClassName}-title-evaluacion`}>Evaluación Individual</h1> 
                <Button className="save-buttom">Guardar</Button>{' '}
            </div>
        <Container className="container-datos-ai">
        <div className="contenidoAlumno">
        <h1 className="alumno-name-ai">Linda Rosado</h1>
        <a className="alumno-gh-ai" href="https://github.com/Lindarosado16" target="_blank" rel="noreferrer">https://github.com/Lindarosado16</a>
        </div>
        </Container>
            <Table/>
        </div>
        </>
    ) ;
} ;

export default ManagerEvaluacionIndividualMain;

