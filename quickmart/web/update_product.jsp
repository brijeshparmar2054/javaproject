<%-- 
    Document   : update_product
    Created on : 17-Apr-2024, 10:16:37 am
    Author     : Rushik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        form {
    max-width: 400px;
    margin: 40px auto;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

label {
    display: block;
    margin-top: 10px;
}

input[type="text"],
select,
input[type="file"] {
    width: 95%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 15px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

input[type="submit"] {
    background-color: #004b9a;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Responsive design for smaller screens */
@media (max-width: 768px) {
    form {
        padding: 15px;
    }

    h1 {
        font-size: 24px;
    }

    input[type="text"],
    select,
    input[type="file"] {
        margin-bottom: 10px;
    }
}    
            
            
            
        </style>
    </head>
    
    <body>

        <form action="/e_commerce/UpdateProduct" method="post" enctype="multipart/form-data" id="form1">
            <h1>
                Update Product
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
            <input type="file" id="image" name="new_image_name"  required>

            <input type="hidden" value="${sessionScope.session_email}" name="seller_email">
            <input type="hidden" value="<%=request.getParameter("sno")%>"   name="sno">
            <input type="hidden" value="<%=request.getParameter("product_image")%>" name="old_image_name">
            <input type="submit" value="Update">
            
        </form>
    </body>
</html>
