
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet("/Registration")
public class Registration extends HttpServlet {

    PrintWriter out;

    public void init() throws ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile_no = request.getParameter("mobile_no");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        out = response.getWriter();

        out.println("Data received");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

            response.setContentType("text/html");
            out = response.getWriter();

            out.println("Database connected successfull");

            if (role.equals("customer")) {
//               
                PreparedStatement ps = conn.prepareStatement("INSERT INTO customer_credentials VALUES(null,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, mobile_no);
                ps.setString(4, address);
                ps.setString(5, password);
//                
                ps.executeUpdate();

                response.sendRedirect("/e_commerce/login.jsp");
//                
//                out.println("Added");
            } else if (role.equals("seller")) {
//               
                PreparedStatement ps = conn.prepareStatement("INSERT INTO seller_credentials VALUES(null,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, mobile_no);
                ps.setString(4, address);
                ps.setString(5, password);
//                
                ps.executeUpdate();

                response.sendRedirect("/e_commerce/login.jsp");
//                
//                out.println("Added");
            } else {
                response.sendRedirect("/e_commerce/registration.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {

    }
}
