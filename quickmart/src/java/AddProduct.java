import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class AddProduct extends HttpServlet {

    PrintWriter out;

    public void init() throws ServletException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        
        
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String seller_email=request.getParameter("seller_email");
        
        Part file=request.getPart("image");
        String ImgFileName=file.getSubmittedFileName();
        String UploadPath="D:/e_commerce/web/images/"+ImgFileName;
        
        FileOutputStream fos=new FileOutputStream(UploadPath);
        InputStream is=file.getInputStream();
        
        byte[] data=new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();
        
//        System.out.println("File name:"+ImgFileName);

        response.setContentType("text/html");
        out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

            PreparedStatement ps1 = conn.prepareStatement("INSERT INTO product_info VALUES(NULL,?,?,?,?,?)");
            ps1.setString(1, productName);
            ps1.setString(2, price);
            ps1.setString(3, category);
            ps1.setString(4, ImgFileName);
            ps1.setString(5,seller_email);
           int a = ps1.executeUpdate();

           if (a > 0) {

    response.sendRedirect("/e_commerce/add_product.jsp");
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