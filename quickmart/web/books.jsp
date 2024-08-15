<%-- 
    Document   : books
    Created on : 09-Apr-2024, 4:35:43?pm
    Author     : Dipak Paliya
--%>
<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <style>
           
          .cart img{
                width: 100%;
                height:150px;
            }

 .cart:hover{
                box-shadow: 5px 5px 10px ;
            }

            .parent1 {
                margin-top: 50px;
                display: grid;
                grid-template-columns: repeat(6, 1fr);
                grid-template-rows: auto;
                grid-column-gap: 10px;
                grid-row-gap: 10px;
                margin: 0px 5%;
                margin-top: 40px;
            }
            .parent1 div {
                text-align: center;
                border: 1px solid #ccc;
                padding-bottom: 15px;
                box-shadow: 6px 7px 2px #dddddd;
            }

            p{
                font-size: 14px;
                margin: 10px 0px;
            }
            h5{
                margin-top: 10px;
            }
            #submitb{
                color: white;
                border-radius: 5px;
                background-color: #eb0000;
                border: 1px solid #0000003b;
                padding: 3px 25px;
                 cursor: pointer;
            }
            #submitb:hover{
                background-color: #af0202;
            }


        </style>
    </head>
    <body>
          
<div class="parent1">
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM product_info WHERE category = 'Books'");
            while (rs.next()) {
    %>
   
            <div class="cart">
               <img src="images/<%= rs.getString("product_image_name") %>">
    <h5>Product Name: <%= rs.getString("name") %></h5>
    <p>Price: <%= rs.getString("price") %></p>
    <p>Category: <%= rs.getString("category") %></p>

       
        
    <form action="order.jsp" method="post">
        <input type="hidden" value="<%= rs.getString("name") %>" name="name">
        <input type="hidden" value="<%= rs.getString("seller_email") %>" name="seller_email">
        <input type="hidden" value=" <%= rs.getString("price") %>" name="price">

     

        <input type="submit" value="Purchase" id="submitb">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
    </form>
            </div>
    <%
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</div>
    <%@include file="footer.jsp" %>
    </body>
</html>
