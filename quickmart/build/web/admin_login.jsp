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
    </head>
    <body>
        <h1>Login Admin!</h1>
        <form action="/e_commerce/AdminLogin" method="post">
           
            <br>
            Email: <input type="email" name="email" required> 
            <br> 
            Password: <input type="password" name="password" required>
            <br> 
             
            <input type="submit" value="Login">
        </form>
        
    </body>
</html>
