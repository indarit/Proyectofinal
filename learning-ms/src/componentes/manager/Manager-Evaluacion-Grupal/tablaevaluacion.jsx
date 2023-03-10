import Table from 'react-bootstrap/Table';
import './tablaevaluacion.css';

function BasicExample() {
  return (
    <Table striped bordered hover>
      <thead className="header-table">
        <tr>
          <th>Nombre</th>
          <th>Asistencia 1</th>
          <th>Asistencia 2</th>
          <th>Tareas</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Karelys</td>
            <td  class> 
                <div class="asistencia1">
                    <select class="form-select" placeholder="Seleccionar">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>
            </td>

            <td  class> 
                <div class="asistencia2">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>

            </td>
            <td  class> 
                <div class="tarea">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Hecha</option>
                    <option value="2">No hecha</option>
                    <option value="3">Incompleta</option>
                    </select>
        
                </div>
            </td>
        </tr>
        <tr>
          <td>Linda</td>         
          <td  class> 
                <div class="asistencia1">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>
            </td>

            <td  class> 
                <div class="asistencia2">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>

            </td>
            <td  class> 
                <div class="tarea">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Hecha</option>
                    <option value="2">No hecha</option>
                    <option value="3">Incompleta</option>
                    </select>
        
                </div>
            </td>

        </tr>
        <tr>
          <td>Andrea</td>
            <td  class> 
                <div class="asistencia1">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>
            </td>

            <td  class> 
                <div class="asistencia2">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>

            </td>
            <td  class> 
                <div class="tarea">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Hecha</option>
                    <option value="2">No hecha</option>
                    <option value="3">Incompleta</option>
                    </select>
        
                </div>
            </td>
        </tr>
<tr>
          <td>Luis</td>          
          <td  class> 
                <div class="asistencia1">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>
            </td>

            <td  class> 
                <div class="asistencia2">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>

            </td>
            <td  class> 
                <div class="tarea">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Hecha</option>
                    <option value="2">No hecha</option>
                    <option value="3">Incompleta</option>
                    </select>
        
                </div>
            </td>

        </tr>
        <tr>
          <td>Litzy</td>
            <td  class> 
                <div class="asistencia1">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>
            </td>

            <td  class> 
                <div class="asistencia2">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>

            </td>
            <td  class> 
                <div class="tarea">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Hecha</option>
                    <option value="2">No hecha</option>
                    <option value="3">Incompleta</option>
                    </select>
        
                </div>
            </td>
        </tr>
        <tr>
          <td>Natalia</td>
            <td  class> 
                <div class="asistencia1">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>
            </td>

            <td  class> 
                <div class="asistencia2">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Asistió</option>
                    <option value="2">Asistió tarde CA</option>
                    <option value="3">Asistió tarde SA</option>
                    <option value="4">No asistió CA</option>
                    <option value="5">No asistió SA</option>
                    </select>
        
                </div>

            </td>
            <td  class> 
                <div class="tarea">
                    <select class="form-select" aria-label="Default select example">
                    <option value="0"></option>
                    <option value="1">Hecha</option>
                    <option value="2">No hecha</option>
                    <option value="3">Incompleta</option>
                    </select>
        
                </div>
            </td>
        </tr>
      </tbody>
    </Table>
  );
}

export default BasicExample;