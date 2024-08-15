<%-- 
    Document   : admin_profile
    Created on : 10-Apr-2024, 3:54:15 pm
    Author     : Dipak Paliya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            
            
            body {
    font-family: Arial, sans-serif;
}
         h1 {
            color: #333366;
            border-bottom: 2px solid #333366;
            padding-bottom: 10px;
            text-align: center;
        }

table {
    width: 95%;
    border-collapse: collapse;
   
    margin: 0px auto;
     margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

/* Style table header */
thead {
    background-color: #333366;
    color: white;
}

/* Style alternate rows */
tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Style delete button */
input[type="submit"] {
    background-color: #f44336;
    color: white;
    padding: 8px 12px;
    border: none;
    cursor: pointer;
    border-radius: 4px;
}

input[type="submit"]:hover {
    background-color: #d32f2f;
}

/* Apply styles specifically for the feedback table */
table:last-of-type {
    margin-bottom: 0;
}
        </style>
    </head>
    <body>
        <h1>Welcome Admin Profile!</h1>
        <table border="1">
            <h1>Order details</h1>
            <thead>
                <tr>
                    <th>Order Id</th>
                    <th>Address of customer</th>
                    <th>Seller email</th>
                    <th>Customer email</th>
                    <th>Customer mobile no</th> 
                    <th>Product name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM order_info");

                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                %>


                <tr>
                    <td><%=rs.getInt("sno")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("seller_email")%></td>
                    <td><%=rs.getString("customer_email")%></td>
                    <td><%=rs.getString("customer_mobile_no")%></td>
                    <td><%=rs.getString("product_name")%></td>
                    <td>
                        <form action="/e_commerce/DeleteOrder" method="post">
                            <input type="hidden" value="<%=rs.getInt("sno")%>" name="sno">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>


                <%  } %>

            </tbody>
        </table>




        <!--// feedback table-->
        <table border="1">
            <thead>
            <h1>Feedbacks</h1>
                <tr>
                    <th>name</th>
                    <th>email</th>
                    <th>comments</th>
                    <th>rating</th>
                </tr>
            </thead>
            <tbody>



                <%

                    PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM feedback");

                    ResultSet rs2 = ps2.executeQuery();

                    while (rs2.next()) {


                %> 

                <tr>
                    <td><%=rs2.getString("name")%></td>
                    <td><%=rs2.getString("email")%></td>
                    <td><%=rs2.getString("comments")%></td>
                    <td><%=rs2.getString("rating")%></td>
                </tr>

                <%
                    }%>
            </tbody>
        </table>

<!--//kachro--> 

 <table border="1">
            <thead>
            <h1>Seller details</h1>
                <tr>
                    <th>name</th>
                    <th>email</th>
                    <th>Mobile no</th>
                    <th>Address</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>



                <%

                    PreparedStatement ps3 = conn.prepareStatement("SELECT * FROM seller_credentials");

                    ResultSet rs3 = ps3.executeQuery();

                    while (rs3.next()) {


                %> 

                <tr>
                    <td><%=rs3.getString("name")%></td>
                    <td><%=rs3.getString("email")%></td>
                    <td><%=rs3.getString("mobile_no")%></td>
                    <td><%=rs3.getString("address")%></td>
                    <td>
                        <form action="message.jsp" method="post">
                            <input type="hidden" value="<%=rs3.getString("email")%>" name="seller_email">
                            <input type="submit" value="message">
                        </form>
                    </td>
                </tr>

                <%
                    }%>
            </tbody>
        </table>



<!--kachro puro-->

        <%
            } catch (Exception e) {
                e.printStackTrace();
            }


        %>






    </body>
</html>
