import { useEffect } from "react";
import { useState } from "react";
import { createContext } from "react";

export const dataAlumnosContext = createContext({});

export const DataAlumnosContextProvider = ({ children }) => {
  const URL = "http://localhost:4000";
  const [groupData, setGroupData] = useState([]);
  const [gruposCode, setGruposCode] = useState([]);
  const [semanaBoton, setSemanaBoton] = useState([]);
  const [modulos, setModulos] = useState([]);
  const [grupoCode, setGrupoCode] = useState("JUL2022SP");
  const [moduloId, setModuloId] = useState("2");
  const [semana, setSemana] = useState("2");
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const getDataAwait = async () => {
      fetch(
        `${URL}/evaluacion?grupo=${grupoCode}&moduloId=${moduloId}&semana=${semana}`
      )
        .then((res) => res.json())
        .then((data) => {
          setGroupData(data);
          setLoading(false);
        })
        .catch((error) => console.log(error));
    };

    getDataAwait();
  }, [grupoCode, moduloId, semana]);

  useEffect(() => {
    const getDataAwait = async () => {
      fetch(`${URL}/grupos`)
        .then((res) => res.json())
        .then((data) => {
          setGruposCode(data);
          setLoading(false);
        })
        .catch((error) => console.log(error));
    };

    getDataAwait();
  }, []);

  useEffect(() => {
    const getDataAwait = async () => {
      fetch(`${URL}/modulo`)
        .then((res) => res.json())
        .then((data) => {
          setModulos(data);
          setLoading(false);
        })
        .catch((error) => console.log(error));
    };

    getDataAwait();
  }, []);

  useEffect(() => {
    const getDataAwait = async () => {
      fetch(`${URL}/modulo/${moduloId}`)
        .then((res) => res.json())
        .then((data) => {
          setSemanaBoton(data);
          setLoading(false);
        })
        .catch((error) => console.log(error));
    };

    getDataAwait();
  }, [moduloId]);

  const handleSaveAll = async () => {
    try {
      const response = await fetch(`${URL}/evaluacion`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(groupData),
      });
      const data = await response.json();
      console.log(data);
    } catch (error) {
      console.error(error);
    }
  };

  if (loading) {
    return <div>Cargando...</div>;
  }
  return (
    !loading && (
      <dataAlumnosContext.Provider
        value={{
          groupData,
          modulos,
          gruposCode,
          semana,
          moduloId,
          semanaBoton,
          setGrupoCode,
          setModuloId,
          setSemana,
          grupoCode,
          setGroupData,
          handleSaveAll,
        }}
      >
        {children}
      </dataAlumnosContext.Provider>
    )
  );
};
