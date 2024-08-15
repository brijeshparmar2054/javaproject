    
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;

@MultipartConfig
public class UpdateProduct extends HttpServlet {

    PrintWriter out;

    public void init() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        out = response.getWriter();
        String path = "C:/Users/HP/Documents/NetBeansProjects/e_commerce/web/images/";

        int sno = Integer.parseInt(request.getParameter("sno"));
        String old_image_name = request.getParameter("old_image_name");

        String new_product_name = request.getParameter("productName");
        String new_price = request.getParameter("price");
        String new_category = request.getParameter("category");

        Part file = request.getPart("new_image_name");
        String NewImgFileName = file.getSubmittedFileName();
        String UploadPath = "C:/Users/HP/Documents/NetBeansProjects/e_commerce/web/images/" + NewImgFileName;

        FileOutputStream fos = new FileOutputStream(UploadPath);
        InputStream is = file.getInputStream();

        byte[] data = new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce", "root", "Dipak@2004");

            PreparedStatement ps1 = conn.prepareStatement("UPDATE product_info SET name=?, price=?, category=?, product_image_name=? WHERE sno=?");
            ps1.setString(1, new_product_name);
            ps1.setString(2, new_price);
            ps1.setString(3, new_category);
            ps1.setString(4, NewImgFileName);
            ps1.setInt(5, sno);
            int a = ps1.executeUpdate();

            File imageFile = new File(path + old_image_name);

            imageFile.delete();

//           System.out.println("File delete success");
            out.println("<script>alert(\"product update success\"); window.location.href=\"seller_profile.jsp\";</script>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}
