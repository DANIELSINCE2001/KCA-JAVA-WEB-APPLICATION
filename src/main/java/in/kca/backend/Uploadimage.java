package in.kca.backend;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uplaodimage")
@MultipartConfig(maxFileSize = 16177216)
public class Uploadimage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String connectionURL = "jdbc:mysql://127.0.0.1:3306/kca";
        String username = "root";
        String password = "000777@Djs";
        
        String tid=request.getParameter("t-id");
        
	
       
        try {
            Connection connection = DriverManager.getConnection(connectionURL, username, password);
           
            for (Part part : request.getParts()) {
            	
                String fileName = extractFileName(part);
                if(fileName!="")
                {
                	InputStream inputStream = part.getInputStream();
                
               
                	PreparedStatement statement = connection.prepareStatement("INSERT INTO tour_img (tournament_id, image_name,photo) VALUES (?, ?, ?)");
                	statement.setString(1, tid);
                	statement.setString(2, fileName);
                	statement.setBlob(3, inputStream);
                	statement.executeUpdate();
                }
            }
           
            connection.close();
            RequestDispatcher rd=request.getRequestDispatcher("/admin.jsp");
			rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
