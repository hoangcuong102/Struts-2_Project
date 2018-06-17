<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="js/main.js"></script>
<title>Login</title>
<script type="text/javascript">
$(document).ready(function() {
	document.getElementById('id01').style.display = 'block';
});

</script>
</head>
<body>
	<div id="id01" class="modal">

		<form class="modal-content animate" action="login" method="post">
			<div class="imgcontainer">
				<img src="https://www.w3schools.com/howto/img_avatar2.png"
					alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname"><b>Username</b></label> 
				
				<s:textfield  name="username"  placeholder="Enter Username" ></s:textfield>
				<label for="psw"><b>Password</b></label> 
				<s:password name="password" placeholder="Enter Password"></s:password>
				<input type="hidden" name="command" value="login"/>	
				<button type="submit" id="button">Login</button>
				
				<label id="remember-me"> <input  type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
				<span style="float: right;color: red;" id="message"><s:property value="message"/></span>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				 <span class="psw" style="float: left;" >Don't have an account?
				 	 <a href="#" onclick="register()">Sign up here!</a>
					</span>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div>
</body>
</html>