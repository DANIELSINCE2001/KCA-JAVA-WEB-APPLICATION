<%
		
    	String username=(String)session.getAttribute("username");
		if(username==null)
		{
			
			out.print("<h3 style='color:red'>Login First</h3>" );
			RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
			rd.include(request, response);
			return;
			
		}
 %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%
 //to prevent go back
 response.setHeader("Pragma","no-cache");
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Expires","0");
 response.setDateHeader("Expires",-1);
 %>
   
<%@ page import= "java.io.IOException"

	import ="javax.servlet.RequestDispatcher"
	import= "javax.servlet.ServletException"
	import ="javax.servlet.annotation.WebServlet"
	import= "javax.servlet.http.HttpServlet"
	import= "javax.servlet.http.HttpServletRequest"
	import= "javax.servlet.http.HttpServletResponse"
	import=" java.sql.Connection"
	import= "java.sql.DriverManager"
	import ="java.sql.PreparedStatement"
	import ="java.sql.ResultSet"
	import ="java.sql.Statement"
%>
	




<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Admin</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' href='adm.css'>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
            
    </head>
    <body>
    
   
        <header class="header">
                
                <h1 class="admin">ADMIN PAGE</h1>
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn">MORE</button>
                    <nav id="myDropdown" class="dropdown-content">
                        <a href="#headlines">Headlines & Announcements</a>
                        <a href="#tournamentgallery">Tournament Gallery</a>
                        <a href="#tournamentupdates">Tournament Updates</a>
                        <a href="index.jsp">BackToHome</a>
                    </nav>
                </div>
        </header>
        

        <section id="headlines" class="headlines">
                <div class="formdiv">

                    <h1>Add Headlines Here</h1>
                    <form  method="POST" action="admin.jsp" > 
                        
                        <div class="link">
                            <label class="form-label">Link</label>
                            <input type="text" class="form-control" placeholder="Enter link" name="link" id="link" required >
                         </div>
                             
                        <div class="link-name">
                            <label class="form-label">Link Name</label>
                            <input type="text" class="form-control" placeholder="Enter name of the link" name="lname" id="lname" required >
                         </div>
                        
                             
                         <div class="btn-box">
                             <input type="submit" id="submit" value="add" name="submit" class="btn">
                             <input type="reset" id="reset" value="reset" name="reset" class="btn">
                         </div>  
                         
                         
                             
                    </form>
                    
                    
                     <form  id="tour-imgupload"method="POST" action="auplaodimage" enctype="multipart/form-data"> 
                        
                        <div class="link">
                            <label class="form-label">Enter Tournament Description</label>
                            <input type="text" class="form-control" placeholder="Enter  text" name="atext" id="atext" required>
                         </div>

                         
                        
                        <input type="file" id="submit" value="add" name="aimage" class="btn">
                         
                         <div class="btn-box">
                             <input type="submit" id="submit-a" value="submit" name="submit-a" class="btn">
                             <input type="reset" id="reset-a" value="reset" name="reset-a" class="btn">
                         </div>  
                             
                    </form>
                    
                    <%

						if(request.getParameter("submit")!=null)
					    {
					        String link = request.getParameter("link");
					        String linkname = request.getParameter("lname");
					        
					        
					        Connection con;
					        PreparedStatement pst;
					        ResultSet rs;
					        
					        Class.forName("com.mysql.cj.jdbc.Driver");
					        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
					        pst = con.prepareStatement("insert into headlines(LinkName,Link)values(?,?)");
					        pst.setString(1, linkname);
					        pst.setString(2, link);
					        pst.executeUpdate();  
					        
					    %> 
					    <script>   
					        alert("Record Added Successfully");     
					    </script> 
    					<%
    				}

	
    				%>
    				
    				
                </div>
                
                
               
                

                <div class="head-list">
                    <h1>HeadLines</h1>

                    <table >
                        <tr>
                        	<th style="width:10%;">
                        	Link ID
                        	</th>
                           
                            <th style="width: 40%;">
                                LinkName
                            </th>
                            <th style="width: 25%;">
                                Link
                            </th>
                            <th style="width: 15%;">
                                Delete
                            </th>
                        </tr>

                        <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
                                
                                  String query = "select * from headlines";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("serial");
                                   %>
             
                             <tr>
                             	 <td><%=id %></td>
                                 <td><%=rs.getString("LinkName") %></td>
                                 <td><%=rs.getString("Link") %></td>
                                 <td><a href="delete.jsp?serial=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                    </table>
                    
                    <br>
                    <br>
                    <table >
                        <tr>
                        	<th style="width:10%;">
                        		Tournament ID
                        	</th>
                           
                            <th style="width: 75%;">
                                Description
                            </th>
                           
                            <th style="width: 15%;">
                                Delete
                            </th>
                        </tr>

                        <%   

                                Connection cona;
                                ResultSet rsa;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                cona = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
                                
                                  String querya = "select * from anc";
                                  Statement sta = cona.createStatement();
                                  
                                    rsa =  sta.executeQuery(querya);
                                    
                                        while(rsa.next())
                                        {
                                            String id = rsa.getString("id");
                                   %>
             
                             <tr>
                             	 <td><%=id %></td>
                                 <td><%=rsa.getString("tname") %></td>
                                 
                                 <td><a href="deletea.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                    </table>
                </div>
           
        </section>
        
        <section id="tournamentgallery" class="headlines">
                <div class="formdiv">

                    <h1>Add Tournaments Here</h1>
                    <form  id="tour-name" method="POST" action="admin.jsp" > 
                        
                        <div class="link">
                            <label class="form-label">Tournament Name</label>
                            <input type="text" class="form-control" placeholder="Enter tournamnet name" name="t-name" id="t-name" required>
                         </div>
                        
                             
                         <div class="btn-box">
                             <input type="submit" id="submit-tg1" value="add" name="submit-tg1" class="btn">
                             <input type="reset" id="reset-tg1" value="reset" name="reset-tg1" class="btn">
                         </div>  
                             
                    </form>
                    
                     <%

						if(request.getParameter("submit-tg1")!=null)
					    {
					        String tname = request.getParameter("t-name");
					        
					        
					        
					        Connection conn;
					        PreparedStatement pstt;
					        
					        
					        Class.forName("com.mysql.cj.jdbc.Driver");
					        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
					        pstt = con.prepareStatement("insert into tour_gallery(tournament_name)values(?)");
					        pstt.setString(1, tname);
					        pstt.executeUpdate();  
					        
					    %> 
					    <script>   
					        alert("Record Added Successfully");     
					    </script> 
    					<%
    				}

	
    				%>
					<form  id="tour-imgupload"method="POST" action="UploadSingleImage" enctype="multipart/form-data"> 
                        
                        <div class="link">
                            <label class="form-label">Enter Tournament Id to Insert Single Image</label>
                            <input type="text" class="form-control" placeholder="tournament id(only digits)" name="t-id1" id="t-id1" required>
                         </div>

                       
                        
                        <input type="file" id="submit" value="add" name="image" class="btn" >
                         
                         <div class="btn-box">
                             <input type="submit" id="submit-tgim" value="submit" name="submit-tgim" class="btn">
                             <input type="reset" id="reset-tgim" value="reset" name="reset-tgim" class="btn">
                         </div>  
                             
                    </form>
                    <form  id="tour-imgupload"method="POST" action="uplaodimage" enctype="multipart/form-data"> 
                        
                        <div class="link">
                            <label class="form-label">Enter Tournament Id to Insert Images</label>
                            <input type="text" class="form-control" placeholder="tournament id(only digits)" name="t-id" id="t-id" required>
                         </div>

                       
                        
                        <input type="file" id="submit" value="add" name="image[]" multiple>
                         
                         <div class="btn-box">
                             <input type="submit" id="submit-tg2" value="submit" name="submit-tg2" class="btn">
                             <input type="reset" id="reset-tg2" value="reset" name="reset-tg2" class="btn">
                         </div>  
                             
                    </form>
                    
                    <form  id="tour-imgdelete"method="POST" action="deleteall.jsp"> 
                        
                        <div class="link">
                            <label class="form-label">Enter Tournament Id to delete images</label>
                            <input type="text" class="form-control" placeholder="tournament id(only digits)" name="tourid" id="tourid" required>
                         </div>

                  		<div class="btn-box">
                             <input type="submit" id="delete-all" value="delete" name="delete-all" class="btn">
                             <input type="reset" id="reset-all" value="reset" name="reset-all" class="btn">
                         </div>  
                             
                    </form>
                </div>
                    
                    

                <div class="head-list">
                    <h1>Tournaments </h1>

                    <table >
                        <tr>
                           
                            <th style="width: 20%;">
                                Tournament id
                            </th>

                            <th style="width: 65%;">
                                Tournament Name
                            </th>
                           
                            <th style="width: 15%;">
                                Delete
                            </th>
                        </tr>

                        <%   

                                Connection conn;
                                ResultSet rss;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
                                
                                  String query1 = "select * from tour_gallery";
                                  Statement st1 = conn.createStatement();
                                  
                                    rss =  st1.executeQuery(query1);
                                    
                                        while(rss.next())
                                        {
                                            String idtg = rss.getString("tournament_id");
                                   %>
             
                             <tr>
                             	 <td><%=idtg %></td>
                                 <td><%=rss.getString("tournament_name") %></td>
                                 <td><a href="deletetg.jsp?tournament_id=<%=idtg%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                    </table>
                    <br>
                    <br>

                    <table >
                        <tr>
                           
                            <th style="width: 20%;">
                                Tournament id
                            </th>

                            <th style="width: 15%;">
                                Image Name
                            </th>
                           
                           

                         	<th style="width: 10%;">
                                Delete
                            </th>
                        </tr>
                        
                        <%   

                                Connection connn;
                                ResultSet rsss;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                connn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
                                
                                  String query2 = "select * from tour_img";
                                  Statement st2 = connn.createStatement();
                                  
                                    rsss =  st2.executeQuery(query2);
                                    
                                        while(rsss.next())
                                        {
                                            String idtg1 = rsss.getString("tournament_id");
                                            String img=rsss.getString("image_name");
                                   %>
             
                             <tr>
                             	 <td><%=idtg1 %></td>
                                 <td><%=img %></td>
                                 
                                 <td><a href="deletetgimg.jsp?tournament_id=<%=idtg1%>&image_name=<%=img%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>

                        
                    </table>
                </div>

               
        </section>
        
        <section id="tournamentupdates" class="headlines">
                <div class="formdiv">

                    <h1>Add Tournaments Updates</h1>
                    <form  id="tourupd" method="POST" action="admin.jsp" > 
                        
                        <div class="link">
                            <label class="form-label">Tournament Name</label>
                            <input type="text" class="form-control" placeholder="Enter tournamnet name" name="t-nam" id="t-nam" required>
                         </div>
                         
                         <div class="link">
                            <label class="form-label">Download Link</label>
                            <input type="text" class="form-control" placeholder="Enter download link " name="t-link" id="t-link" required>
                         </div>
                        
                             
                         <div class="btn-box">
                             <input type="submit" id="submit-tu" value="add" name="submit-tu" class="btn">
                             <input type="reset" id="reset-tu" value="reset" name="reset-tu" class="btn">
                         </div>  
                             
                    </form>
                                         <%

						if(request.getParameter("submit-tu")!=null)
					    {
					        String tnam = request.getParameter("t-nam");
					        String tlin=  request.getParameter("t-link");
					        
					        
					        
					        Connection contup;
					        PreparedStatement pstup;
					        
					        
					        Class.forName("com.mysql.cj.jdbc.Driver");
					        contup = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
					        pstup = contup.prepareStatement("insert into tour_updates(tourname,tourdetails)values(?,?)");
					        pstup.setString(1, tnam);
					        pstup.setString(2, tlin);
					        pstup.executeUpdate();  
					        
					    %> 
					    <script>   
					        alert("Record Added Successfully");     
					    </script> 
    					<%
    				}

	
    				%>
                    
                    
                </div>

                <div class="head-list">
                    <h1>Tournaments </h1>

                    <table >
                        <tr>
                           
                            <th style="width: 45%;">
                                Tournament Name
                            </th>

                            <th style="width: 40%;">
                                Download Link
                            </th>
                           
                            <th style="width: 15%;">
                                Delete
                            </th>
                        </tr>

                        <%   

                                Connection contu;
                                ResultSet rstu;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                contu = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
                                
                                  String querytu = "select * from tour_updates";
                                  Statement sttu = contu.createStatement();
                                  
                                    rstu =  sttu.executeQuery(querytu);
                                    
                                        while(rstu.next())
                                        {
                                            String idtu = rstu.getString("tourid");
                                   %>
             
                             <tr>
                             	 <td><%=rstu.getString("tourname") %></td>
                                 <td><%=rstu.getString("tourdetails") %></td>
                                 <td><a href="deletetu.jsp?tourid=<%=idtu%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                    </table>
                    <br>
                    <br>

                    
                </div>

               
        </section>


        <script>
                /* When the user clicks on the button, 
                toggle between hiding and showing the dropdown content */
                function myFunction() {
                  document.getElementById("myDropdown").classList.toggle("show");
                }

                // Close the dropdown if the user clicks outside of it
                window.onclick = function(event) {
                  if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                      var openDropdown = dropdowns[i];
                      if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                      }
                    }
                  }
                }
        </script>
        
        <script>
           window.history.forward();
        </script>
       
        
        

        
    </body>
</html>