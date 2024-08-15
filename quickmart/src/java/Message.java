import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;



public class Message extends HttpServlet {

    PrintWriter out;

    public void init() throws ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        
        
        
        String seller_email=request.getParameter("seller_email");
        String message=request.getParameter("message");
        
       

        response.setContentType("text/html");
        out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

            PreparedStatement ps1 = conn.prepareStatement("INSERT INTO message VALUES(NULL,?,?)");
            ps1.setString(1, message);
            ps1.setString(2, seller_email);
           
           int a = ps1.executeUpdate();

           if (a > 0) {
out.println("<script>alert(\"Message sent successfully\"); window.location.href=\"admin_profile.jsp\";</script>");
    
} else {
    out.println("<h1>Failed to insert the new product.</h1>");
}
//            } else {
//                System.out.println("Failed to insert the product!");
//              
//            }
            out.println("All ok");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    
    public void destroy() {

    }
}