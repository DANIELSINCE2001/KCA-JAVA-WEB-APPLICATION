<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%
 //to prevent go back
 response.setHeader("Pragma","no-cache");
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Expires","0");
 response.setDateHeader("Expires",-1);
 
%>
    

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Owner</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel="stylesheet" href="log.css">
</head>
<body>

			<h2 class="heading "><span>ADMIN &#160 </span> LOGIN</h2>
			<div class="fdiv">
			    <form name="logindetails" action="loginform" method="post">  
         
		            <div class="userdiv">
		            	<label><h2>USERNAME </h2></label>   
		            	<input type="text" placeholder="Enter Username" name="username" required>
		            </div>
		            <div class="passdiv">
		            	<label><h2>PASSWORD </h2></label>   
		            	<input type="password" placeholder="Enter Password" name="password" required>
		            </div>  
		            <div class="logbtn">
		            	<button type="submit">Login</button>   
		            </div> 
		        	<div class="rc">
		            	<div class="remdiv">
		            		<input type="checkbox" checked="checked">Remember me
		            	</div>

			            <div class="cancel">
			            	<button type="button" class="cancelbtn"> <a href="index.jsp">Cancel</a></button>
			        	</div>
		        	</div>
		       
    		    </form>
			</div>
			
		<script>
           window.history.forward();
        </script>
			
			
</body>
</html>