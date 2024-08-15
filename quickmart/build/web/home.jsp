<%-- 
    Document   : navbar
    Created on : 09-Apr-2024, 10:02:26?am
    Author     : Rushik
--%>
<%@page import="java.sql.*"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>

            .itemheading{
                margin: 30px 0px;
                text-align: center;
                color: black;
                background-color: white;

                box-shadow: 0px 0px 10px #605252;
            }
            .parent1 {
                display: grid;
                grid-template-columns: repeat(6, 1fr);
                grid-template-rows: auto;
                grid-column-gap: 10px;
                margin: 0px 5%;
            }
             .cart {
                text-align: center;
                border: 1px solid #ccc;
                padding-bottom: 15px;
                box-shadow: 6px 7px 2px #dddddd;
            }


            .cart:hover{
                box-shadow: 5px 5px 10px ;
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

            .cart img{
                width: 100%;
                height:150px;
            }

            .seebtn{
                background-color: #0031bd;
                border: 1px solid #000000ab;
                border-radius: 5px;
                display: block;
                font-size: 15px;
                color: white;
                padding: 6px 42px;
                margin: 0px auto;
                margin-top: 15px;
                text-align: center;
            }

            .seebtn:hover{
                background-color: #0a277a;
            }
        </style>

    </head>

    <body>



        <h1 class="itemheading">ELECTRONICS</h1>
        <div class="parent1">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
                    Statement st = conn.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM product_info WHERE category = 'Electronics'");
                    int counter = 0;
                    while (rs.next() && counter <= 5) {
            %>
           <div class="cart" >
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
                    counter++;
                }
            %>
        </div>
        <!--   <button type="button" class="btn_2" onclick="fun1()">See more</button>-->
        <button onclick="window.location.href = 'http://localhost:8080/e_commerce/electonic.jsp'" class="seebtn"><i class="fa fa-shopping-cart" aria-hidden="true"></i> See more</button>


        <h1 class="itemheading">CLOTHING</h1>
        <div class="parent1">
            <%
                Statement st2 = conn.createStatement();
                ResultSet rs2 = st.executeQuery("SELECT * FROM product_info WHERE category = 'Clothing'");
                int counter2 = 0;
                while (rs2.next() && counter2 <= 5) {
            %>
           <div class="cart" >
    <img src="images/<%= rs2.getString("product_image_name") %>">
    <h5>Product Name: <%= rs2.getString("name") %></h5>
    <p>Price: <%= rs2.getString("price") %></p>
    <p>Category: <%= rs2.getString("category") %></p>

       
        
    <form action="order.jsp" method="post">
        <input type="hidden" value="<%= rs2.getString("name") %>" name="name">
        <input type="hidden" value="<%= rs2.getString("seller_email") %>" name="seller_email">
        <input type="hidden" value=" <%= rs2.getString("price") %>" name="price">

     

        <input type="submit" value="Purchase" id="submitb">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
    </form>
</div>
            <%
                    counter2++;
                } %>
        </div>






        <button onclick="window.location.href = 'http://localhost:8080/e_commerce/clothing.jsp'" class="seebtn"><i class="fa fa-shopping-cart" aria-hidden="true"></i> See more</button>


        <h1 class="itemheading">BOOKS</h1>
        <div class="parent1">
            <%
                Statement st3 = conn.createStatement();
                ResultSet rs3 = st.executeQuery("SELECT * FROM product_info WHERE category = 'Books'");
                int counter3 = 0;
                while (rs3.next() && counter3 <= 5) {
            %>
          <div class="cart" >
    <img src="images/<%= rs3.getString("product_image_name") %>">
    <h5>Product Name: <%= rs3.getString("name") %></h5>
    <p>Price: <%= rs3.getString("price") %></p>
    <p>Category: <%= rs3.getString("category") %></p>

       
        
    <form action="order.jsp" method="post">
        <input type="hidden" value="<%= rs3.getString("name") %>" name="name">
        <input type="hidden" value="<%= rs3.getString("seller_email") %>" name="seller_email">
        <input type="hidden" value=" <%= rs3.getString("price") %>" name="price">

     

        <input type="submit" value="Purchase" id="submitb">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
    </form>
</div>
            <%
                    counter3++;
                } %>
        </div>


        <button onclick="window.location.href = 'http://localhost:8080/e_commerce/books.jsp'" class="seebtn"><i class="fa fa-shopping-cart" aria-hidden="true"></i> See more</button>


        <%
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <script>
            const menuBtn = document.querySelector(".menu-icon span");
            const searchBtn = document.querySelector(".search-icon");
            const cancelBtn = document.querySelector(".cancel-icon");
            const items = document.querySelector(".nav-items");
            const form = document.querySelector("form");
            menuBtn.onclick = () => {
                items.classList.add("active");
                menuBtn.classList.add("hide");
                searchBtn.classList.add("hide");
                cancelBtn.classList.add("show");
            }
            cancelBtn.onclick = () => {
                items.classList.remove("active");
                menuBtn.classList.remove("hide");
                searchBtn.classList.remove("hide");
                cancelBtn.classList.remove("show");
                form.classList.remove("active");
                cancelBtn.style.color = "#ff3d00";
            }
            searchBtn.onclick = () => {
                form.classList.add("active");
                searchBtn.classList.add("hide");
                cancelBtn.classList.add("show");
            }
            function func1() {
                window.location.href = 'http://localhost:8080/e_commerce/electonic.jsp';
            }
            function func2() {
                window.location.href = 'http://localhost:8080/e_commerce/clothing.jsp';
            }
            function func3() {
                window.location.href = 'http://localhost:8080/e_commerce/books.jsp';
            }
        </script>
      
        <%@include file="footer.jsp" %>
    </body>
</html>