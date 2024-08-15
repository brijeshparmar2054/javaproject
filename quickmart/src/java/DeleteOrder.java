import java.sql.*;
import javax.servlet.*;

import javax.servlet.http.*;


public class DeleteOrder extends HttpServlet{
public void init()throws ServletException{}
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
   int sno=Integer.parseInt(request.getParameter("sno"));
    try{
       Class.forName("com.mysql.jdbc.Driver");
            
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
       
       
       PreparedStatement ps=conn.prepareStatement("DELETE FROM order_info WHERE sno=?");
       
       ps.setInt(1,sno);
       
       ps.executeUpdate();
    
       System.out.println("Order deleted success");
       
       response.sendRedirect("admin_profile.jsp");

    }
    catch(Exception e){
    e.printStackTrace();
    }
    
}
public void destroy(){

}
}