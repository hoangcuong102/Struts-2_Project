<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<title>Profile</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('.nav-trigger').click(function() {
			$('.side-nav').toggleClass('visible');
		});

	});
</script>
<body>
	<s:include value="general.jsp"></s:include>
	<div class="main-content">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8"
				style="background-color: lavender;">

				<div class="container">
					<h2>Profile</h2>
					<form class="form-horizontal" action="Profile" method="POST">
						<s:hidden name="command" value="edit"></s:hidden>
						<input type="hidden" name="uid" value='<s:property value="#session.LoginUser.uid"/>'/>
						<div class="form-group">
							<label class="control-label col-sm-2">Username:</label>
							<div class="col-sm-10">
							
								<input type="text" class="form-control" id="username" name="username" value='<s:property value="username"/>' readonly="readonly" />
							</div>
						</div>
										
						<div class="form-group">
							<label class="control-label col-sm-2">Password:</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="pwd" name="password" value='<s:property value="password"/>' />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2">Email:</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="email" name="email" value='<s:property value="email"/>'  />
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10" >
								<button type="submit" class="btn btn-primary">Edit</button>
								<button type="button" class="btn btn-default" >Cancle</button>
							</div>
							<div class="col-sm-offset-2 col-sm-10" >
								<p style="color: red"><s:property value="message"/></p>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>