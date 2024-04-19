package in.kca.backend;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
 
@WebServlet("/UploadSingleImage")
@MultipartConfig(maxFileSize = 16177216)
public class UploadSingleImage extends HttpServlet
{
 
/**
	 * 
	 */
	private static final long serialVersionUID = -4314964583162806958L;

	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		
		PrintWriter out=resp.getWriter();
		 
		int result = 0;
		Connection con = null;
		Part part = req.getPart("image");
		String tid=req.getParameter("t-id1");
		String imgname=part.getSubmittedFileName();
		
		
		
		 
		if(part != null){
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kca","root","000777@Djs");
		    
		    PreparedStatement ps = con.prepareStatement("insert into tour_img(tournament_id,image_name,photo) values(?,?,?)");
		    InputStream is = part.getInputStream();
		    ps.setString(1, tid);
		    ps.setString(2, imgname);
		   
		    ps.setBlob(3, is);
		    result = ps.executeUpdate();
		}
		catch(Exception e){
		e.printStackTrace();
		}
		finally{
		if(con != null){
		try{
		con.close();
		}
		catch(Exception e){
		e.printStackTrace();
	}
 }
}
		}
		if(result > 0){
		     RequestDispatcher rd=req.getRequestDispatcher("/admin.jsp");
			rd.include(req, resp);
		    }
		else{
			resp.setContentType("text/html");
			out.print("<h3 style='color:red'>Error  </h3>" );
			RequestDispatcher rd=req.getRequestDispatcher("/admin.jsp");
			rd.include(req, resp);
		}
}
}