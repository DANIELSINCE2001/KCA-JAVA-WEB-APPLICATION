<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>TournamentGallery</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' href='gall.css'>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
    
    	<%@ page import="java.io.IOException"
				import="java.sql.Connection"
				import="java.sql.DriverManager"
				import="java.sql.PreparedStatement"
				import="java.sql.ResultSet"
				import="java.sql.Statement"
				import="java.sql.Blob"
				import="java.io.OutputStream"
				import="java.util.Base64"
		%>
    		<div class="headdiv">
    				<h1>TOURNAMENT GALLERY</h1>
    				<div class="imgdiv">
    					<div class="img">
    						<img src="kca.png">
    					</div>
    					<div class="adiv">
    						<a href="index.jsp">Back To Home</a>
    					</div>
    				</div>
    		</div>
    		<div class="main">
    			<table>
    				<tr>
    					<th style="color: blue;">
    						TOURNAMENTS
    					</th>
    				</tr>
    				
    							<%   

                                Connection con;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kca","root","000777@Djs");
                                
                                String query = "select * from tour_gallery ORDER BY tournament_id DESC";
                                Statement st = con.createStatement();
                                  
       							rs =  st.executeQuery(query);
       							
       							while(rs.next())
       							{
       								String id = rs.getString("tournament_id");
       							
                                    
                                       
                    				 %>
				    				<tr>
				    					<td>
				    						<button class="accordion"><%=rs.getString("tournament_name") %></button>
												<div class="panel">
												  
												  	<%
												  	 Connection con1;
					                                 ResultSet rs1;
					        					
								                                Class.forName("com.mysql.cj.jdbc.Driver");
								                                con1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kca","root","000777@Djs");
								                                
								                                String query1 = "select * from tour_img  where tournament_id = "+id ;
								                                Statement st1 = con1.createStatement();
								                                  
								       							rs1 =  st1.executeQuery(query1);
					       							
					       										while(rs1.next())
					       										{
					       											Blob blob=rs1.getBlob("photo");
					       						  					byte byteArray[]=blob.getBytes(1,(int)blob.length());
					       						  					String imgDataBase64=new String(Base64.getEncoder().encode(byteArray));
					       						  					
					       											%>
												  			   
												  
													 <div class="imgpanel"style="border: 2px solid var(--bg-color);">
																		 <img src="data:image;base64,<%=imgDataBase64 %>" alt="Sorry images not found">
																		
													</div>
													<br>
															  <%}%>		
																	
													
											  </div>
										</td>
								</tr>
							<% } %>
				    				
					       	
    				
    			</table>
    		</div>

    		<script>
						var acc = document.getElementsByClassName("accordion");
						var i;var j;

						for (i = 0; i < acc.length; i++) {
						  acc[i].addEventListener("click", function() {
						    this.classList.toggle("active");
						    var panel = this.nextElementSibling;
						    if (panel.style.maxHeight) {
						      panel.style.maxHeight = null;
						    } else {
						      
						      panel.style.maxHeight = panel.scrollHeight + "px";
						    } 
						  });
						}
			</script>
    </body>
</html>