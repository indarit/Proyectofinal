import Context from "../context/UserContext";
import { useCallback, useContext } from "react";
import loginService from "../../static/login";

export default function useUser() {
  const { jwt,setJWT,isadmin,setIsadmin} = useContext(Context);

  const login = useCallback(
    ({ email, password }) => {
      loginService({ email, password })
        .then(({jwt, id, isadmin}) => {
          window.sessionStorage.setItem('jwt', jwt)
          window.sessionStorage.setItem('id', id)
          window.sessionStorage.setItem ('isadmin', isadmin)
          setJWT(jwt)
          setIsadmin(isadmin)  
        })
        .catch((err) => {
          window.sessionStorage.removeItem('jwt')
          console.error(err);
        });
    },
    [setJWT,setIsadmin]
  );
  const logout = useCallback(() => {
    window.sessionStorage.removeItem('jwt')
    window.sessionStorage.removeItem('isadmin')
    setJWT(null);
    setIsadmin(null);
  }, [setJWT,setIsadmin]);

  return {
    isAdmin : Boolean(isadmin),
    isLogged: Boolean(jwt),
    login,
    logout,
  };
}