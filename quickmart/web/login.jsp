<%-- 
    Document   : login
    Created on : 08-Apr-2024, 10:57:48 am
    Author     : Dipak Paliya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            /* Resetting default margin and padding */
body, html {
  margin: 0;
  padding: 0;
}

/* Styling the form container */
form {
  margin: 50px auto;
  padding: 20px;
  max-width: 400px;
color: white;
  border-radius: 10px;
box-shadow: 0px 0px 10px white;
}


/* Styling the form heading */
h1 {
  text-align: center;
  margin-bottom: 20px;
}

/* Styling the form inputs and labels */
form input[type="email"],
form input[type="password"],
form select {
  width: 100%;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

/* Styling the submit button */
input[type="submit"] {
  width: 100%;
  padding: 10px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

/* Styling the registration link */
p a {
  text-decoration: none;
  color: #007bff;
}

p a:hover {
  text-decoration: underline;
}

/* Responsive styles */
@media screen and (max-width: 600px) {
  form {
    width: 90%;
    max-width: none;
  }
}

        </style>
    </head>
    <body style="background-color: black;">
        
      
        <form action="/e_commerce/Login" method="post">
              <h1>Login now!</h1>
            Login as : 
            <select name="role">
                <option value="customer">Customer</option>
                <option value="seller">Seller</option>
            </select>
            <br>
            Email: <input type="email" name="email" required> 
            <br> 
            Password: <input type="password" name="password" required>
            <br> 
             <p>Not registred? <a href="registration.jsp">Go to registration</a></p>
            <input type="submit" value="Login">
        </form>
        
    </body>
</html>
