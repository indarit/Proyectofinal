const ENDPOINT = 'http://localhost:4000'

export default function login ({email, password}){
  return fetch (`${ENDPOINT}/user/signin`, {
    method : 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email,password })
  }).then(res => {
   
    return res.json()
  }).then(res => { 
    alert(res.error);
    const {jwt,id,isadmin} = res 
  
   return {jwt,id,isadmin}
  }) 
}