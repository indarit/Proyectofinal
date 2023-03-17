import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import "../../../App.css";
import { dataAlumnosContext } from "../context/dataAlumnosContext";
import { useContext } from "react";

function BasicExample() {
  const { groupData, setGroupData, handleSaveAll } =
    useContext(dataAlumnosContext);

  const handleSelectChange = (event, id) => {
    const { value, name } = event.target;
    const newTableData = groupData.map((item) => {
      if (item.id === id) {
        return {
          ...item,
          [name]: value,
        };
      }
      return item;
    });
    console.log("value", value, name);
    console.log(id);
    setGroupData(newTableData);
  };

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
                  <select
                    className="form-select"
                    placeholder="Hola"
                    onChange={(e) => handleSelectChange(e, item.alumnos_id)}
                  >
                    <option value="0" selected disabled>
                      {item.status_asist1}
                    </option>
                    <option value="Yes">Yes</option>
                    <option value="Delay">Delay</option>
                    <option value="Unnoticed Delay">Unnoticed Delay</option>
                    <option value="Missing">Missing</option>
                    <option value="Unnoticed Missing">Unnoticed Missing</option>
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
                    <option value="Yes">Yes</option>
                    <option value="Delay">Delay</option>
                    <option value="Unnoticed Delay">Unnoticed Delay</option>
                    <option value="Missing">Missing</option>
                    <option value="Unnoticed Missing">Unnoticed Missing</option>
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
                    <option value="Done">Done</option>
                    <option value="Uncomplete">Uncomplete</option>
                    <option value="Not Done">Not Done</option>
                  </select>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
      <Button className="save-buttom" onClick={handleSaveAll}>
        Guardar
      </Button>{" "}
    </>
  );
}

export default BasicExample;
