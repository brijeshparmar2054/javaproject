<%-- 
    Document   : seller_profile
    Created on : 08-Apr-2024, 3:01:34?pm
    Author     : Rushik
--%>
     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seller profile</title>
   
        <style>
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


}

thead {
  background-color: #f2f2f2;
}

th, td {
  padding: 8px;
  text-align: center;
}

th {
  background-color: #080808;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

img {
  max-width: 100px;
  height: auto;
}

input[type="submit"] {
  background-color: #f44336;
  color: white;
  padding: 6px 12px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #d32f2f;
}


.btn1{
   margin-left: 3%;
   margin-bottom: 10px;
     float: left;
      padding: 10px 20px;
    background-color: #004b9a;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.btn2{
     margin-right: 3%;
   margin-bottom: 10px;
       float: right;
        padding: 10px 20px;
    background-color: #004b9a;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn1:hover {
  background-color: #002d5c;
}
.btn2:hover {
  background-color: #002d5c;
}
#logout{
    position: absolute;
    left: 50px;
    background-color: red;
    border: 1px solid black;
 cursor: pointer;
    color: white;
    border-radius: 3px;
}

#logout:hover{
    background-color: darkred;
}
.bbb{
   display:flex;
    justify-content: space-around;
    flex-direction: row;
}

            
        </style>
    </head>
    <body>
 
        <button  onclick="window.location.href='/e_commerce/Logout'" id="logout">Logout</button>
        
        <h1>Welcome seller ${sessionScope.sesion_email}</h1>
      <button onclick="window.location.href='/e_commerce/add_product.jsp'" class="btn1">Add product</button>
<button onclick="window.location.href='/e_commerce/view_orders.jsp'" class="btn2">View orders</button>
<button onclick="window.location.href='/e_commerce/view_message.jsp'" class="btn2">view Message</button>

<% 
  try{
        Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
            
//            Statement st=conn.createStatement();
//            ResultSet rs=st.executeQuery("SELECT * FROM product_info  ");
              HttpSession hs=request.getSession();
        String seller_email=(String)hs.getAttribute("session_email");
%>



        <table border="1">
            <thead>
                <tr>
                    <th>sno</th>
                    <th>name</th>
                    <th>price</th>
                    <th>category</th>
                     <th>productIMG</th>
                     <th>Action</th>
                    
                </tr>
            </thead>
            <tbody>
                

        <%  
            
            
            
          
        PreparedStatement ps=conn.prepareStatement("SELECT * FROM product_info WHERE seller_email=?");
        
        ps.setString(1,seller_email);
        
        ResultSet rs=ps.executeQuery();
            while(rs.next()){
            
            
            
        %>
        
                <tr>
                    <td><%=rs.getInt("sno") %></td>
                    <td><%=rs.getString("name") %></td>
                    <td><%=rs.getString("price") %></td>
                    <td><%=rs.getString("category") %></td>
                    <td><img src="images/<%=rs.getString("product_image_name")%>" width="100" ></td>
                    <td width='200px'>
                        <div class="bbb">
                         <form action="/e_commerce/update_product.jsp" method="post" id="form1">
                            <input type="hidden" value="<%=rs.getInt("sno")%>" name="sno">
                            <input type="hidden" value="<%=rs.getString("product_image_name")%>" name="product_image">
                            <input type="submit" value="Update">
                        </form>
                            
               
                        <form action="/e_commerce/ProductDelete" method="post" id="form1">
                            <input type="hidden" value="<%=rs.getInt("sno")%>" name="sno">
                            <input type="hidden" value="<%=rs.getString("product_image_name")%>" name="product_image">
                            <input type="submit" value="Delete">
                        </form>
                          </div>  
                            
                            
                    </td>
                </tr>

           
                    
                  
                    
        <%  }
            
            }
            catch(Exception e){
            } %>

 </tbody>
        </table>







    </body>
</html>