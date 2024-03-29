import React, { useEffect } from "react";
import { Form, Button, Modal } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import { Link } from "react-router-dom";
import signUp from "../../static/signUp";

const RegisterModal = () => {
  /*SIGN_UP VALUES*/
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [isadmin, setIsadmin] = useState(false);
  const [accountStatus, setAccountStatus] = useState(false);
  let goToRegister = false;

  let body = "";

  /*MODAL_CONTROL*/
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const navigation = useNavigate();

  const refreshPage = () => {
    navigation(0);
  };

  if (email.length > 0 && password.length > 0) {
    goToRegister = true;
  }

  /*FETCH*/

  const signUpUser = async (e) => {
    e.preventDefault();
    body = await signUp({
      email,
      password,
      isadmin,
    });
    if (body.isAuthenticated) {
      setAccountStatus(true);
    } else {
      setAccountStatus(false);
    }
  };

  useEffect(() => {
    setTimeout(() => {
      if (accountStatus) refreshPage("/");
    }, 2000);
  });

  return (
    <>
      <h5 className="register-link">
        Registrate <Link onClick={handleShow}>aqui.</Link>
      </h5>

      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Registro</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form className="formulario-register">
            <Form.Group className="mb-3" controlId="formBasicEmail">
              <Form.Label>Correo Electronico</Form.Label>
              <Form.Control
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                type="email"
                placeholder="Enter email"
              />
            </Form.Group>

            <Form.Group className="mb-3" controlId="formBasicPassword">
              <Form.Label>Contraseña</Form.Label>
              <Form.Control
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                type="password"
                placeholder="Password"
              />
            </Form.Group>

            <Form.Check
              defaultValue={isadmin}
              onChange={(e) => {
                e.target.checked ? setIsadmin(true) : setIsadmin(false);
              }}
              type="switch"
              id="custom-switch"
              label="Admin"
              className="checked-register"
            />
          </Form>
        </Modal.Body>
        <Modal.Footer>
          {accountStatus ? (
            <h5 className="registro-mensaje">Usuario Registrado</h5>
          ) : (
            <></>
          )}

          <Button
            className="register-button"
            disabled={goToRegister ? false : true}
            variant="primary"
            onClick={signUpUser}
          >
            Registrar
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default RegisterModal;
