import java.sql.*;
import javax.servlet.*;

import javax.servlet.http.*;


public class AdminLogin extends HttpServlet{
public void init()throws ServletException{}
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
    String email=request.getParameter("email");
    String password=request.getParameter("password");
     System.out.println("Login admin"+email+""+password);
    try{
       Class.forName("com.mysql.jdbc.Driver");
            
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
       
       
       PreparedStatement ps=conn.prepareStatement("SELECT * FROM admin_credentials WHERE email=? AND password=?");
       
       ps.setString(1,email);
       ps.setString(2,password);
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
        System.out.println("value:"+rs.getString("email"));
      
       if((email.equals(rs.getString("email")))&&(password.equals(rs.getString("password")))){
       response.sendRedirect("/e_commerce/admin_profile.jsp");
       }
       }
          
       

    }
    catch(Exception e){
    e.printStackTrace();
    }
    
}
public void destroy(){

}
}