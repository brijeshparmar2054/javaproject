<%-- 
    Document   : view_message
    Created on : 17-Apr-2024, 12:22:24 pm
    Author     : Rushik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@page import="java.sql.DriverManager"%>
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
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #333366;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        td {
            border-bottom: 1px solid #ddd;
        }

        </style>
    </head>
    <body>
        <h1> Message form Admin</h1>
         <table>
        <thead>
            <tr>
                <th>Message from Admin</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

//            Statement st=conn.createStatement();
//            ResultSet rs=st.executeQuery("SELECT * FROM product_info  ");
                HttpSession hs = request.getSession();
                String seller_email = (String) hs.getAttribute("session_email");

                PreparedStatement ps = conn.prepareStatement("SELECT * FROM message WHERE seller_email=?");

                ps.setString(1, seller_email);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {


        %>

         <tr> <td>  <%= rs.getString("message") %>  </td>   </tr>  
     
    
        <%         }

            } catch (Exception e) {

     }%>
 </tbody>
    </table>
    </body>
</html>
