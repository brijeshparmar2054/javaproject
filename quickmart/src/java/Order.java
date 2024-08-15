
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet("/Registration")
public class Order extends HttpServlet{
    PrintWriter out;
    
    public void init() throws ServletException{
    
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
       String name=request.getParameter("name1");
       String address=request.getParameter("address1");
       String quantity=request.getParameter("quantity");
       String total=request.getParameter("total");
         
         String seller_email=request.getParameter("seller_email");
          String product_name=request.getParameter("name");
              System.out.println("Name:"+product_name);
        HttpSession hs=request.getSession();
        String customer_email=(String)hs.getAttribute("session_email");
        String customer_mobile_no=(String)hs.getAttribute("session_mobile_no");
//        System.out.println("Customer email:"+customer_email);
        
        response.setContentType("text/html");
        out=response.getWriter();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce","root","Dipak@2004");
            
            System.out.println("Here");
               PreparedStatement ps=conn.prepareStatement("INSERT INTO order_info VALUES(null,?,?,?,?,?,?,?)");
               ps.setString(1,address);
               ps.setString(2, seller_email);
               ps.setString(3,customer_email);
               ps.setString(4,customer_mobile_no);
               ps.setString(5,product_name);
               ps.setString(6,quantity);
               ps.setString(7,total);
               ps.executeUpdate();
               
             out.println("<script>alert(\"Order placed successfully\"); window.location.href=\"home.jsp\";</script>");
//         response.sendRedirect("home.jsp");
    
        }
        catch(Exception e){
        e.printStackTrace();
        }
    }
    public void destroy(){
    
    }
}