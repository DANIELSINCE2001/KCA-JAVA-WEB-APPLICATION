<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import= "java.io.IOException"

	
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
        <title>TournamentUpdates</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' href='upd.css'>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
    		<div class="headdiv">
    				<h1>TOURNAMENT UPDATES</h1>
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
    				<th>Tournaments</th>
    				<th>Details</th>
    			
    			</tr>
                <%   

                                Connection con;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kca","root","000777@Djs");
                                
                                  String query = "select * from tour_updates ORDER BY tourid DESC";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                        	
                                        	
                                            
                                   %>
             
                             <tr>
                        				<td><%=rs.getString("tourname")%></td>
                        				<td><a href="<%=rs.getString("tourdetails")%>">Download</a></td>
                    		</tr> 
                    		
                    				<%} %>
                             
                    </table>
    		</div>
    		
    </body>
</html>