<%-- 
    Document   : message
    Created on : 17-Apr-2024, 11:23:42 am
    Author     : Rushik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            h1 {
    color: #333333;
}

form {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 50%;
    margin: auto;
}

textarea {
    width: 90%;
    height: 300px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

input[type="submit"] {
    background-color: #0058b7;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #093d74;
}
        </style>
    </head>
    <body>
       
        <form action="/e_commerce/Message" method="post">
             <h1>Enter your message</h1>
            Message:
            <br>
            <textarea name="message"  required></textarea><br>
            <input type="hidden" value="<%=request.getParameter("seller_email")%>" name="seller_email">
            <input type="submit" value="send message">
        </form>
    </body>
</html>
