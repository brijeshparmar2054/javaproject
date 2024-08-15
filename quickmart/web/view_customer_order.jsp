<%-- 
    Document   : view_customer_order
    Created on : 10-Apr-2024, 5:12:50?pm
    Author     : Rushik
--%>

<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer orders</title>
        <style>
            #subbtn{
               color: #ffffffde;
    border-radius: 3px;
    border: 1px solid #000000c2;
    background-color: #ff0303d1;
            }
            #subbtn:hover{
                background-color: darkred;
                cursor: pointer;
            }
            h1{
                text-align: center;
                margin-top: 30px;
                box-shadow: 0px 0px 10px #a7a6a6;
            }
            
               table {
            width: 95%;
            border-collapse: collapse;
            margin:0px auto;
            margin-top: 50px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #dddddd;
        }
        
       

        th {
            background-color: #333366;
            color: white;
            
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Responsive Styles */
        @media screen and (max-width: 600px) {
            table {
                border: 0;
            }
            table thead {
                display: none;
            }
            table tr {
                margin-bottom: 10px;
                display: block;
                border: 1px solid #ccc;
            }
            table td {
                display: block;
                text-align: right;
            }
            table td:before {
                content: attr(data-label);
                float: left;
                font-weight: bold;
                text-transform: uppercase;
            }
        }
        </style>
    </head>
    <body>
        <h1>Order list</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Order id</th>
                     <th>Address</th>
                    <th>seller email</th>
                    <th>customer email</th>
                    <th>customer mobile no</th>
                    <th>product name</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                   <th>Action</th>
                </tr>
            </thead>
            <tbody>
     
        <%  
        try{
        Class.forName("com.mysql.jdbc.Driver");

     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
System.out.println("hre");
        
        HttpSession hs=request.getSession();
        String customer_email=(String)hs.getAttribute("session_email");
        PreparedStatement ps=conn.prepareStatement("SELECT * FROM order_info WHERE customer_email=?");
        
        ps.setString(1,customer_email);
        
        ResultSet rs=ps.executeQuery();
        
         int total=0;
         int quantitytotal=0;
        while(rs.next())
        {
        
        %>
    
          <tr>
              <td><%=rs.getInt("sno")%></td>
               <td><%=rs.getString("address")   %></td>
                <td><%=rs.getString("seller_email")   %></td>
                 <td><%=rs.getString("customer_email")   %></td>
                  <td><%=rs.getString("customer_mobile_no")   %></td>
                  <td><%=rs.getString("product_name")   %></td>
                  <td><%=rs.getString("quantity") %></td>
                  <td><%=rs.getString("total")  %></td>
                  <td>
                      <form action="/e_commerce/DeleteCustomerOrder" method="post">
                          <input type="hidden" value="<%=rs.getInt("sno")%>" name="sno">
                          <input type="submit" value="Cancel" id="subbtn">
                      </form>
                  </td>
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
                    <td></td>
                    <td></td>
                    <td>Total Sum:<%=quantitytotal  %></td>
                    <td>Total Sum:<%=total  %></td>
                </tr>
            </tfoot> 
        </tbody>
        </table>
        
        
        <%
            }
            catch(Exception e){
            e.printStackTrace();
            }
        %>
        <%@include file="footer.jsp" %>
    </body>
</html>