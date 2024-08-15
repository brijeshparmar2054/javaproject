<%-- 
    Document   : feedback
    Created on : 10-Apr-2024, 3:11:13?pm
    Author     : Dipak Paliya
--%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
     


h1 {
    text-align: center;
}

#form1 {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
   box-shadow: 0px 0px 10px #ffffffb8;
    border-radius: 5px;
    color: white;
    margin-top: 40px;
}

input[type="text"],
input[type="email"],
textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="radio"] {
    margin-right: 10px;
}

input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}



@media (max-width: 600px) {
    form {
        padding: 10px;
    }
}

            
            
        </style>
        
        
    </head>
    <body style="background-color: black;">
              
  
    <form action="/e_commerce/Feedback" method="post" id="form1">
              <h1>Feedback Form</h1>
        <label for="name">Your Name:</label><br>
        <input type="text"  name="name" required><br><br>
        
        <label for="name">How do you rate your overall experience?</label><br><br>
         <input type="radio" name="rating" value="Excellent">Excellent
         <input type="radio" name="rating" value="Good">Good
         <input type="radio" name="rating" value="Poor">Poor
         
         <br><br>
        
        <label for="email">Your Email:</label><br>
        <input type="email"  name="email" required><br><br>
        
        <label for="feedback">Comments:</label><br>
        <textarea id="feedback" name="feedback" rows="4" required></textarea><br><br>
        
        <input type="submit" value="Submit">
    </form>
        <%@include file="footer.jsp" %>
    </body>
</html>
