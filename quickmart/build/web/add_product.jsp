
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add product</title>
    <style>

        h1{
            text-align: center;
            font-size: 25px;
            margin: 15px auto;
        }
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

#form1 {
    max-width: 400px;
    margin: 0 auto;
    margin-top: 50px;
    padding: 20px;
  color: white;
    border-radius: 5px;
    box-shadow: 0 0 10px rgb(0 0 0 / 48%);
}


input[type="text"],
select,
input[type="file"],
input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #424842;
    color: white;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color:green;
    color:white;
}
#deshbutton{
    cursor:pointer;
    position: absolute;
    top: 65px;
    border: 1px solid #000000a6;
    left: 91px;
    padding: 4px 13px;
    color: white;
    box-shadow: 0px 0px 10px #ffffff87;
    background: #b11818cc;
}
#deshbutton:hover{
    background-color: #8c1616cc;
}

@media screen and (max-width: 600px) {
    form {
        width: 90%;
    }
}

    </style>
</head>
<body style="background-color:black;">
         
    <button onclick="window.location.href='seller_profile.jsp'" id="deshbutton">Dashboard<i class="fa fa-home" aria-hidden="true"></i></button>
    <form action="/e_commerce/AddProduct" method="post" enctype="multipart/form-data" id="form1">
        <h1>
            Add Products
        </h1
    <label for="productName">Product Name:</label>
    <input type="text" id="productName" name="productName" required>
    
    <label for="price">Price:</label>
    <input type="text" id="price" name="price" required>
    
    <label for="category">Category:</label>
    <select id="category" name="category" required>
        <option value="Electronics">Electronics</option>
        <option value="Clothing">Clothing</option>
        <option value="Books">Books</option>
        <!-- Add more categories as needed -->
    </select>

    
    <label for="image">Image:</label>
    <input type="file" id="image" name="image"  required>
    
    <input type="hidden" value="${sessionScope.session_email}" name="seller_email">
    <input type="submit" value="Add">
</form>
</body>
</html>