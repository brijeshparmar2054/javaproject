import java.sql.*;
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;


public class DeleteCustomerOrder extends HttpServlet{
public void init()throws ServletException{}
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
   int sno=Integer.parseInt(request.getParameter("sno"));
    try{
       Class.forName("com.mysql.jdbc.Driver");
            
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
       PrintWriter out;
       response.setContentType("text/html");
       out=response.getWriter();
       PreparedStatement ps=conn.prepareStatement("DELETE FROM order_info WHERE sno=?");
       
       ps.setInt(1,sno);
       
       ps.executeUpdate();
    
       System.out.println("Order deleted success");
       
       out.println("<script>alert(\"Order deleted successfully\"); window.location.href=\"view_customer_order.jsp\";</script>");

    }
    catch(Exception e){
    e.printStackTrace();
    }
    
}
public void destroy(){

}
}