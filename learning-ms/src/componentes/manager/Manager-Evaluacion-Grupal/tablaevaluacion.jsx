import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import "../../../App.css";
import { dataAlumnosContext } from "../context/dataAlumnosContext";
import { useContext } from "react";

function BasicExample() {
  const { groupData } = useContext(dataAlumnosContext);

  return (
    <>
      <Table striped bordered hover>
        <thead className="header-table-evaluation">
          <tr>
            <th>Nombre</th>
            <th>Asistencia 1</th>
            <th>Asistencia 2</th>
            <th>Tareas</th>
          </tr>
        </thead>
        <tbody>
          {groupData.map((item, index) => (
            <tr>
              <td>{item.firstname}</td>
              <td class>
                <div class="asistencia1">
                  <select className="form-select" placeholder="Hola">
                    <option value="0" selected disabled>
                      {item.status_asist1}
                    </option>
                    <option value="1">Yes</option>
                    <option value="2">Delay</option>
                    <option value="3">Unnoticed Delay</option>
                    <option value="4">Missing</option>
                    <option value="5">Unnoticed Missing</option>
                  </select>
                </div>
              </td>

              <td class>
                <div class="asistencia2">
                  <select
                    className="form-select"
                    aria-label="Default select example"
                  >
                    <option value="0" selected disabled>
                      {item.status_asist2}
                    </option>
                    <option value="1">Yes</option>
                    <option value="2">Delay</option>
                    <option value="3">Unnoticed Delay</option>
                    <option value="4">Missing</option>
                    <option value="5">Unnoticed Missing</option>
                  </select>
                </div>
              </td>
              <td class>
                <div class="tarea">
                  <select
                    className="form-select"
                    aria-label="Default select example"
                  >
                    <option value="0" selected disabled>
                      {item.status_tarea}
                    </option>
                    <option value="1">Done</option>
                    <option value="2">Uncomplete</option>
                    <option value="3">Not Done</option>
                  </select>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
      <Button className="save-buttom">Guardar</Button>{" "}
    </>
  );
}

export default BasicExample;
