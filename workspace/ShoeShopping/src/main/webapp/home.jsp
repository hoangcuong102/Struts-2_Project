<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="js/main.js"></script>
<!--  -->
<script type="text/javascript">
	$(document).ready(function() {	
		$('.nav-trigger').click(function() {
			$('.side-nav').toggleClass('visible');
		});
	});
</script>

<title>Admin Page</title>
</head>
<body >
	<s:include value="general.jsp"></s:include>
	<div class="main-content">
		<div class="title">Analytics</div>
		<div class="main">
			<div class="widget" >
				<div class="title">Number of views</div>
				<div class="chart">
					
				</div>
			</div>
			<!-- <div class="widget">
				<div class="title">Number of likes</div>
				<div class="chart"></div>
			</div>
			<div class="widget">
				<div class="title">Number of comments</div>
				<div class="chart"></div>
			</div> -->
		</div>
	</div>
</body>
</html>