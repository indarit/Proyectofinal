export default async function signUp({
    email,
    password,
    isadmin
  }) {
    const requestOptions = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({email,password,isadmin}),
    };
  
    console.log(requestOptions);
    const response = await fetch(
      "http://localhost:4000/user/signup",
      requestOptions
    );
    const body = await response.json();
    return body;
  }