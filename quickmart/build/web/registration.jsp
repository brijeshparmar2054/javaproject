<%-- 
    Document   : registration
    Created on : 08-Apr-2024, 9:34:11 am
    Author     : Dipak Paliya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <style>
            
            
     /* Resetting default margin and padding */
body, html {
  margin: 0;
  padding: 0;
}

/* Styling the background video */


/* Styling the form container */
form {
  margin: 50px auto;
  padding: 20px;
  max-width: 400px;
box-shadow: 0px 0px 10px #ffffffad;
  border-radius: 10px;
  color: white;

}

/* Styling the form heading */
h1 {
  text-align: center;
  margin-bottom: 20px;
}

/* Styling the form inputs and labels */
form input[type="text"],
form input[type="email"],
form input[type="tel"],
form input[type="password"],
form textarea,
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

/* Styling the login link */
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
    <body style="background-color:black;">
        

       
        <form action="/e_commerce/Registration" method="post">
             <h1>Register now!</h1>
            Register as : 
            <select name="role">
                <option value="customer">Customer</option>
                <option value="seller">Seller</option>
            </select>
            <br> 
            Name: <input type="text" name="name" required>
            <br> 
            Email: <input type="email" name="email" required> 
            <br> 
            Mobile no. : <input type="tel" name="mobile_no" pattern="[0-9]{10}" maxlength="10" required> 
            <br> 
            Address : <textarea name="address" required></textarea>
            <br> 
            Password: <input type="password" name="password" required> 
            <br> 
            <p>Already Registered? <a href="login.jsp">Go to Login</a></p>
            <input type="submit" value="Register">
        </form>
        
    </body>
</html>
