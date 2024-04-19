<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 //to prevent go back
 response.setHeader("Pragma","no-cache");
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Expires","0");
 response.setDateHeader("Expires",-1);
 %>
<%@page import="java.sql.*" %> 


 

<% 
        String id = request.getParameter("tournament_id");
		System.out.println(id);
		
		String img=request.getParameter("image_name");
		System.out.println(img);
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kca","root","000777@Djs");
        pst = con.prepareStatement("delete from tour_img where tournament_id = '"+id+"' and image_name = '"+img+"'");
        pst.executeUpdate();  
        
%>

<%
 //to prevent go back
 response.setHeader("Pragma","no-cache");
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Expires","0");
 response.setDateHeader("Expires",-1);
 %>
        
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Deletion</title>
	<style type="text/css">
		import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
		*{
		    margin: 0;
		    padding: 0;
		    box-sizing:border-box;
		    text-decoration: none;
		    border:none;
		    outline: none;
		    scroll-behavior:smooth;
		    font-family: 'Poppins',sans-serif;
		    
		}
		:root
		{
	    	--bg-color:#081b29;
	   		--second-bg-color:#112e42;
	    	--text-color:#ededed;
	    	--main-color:#00abf0;
		}
		html
		{
		    font-size: 62.5%;
		    overflow-x: hidden;
		}

		body
		{
		    background:var(--bg-color);
		    color:var(--text-color);
		}
		
		.success{
			dispaly:flex;
			width:100%;
			height:100%;
			position:absolute;
			border: 3px solid var(--main-color);
			padding:35px;
			}
			
		.parent{
		
			position:relative;
			padding:35px;
			width:50%;
			top:25%;
			left:30%;
			font-size:1.2rem;
		}
		a{
			text-decoration: underline;
		}
		
		
</style>
	
	 
</head>
<body >

 	
	
			<div class="success">
			<div class="parent">
			
					<h1 >Tournament Details Deleted Successfully</h1>
					<h1 style = "color: var(--text-color)">Click here:<a href="admin.jsp" class="btn" target="_parent" style = "color: var(--main-color)">Back to Admin Page</a></h1>
            </div>
            </div>
            
            
            
        <script>
           window.history.forward();
        </script>
			
						
			 
 
</body>
</html>