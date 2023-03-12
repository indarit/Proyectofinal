/* eslint-disable react/style-prop-object */
import Form from 'react-bootstrap/Form';
import '../../../App.css'


function AutoCloseExample(props) {
  console.log("!", props)
  return (
    <>
    <div>
    <h2 className='text-start'>{props.title}</h2>
    <Form.Select className="selector" aria-label="Default select example">
      <option className="boton-seleccionar">Seleccionar</option>
      {
        props.array.map((obj)=>{
          return(
          <option className="opciones-del-boton-seleccionar" value={obj.value}>{obj.text}</option>
          )           
        }) 
      }
      {/* <option>Open this select menu</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option> */}
    </Form.Select>


    </div>
    </>
  );
}

export default AutoCloseExample;