<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<script type="text/javascript" src="js/main.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>Register</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.nav-trigger').click(function() {
			$('.side-nav').toggleClass('visible');
		});

	});
</script>
</head>
<body>
<div id="id01" class="modal">

		<form class="modal-content animate">
			<div class="imgcontainer">
				<img src="https://www.w3schools.com/howto/img_avatar2.png"
					alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname"><b>Username</b></label> <input type="text"
					placeholder="Enter Username" name="username" id="uname" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="password" id="upass" required>

				<button type="button" onclick="runLogin()">Login</button>
				<label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
				<span style="float: right;color: red;" id="message"></span>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				 <span class="psw" style="float: left;" >Don't have an account? <a href="#">Sign up here!</a></span>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div>

</body>
</html>