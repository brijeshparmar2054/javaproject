<%-- 
    Document   : order
    Created on : 09-Apr-2024, 6:50:46?pm
    Author     : Dipak Paliya
--%>

<%@include file="navbar.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>


            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }


            #form1 {
                max-width: 400px;
                margin: 0 auto;
                color: white;

                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgb(225 217 217);
                margin-top: 50px;
            }


            #background-video {
                width: 100vw;
                height: 100vh;
                object-fit: cover;
                position: fixed;
                left: 0;
                right: 0;
                top: 0;
                bottom: 0;
                z-index: -1;
            }

            input[type="text"],
            textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Radio button styles */
            input[type="radio"] {
                margin-right: 5px;
            }

            /* Submit button styles */
            input[type="submit"] {
                background-color: #0063cd;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Submit button hover effect */
            input[type="submit"]:hover {
                background-color: #064e9c;
            }

            /* Responsive styles */
            @media screen and (max-width: 600px) {
                form {
                    width: 90%;
                }
            }
        </style>
    </head>
    <body>
        <%
            String seller_email = request.getParameter("seller_email");
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price"); // Renamed to priceStr for clarity

            double price = 0.0;  // Default value if conversion fails or priceStr is null

            
                price = Double.parseDouble(priceStr);
    System.out.println(price);
    
    int intPrice = (int) price;  // Directly convert double to int
    System.out.println("Integer price: " + intPrice);
            
            // Default value in case the conversion fails


        %>

        <video id="background-video" autoplay loop muted>
            <source src="video/v4.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>

       <form action="/e_commerce/Order" method="post" id="form1">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name1"><br>
        
        <label for="address">Address:</label><br>
        <textarea id="address" name="address1"></textarea><br><br>
        
        <button type="button" onclick="decreaseQuantity()"  style="width: 10%;
    color: white;
    background-color: #0000002b;
    padding: 3px 10px; " ><i class="fa fa-minus" aria-hidden="true"></i></button>
        <input type="text" id="quantity" name="quantity" value="1" style="width:10%; text-align: center;">
        <button type="button" onclick="increaseQuantity()" style="width: 10%;
    color: white;
    background-color: #0000002b;
    padding: 3px 10px;" ><i class="fa fa-plus" aria-hidden="true"></i></button>
        <p id="total"><%=intPrice  %></p>
        <h4>Select payment mode</h4>
        <input type="radio" name="payment_mode" value="cash"> Cash on Delivery<br><br>
        
        <input type="hidden" value="<%= name %>" name="name">
        <input type="hidden" value="<%= seller_email %>" name="seller_email">
        <input type="hidden" value="<%= name %>" name="product_name">
        <input type="hidden" value="0" id="hidden_total" name="total">
        
        <input type="submit" value="Order now">
    </form>
            
            
      <script>
        function decreaseQuantity() {
            var quantityInput = document.getElementById('quantity');
            var currentQuantity = parseInt(quantityInput.value);

            if (currentQuantity > 1) {
                quantityInput.value = currentQuantity - 1;
                 var a = parseFloat(document.getElementById('quantity').value);
      var b=<%=intPrice  %>;
      var t=a*b;
      var c=document.getElementById("total");
      c.innerHTML=t.toFixed(2);
      
            }
        }

        function increaseQuantity() {
            var quantityInput = document.getElementById('quantity');
            var currentQuantity = parseInt(quantityInput.value);

            quantityInput.value = currentQuantity + 1;
             var a = parseFloat(document.getElementById('quantity').value);
      var b=<%=intPrice  %>;
      var t=a*b;
      var c=document.getElementById("total");
      c.innerHTML=t.toFixed(2);
      
      var d=document.getElementById("hidden_total");
      d.value=t;
        }
        
        
        
     
    </script>

    </body>
</html>
