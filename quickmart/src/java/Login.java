
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class Login extends HttpServlet {

    PrintWriter out;

    public void init() throws ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

            if (role.equals("customer")) {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer_credentials WHERE email = ? AND password = ?");

                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                int affectedRows = 0;
                while (rs.next()) {
                    affectedRows++;
                    // Set session attribute inside the loop
                    HttpSession hs = request.getSession();
                    hs.setAttribute("session_Name", rs.getString("name"));
                    hs.setAttribute("session_email", rs.getString("email"));
                    hs.setAttribute("session_mobile_no", rs.getString("mobile_no"));
                    hs.setAttribute("session_address", rs.getString("address"));

                }

                if (affectedRows > 0) {
                    response.sendRedirect("/e_commerce/home.jsp");
                }else{
            out.println("<script>alert(\"invalid\"); window.location.href=\"login.jsp\";</script>");

                }
                
                
            }else if(role.equals("seller")){
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM seller_credentials WHERE email = ? AND password = ?");

                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                int affectedRows = 0;
                while (rs.next()) {
                    affectedRows++;
                    HttpSession hs = request.getSession();
                    hs.setAttribute("session_name", rs.getString("name"));
                    hs.setAttribute("session_email", rs.getString("email"));
                    hs.setAttribute("session_mobile_no", rs.getString("mobile_no"));
                    hs.setAttribute("session_address", rs.getString("address"));
                }

                if (affectedRows > 0) {
                    response.sendRedirect("/e_commerce/seller_profile.jsp");
                }
                else{
            out.println("<script>alert(\"invalid\"); window.location.href=\"login.jsp\";</script>");

                }
            } 
            conn.close(); // Close connection when done
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {

    }
}
