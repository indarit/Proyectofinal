import { useEffect } from "react";
import { useState } from "react";
import { createContext } from "react";

export const infoUserContext = createContext({});

export const InfoUserContextProvider = ({ children }) => {
  const URL = "http://localhost:4000";
  const userId = window.sessionStorage.getItem("id");
  const [userData, setUserData] = useState([]);
  const [loading, setLoading] = useState(true);

 

  useEffect(() => {
    const getDataAwait = async () => {
      fetch(`${URL}/alumnos/${userId}`)
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
    return <div>Cargando...</div>
  }
  return (
    !loading && (
      <infoUserContext.Provider value={userData}>
        {children}
      </infoUserContext.Provider>
    )
  );
};
