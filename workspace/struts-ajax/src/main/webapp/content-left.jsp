<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<div class="content-left">
		<div class="button">
			<a class="button_link" href="Home.jsp">Home</a>
		</div>
		<div class="button">
			<a class="button_link" href="getProduct?command=view">Product
				Management</a>
		</div>
		<div class="button">
			<a class="button_link" href="getOrder?command=view">Order
				Management</a>
		</div>
		<s:if test='#session.LoginUser != null'>

			<div class="button">
				<a class="button_link" href="Logout">Logout</a>
			</div>
		</s:if>

	</div>
</body>
</html>