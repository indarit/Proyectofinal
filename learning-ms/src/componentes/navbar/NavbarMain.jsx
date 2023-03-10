import React from "react";
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { Link,useNavigate } from "react-router-dom";
import imgLogo from '../../utils/LearningPlatform-bg-black.png'
import useUser from "../hook/useUser"

const NavbarMain = () => {
  const navigation = useNavigate();
  
  const {logout, isAdmin } = useUser();
  
  const handleClick = (e) => {
    e.preventDefault();
    logout();
    navigation('/')
  };

    return (
      <>
      {isAdmin ? (<Navbar bg="dark" expand="lg" variant="dark">
      <Container>
        <Navbar.Brand href="#home">
            <img
            src={imgLogo}
            alt="logo-learning"
            width="120"
            />
            </Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
<Navbar.Collapse id="basic-navbar-nav">
  <Nav className="me-auto">
    <Nav.Link href="#home">Gestión de Alumnos</Nav.Link>
    <Nav.Link href="#link">Gestión de Grupos</Nav.Link>
    <NavDropdown title="Evaluación" id="basic-nav-dropdown">
      <NavDropdown.Item><Link to={"/manager-evaluacion-individual"}>Individual</Link></NavDropdown.Item>
      <NavDropdown.Item><Link to={"/manager-evaluacion-grupal"}>Grupal</Link></NavDropdown.Item>
    </NavDropdown>
    <Nav.Link href="#link"><Link onClick={handleClick}>Logout</Link></Nav.Link>
  </Nav>
</Navbar.Collapse>
      </Container>
    </Navbar>) : (<Navbar bg="dark" expand="lg" variant="dark">
      <Container>
        <Navbar.Brand href="#home">
            <img
            src={imgLogo}
            alt="logo-learning"
            width="120"
            />
            </Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
<Navbar.Collapse id="basic-navbar-nav">
  <Nav className="me-auto">
    <Nav.Link href="#home">Evaluacion</Nav.Link>
    <Nav.Link href="#link">Perfil</Nav.Link>
    <Nav.Link href="#link"><Link onClick={handleClick}>Logout</Link></Nav.Link>
  </Nav>
</Navbar.Collapse>
      </Container>
    </Navbar>)}
      </>
    ) ;
} ;
export default NavbarMain