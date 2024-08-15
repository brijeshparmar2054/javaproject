import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Feedback extends HttpServlet{
    
    public void init()
    {}
    public void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        String name=request.getParameter("name");
        String rating=request.getParameter("rating");
        String email=request.getParameter("email");
        String comment=request.getParameter("feedback");
        
        
        
        
        try{
             Class.forName("com.mysql.jdbc.Driver");

             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
        
             
             PreparedStatement ps=conn.prepareStatement("INSERT INTO feedback VALUES (?,?,?,?)");
             ps.setString(1,name);
             ps.setString(2, email);
             ps.setString(3,comment);
             ps.setString(4,rating);
             
             ps.executeUpdate();
             
             response.sendRedirect("feedback.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public void destroy(){
    
    }
}