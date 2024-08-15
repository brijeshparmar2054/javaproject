import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class Logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the HttpSession object
        HttpSession session = request.getSession(false); // Pass false to prevent creating a new session if it doesn't exist

        if (session != null) {
            // Invalidate the session
            session.invalidate();
            
            System.out.println("Session destroyed");
            // Redirect to a logout success page
            response.sendRedirect("login.jsp"); // Replace with your logout page URL
        } else {
            // Session doesn't exist or already invalidated
            // Handle accordingly
//            response.sendRedirect("error.jsp"); // Replace with your error page URL
        }
    }
}
