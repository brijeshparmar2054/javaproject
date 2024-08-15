<%-- 
    Document   : view_orders.jsp
    Created on : 10-Apr-2024, 11:14:28?am
    Author     : Dipak Paliya
--%>
     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
       
                        h1 {
            color: #333366;
            border-bottom: 2px solid #333366;
            padding-bottom: 10px;
    
text-align: center;
            }
 table {
            width: 95%;
            margin: 0px auto;
            
            border-collapse: collapse;
            margin-bottom: 20px;
            border: 1px solid #ddd; /* Add border */
            overflow-x: auto; /* Make table responsive */
        }

        table th,
        table td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
  
        }

        table th {
            background-color: #333366; /* Heading background color */
            color: white; /* Heading text color */
            font-weight: bold;
        }

        table tbody tr:hover {
            background-color: #f5f5f5;
        }
        </style>
    </head>
    <body>
        <h1>Order list!</h1>
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Customer email</th>
                    <th>Address</th>
                    <th>Customer mobile no</th>
                    <th>Quantity</th>
                    <th>Total paid</th>

                </tr>
            </thead>
            <tbody>
                <%
                    HttpSession hs = request.getSession();
                    String seller_email = (String) hs.getAttribute("session_email");

                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM order_info WHERE seller_email=?");
                        ps.setString(1, seller_email);

                        ResultSet rs = ps.executeQuery();
                        
                        int total=0;
                        int quantitytotal=0;
                        while (rs.next()) {


                %>

                <tr>
                    <td><%=rs.getString("product_name")%></td>
                    <td><%=rs.getString("customer_email")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("customer_mobile_no")%></td>
                    <td><%=rs.getString("quantity") %></td>
                    <td><%=rs.getString("total")  %></td>


                </tr>

            

                <%
                    total=total+Integer.parseInt(rs.getString("total"));
                    quantitytotal=quantitytotal+Integer.parseInt(rs.getString("quantity"));
                        }
                %>
     <tfoot>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Total Sum:<%=quantitytotal  %></td>
                    <td>Total Sum:<%=total  %></td>
                </tr>
            </tfoot>                   
                        <%

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            
            
            
            
            </tbody>
        </table>
    </body>
</html>
