package in.kca.backend;
import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginform")


public class Login extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();
		String name=new String("ThyagrajKCA");
		String pas=new String("kcamarch2024");
		String unam=req.getParameter("username");
		String pass=req.getParameter("password");
		
		
		if(name.equals(unam) && pas.equals(pass))
		{
			HttpSession session=req.getSession(true);
			session.setAttribute("username", unam);
			
			RequestDispatcher rd=req.getRequestDispatcher("/admin.jsp");
			rd.forward(req, resp);
		}
		
		else {
			resp.setContentType("text/html");
			out.print("<h3 style='color:red'>Email id and password didn't matched </h3>" );
			RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
			rd.include(req, resp);
		}
		
	}
}
