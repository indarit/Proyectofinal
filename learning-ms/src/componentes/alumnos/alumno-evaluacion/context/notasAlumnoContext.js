import { useEffect } from "react";
import { useState } from "react";
import { createContext } from "react";

export const notasAlumnoContext = createContext({});

export const AlumnoNotasContextProvider = ({ children }) => {
  const URL = "http://localhost:4000";
  const userId = window.sessionStorage.getItem("id");
  const [userData, setUserData] = useState([]);
  const [loading, setLoading] = useState(true);

  console.log(userData);

  useEffect(() => {
    const getDataAwait = async () => {
      fetch(`${URL}/evaluacion/${userId}`)
        .then((res) => res.json())
        .then((data) => {
          setUserData(data);
          setLoading(false);
        })
        .catch((error) => console.log(error));
    };

    getDataAwait();
  }, [userId]);

  if (loading) {
    return <div>Cargando...</div>;
  }
  return (
    !loading && (
      <notasAlumnoContext.Provider value={userData}>
        {children}
      </notasAlumnoContext.Provider>
    )
  );
};
