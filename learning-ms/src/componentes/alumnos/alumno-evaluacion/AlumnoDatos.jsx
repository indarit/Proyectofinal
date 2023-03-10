import React from "react";

import Container from 'react-bootstrap/Container';
import { infoUserContext} from './context/infoUserContext'
import { useContext } from "react";

const AlumnoDatos = () => {
const dataContext = useContext(infoUserContext)
console.log(dataContext);

    return (
      <>
<Container className="container-datos-ai">
<div className="contenidoAlumno">
    <h1 className="alumno-name-ai">{dataContext[0].firstname} {dataContext[0].lastname}</h1>
<a className="alumno-gh-ai" href={dataContext[0].github} target="_blank" rel="noreferrer">{dataContext[0].github}</a>
</div>

</Container>
      
        </>
    ) ;
} ;
export default AlumnoDatos