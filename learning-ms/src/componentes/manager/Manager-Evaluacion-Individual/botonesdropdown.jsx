/* eslint-disable react/style-prop-object */
import Dropdown from 'react-bootstrap/Dropdown';
import Form from 'react-bootstrap/Form';
import './botonesdropdown.css'


function AutoCloseExample(props) {
  console.log("!", props)
  return (
    <>
    <div>
    <h2 className='text-start'>{props.title}</h2>
    <Form.Select className="selector" aria-label="Default select example">
      <option className="opciones">Seleccionar</option>
      {
        props.array.map((obj)=>{
          return(
          <option className="opciones" value={obj.value}>{obj.text}</option>
          )           
        }) 
      }
      {/* <option>Open this select menu</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option> */}
    </Form.Select>


    </div>
      {/* <Dropdown className="d-inline mx-2">
        <Dropdown.Toggle id="dropdown-autoclose-true">
          Grupo
        </Dropdown.Toggle>

        <Dropdown.Menu>
          <Dropdown.Item href="#">JUL22-ES</Dropdown.Item>
          <Dropdown.Item href="#">JUL22-EN</Dropdown.Item>
          <Dropdown.Item href="#">MAR23-ES</Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown>

      <Dropdown className="d-inline mx-2">
        <Dropdown.Toggle id="dropdown-autoclose-true">
          Módulo
        </Dropdown.Toggle>

        <Dropdown.Menu>
          <Dropdown.Item href="#">HTML/CSS</Dropdown.Item>
          <Dropdown.Item href="#">JavaScript I</Dropdown.Item>
          <Dropdown.Item href="#">JavaScript II</Dropdown.Item>
          <Dropdown.Item href="#">JavaScript III</Dropdown.Item>
          <Dropdown.Item href="#">React</Dropdown.Item>
          <Dropdown.Item href="#">Node</Dropdown.Item>
          <Dropdown.Item href="#">SQL</Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown>

      <Dropdown className="d-inline mx-2">
        <Dropdown.Toggle id="dropdown-autoclose-true">
          Semana
        </Dropdown.Toggle>

        <Dropdown.Menu>
          <Dropdown.Item href="#">1</Dropdown.Item>
          <Dropdown.Item href="#">2</Dropdown.Item>
          <Dropdown.Item href="#">3</Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown> */}
    </>
  );
}

export default AutoCloseExample;