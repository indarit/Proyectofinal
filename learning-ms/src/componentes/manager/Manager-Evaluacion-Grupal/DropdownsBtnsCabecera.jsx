import { DropdownButton, Dropdown, Container } from "react-bootstrap";
import { dataAlumnosContext } from "../context/dataAlumnosContext";
import { useContext, useState } from "react";

const DropdownsBtnsCabecera = () => {
  const {
    modulos,
    gruposCode,
    semanaBoton,
    setGrupoCode,
    setModuloId,
    setSemana,
    grupoCode,
    semana,
  } = useContext(dataAlumnosContext);

  const [exFun, setExFun] = useState(false);
  const [exFunMod, setExFunMod] = useState(false);
  const [exFunSem, setExFunSem] = useState(false);

  const numeros = [];
  const limite = semanaBoton[0]?.total_semanas;
  for (let i = 1; i <= limite; i++) {
    numeros.push(i);
  }

  const handleChangeModulo = (id) => {
    setModuloId(id);
    setExFunMod(true);
  };

  const handleChangeGrupo = (code) => {
    setGrupoCode(code);
    setExFun(true);
  };

  const handleChangeSemana = (code) => {
    setSemana(code);
    setExFunSem(true);
  };

  return (
    <Container className="container-cabecera">
      <DropdownButton
        id="dropdown-basic-button"
        title={exFun ? grupoCode : "Grupos"}
        size="md"
        className="alineacion-btns-cabecera"
      >
        {gruposCode.map((item, index) => (
          <Dropdown.Item
            href="#/action-1"
            value={item.codigo_grupo}
            onClick={() => handleChangeGrupo(item.codigo_grupo)}
          >
            {item.codigo_grupo}
          </Dropdown.Item>
        ))}
      </DropdownButton>

      <DropdownButton
        id="dropdown-basic-button"
        title={exFunMod ? semanaBoton[0].nombre_modulo : "Modulos"}
        className="btn-cabecera alineacion-btns-cabecera"
      >
        {modulos.map((item, index) => (
          <Dropdown.Item
            href="#/action-1"
            value={item.id}
            onClick={() => handleChangeModulo(item.id)}
          >
            {item.nombre_modulo}
            {item.id}
          </Dropdown.Item>
        ))}
      </DropdownButton>

      <DropdownButton
        id="dropdown-basic-button"
        title={exFunSem ? semana : "Semanas"}
        className="btn-cabecera alineacion-btns-cabecera"
      >
        {numeros.map((item, index) => (
          <Dropdown.Item
            href="#/action-1"
            value={item}
            onClick={() => handleChangeSemana(item)}
          >
            {item}
          </Dropdown.Item>
        ))}
      </DropdownButton>
    </Container>
  );
};

export default DropdownsBtnsCabecera;
