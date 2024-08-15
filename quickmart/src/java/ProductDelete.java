import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.*;

public class ProductDelete extends HttpServlet{
    public void init(){}
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException
    {
      int sno=Integer.parseInt(request.getParameter("sno"));
      String product_image=request.getParameter("product_image");
      String path="C:/Users/HP/Documents/NetBeansProjects/e_commerce/web/images/";
      
      
      try{
       Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");
            
            PreparedStatement ps=conn.prepareStatement("DELETE FROM product_info WHERE sno=?");
            
            ps.setInt(1, sno);
            
            int i=ps.executeUpdate();
            
            if(i>0)
            {
                System.out.println("Product deleted successfully");
                
                
                File imageFile = new File(path + product_image);
                
               
               
               if(imageFile.delete())
               {
                  System.out.println("File delete success"); 
               }
                
                response.sendRedirect("seller_profile.jsp");
            }
      }
      catch(Exception e){}
    }public void destroy(){
    }
}