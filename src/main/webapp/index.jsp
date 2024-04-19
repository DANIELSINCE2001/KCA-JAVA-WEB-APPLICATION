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

	
	import=" java.sql.Connection"
	import= "java.sql.DriverManager"
	import ="java.sql.PreparedStatement"
	import ="java.sql.ResultSet"
	import ="java.sql.Statement"
	import="java.sql.Blob"
	import="java.io.OutputStream"
	import="java.util.Base64"
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Home</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' href='hom.css'>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
       
    
    </head>
    <body>
         <header class="header">
            <div class="headdiv">
                <img src="kca.png"  >
                    
                <div class="heading">
                    <h1>KADAMBA CHESS ACADEMY</h1>
                    <h3 class="moto">Creating Master Minds On Chess Board</h3>
                    
                </div>
                <div class="dropdown">
                      <button onclick="myFunction()" class="dropbtn">MORE</button>
                      <div id="myDropdown" class="dropdown-content">
                        <a href="about.html">About Us</a>
                        <a href="updates.jsp">Tournament Updates</a>
                        <a href="gallery.jsp">Tournament Gallery</a>
                        <a href="contact.html">Contact Us</a>
                        <a href="login.jsp">Admin</a>
                      </div>
                </div>
                
               
                
            </div>
             <table  >
                <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
                                
                                  String query = "select * from headlines ORDER BY serial DESC";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("serial");
                                   %>
             
                             <tr>
                        				<td style="border-radius:0.5rem;border:1px solid #FFBF00" ><marquee scrollamount="10" direction=left><a href="<%=rs.getString("Link") %>" target="blank"><%=rs.getString("LinkName") %></a></marquee></td>
                    		</tr> 
                              <%
                                 
                                        }
                               %>
                    </table>
            <br>
            <div class="navdiv">
                 <nav  class="navbar">
                        <a href="about.html">About Us</a>
                        <a href="updates.jsp">Tournament Updates</a>
                        <a href="gallery.jsp">Tournament Gallery</a>
                        <a href="contact.html">Contact Us</a>
                        <a href="login.jsp">Admin</a>
                </nav>
            </div>
            
        </header>

	
        <br>
        <br>
        
        
        
        <div class="main">
            
            <div class="headlines">
               <div class="founder">
               			<img src="founder.jpg">
               			<h6 style="color:blue; ">Met Vishy Anand on 17-01-2024 at Bangalore.</h6>
               </div>
               
               <br>
               
               <div class="rp" >
               		<table >
               			<tr>
               				<th>Rated Players</th>
               			</tr>
               			
               			<tr>
               				<td style="color:red;">Daniel J Sadananda - 2000</td>
               			</tr>
               		</table>
               </div>
                
            </div>
           
            <div class="anounce">
            		<h2>Headlines and Announcements</h2>
            		<table>
				    				<tr>
				    					<td>
													<%
												  	 Connection con1;
					                                 ResultSet rs1;
					        					
								                                Class.forName("com.mysql.cj.jdbc.Driver");
								                                con1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/kca","root","000777Djs");
								                                
								                                String query1 = "select * from anc ORDER BY id DESC";
								                                Statement st1 = con1.createStatement();
								                                  
								       							rs1 =  st1.executeQuery(query1);
					       							
					       										while(rs1.next())
					       										{
					       											Blob blob=rs1.getBlob("image");
					       						  					byte byteArray[]=blob.getBytes(1,(int)blob.length());
					       						  					String imgDataBase64=new String(Base64.getEncoder().encode(byteArray));
					       						  					
					       											%>
												  			   
												  
																	 <div class="imgpanel">
																						 <img src="data:image;base64,<%=imgDataBase64 %>" alt="Sorry images not found" style="width:100%;height:auto;object-fit:contain;">
																						<p><%=rs1.getString("tname") %></p>
																	</div>
																	<br>
															  <%
															  }
															  
															  %>		
																	
													
											  
										</td>
								</tr>
						</table>
            </div>
            
        </div>


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