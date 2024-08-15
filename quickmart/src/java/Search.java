import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Search extends HttpServlet {

    @Override
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String q = request.getParameter("query");

        response.setContentType("text/html");

        if (q.equalsIgnoreCase("Electronics")) {
            response.sendRedirect("electonic.jsp");
        } else if (q.equalsIgnoreCase("Books")) {
            response.sendRedirect("books.jsp");
        } else if (q.equalsIgnoreCase("Clothing")) {
            response.sendRedirect("clothing.jsp");
        } else {
            response.sendRedirect("/e_commerce/home.jsp");
        }
    }
}
