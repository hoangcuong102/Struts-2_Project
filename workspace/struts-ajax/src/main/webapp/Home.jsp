<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<title>Product Management</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1 class="header_title">Product Management System</h1>
		</div>
		<div id="content">
			<s:include value="content-left.jsp"></s:include>
			<div class="content-right">

				<s:if test='#session.LoginUser != null'>
					<h3>
						Welcome
						<s:property value="#session.LoginUser['username']" />
					</h3>
				</s:if>
				<s:else>
					<div class="right_title">

						<h3>Login</h3>
						<s:if test='#session.errorMess != null && #session.errorMess == "You need to login first"'>
									<s:property value="#session.errorMess"/>
								</s:if>
					</div>
					
								
					<s:form action="Login">
						<table class="table_login" border="0">
							
							<tr>
								<td><s:textfield label="Username" name="username"></s:textfield></td>
							</tr>
							<tr>

								<td><s:password label="Password" name="password"></s:password></td>
							</tr>
							<tr>

								<td><s:select name="role" label="Role"
										list="{'admin', 'user'}"></s:select></td>
							</tr>
							<tr>

								<td><s:submit value="Login"></s:submit></td>
							</tr>
						</table>
					</s:form>
				</s:else>

			</div>
		</div>
		<div class="clearfix "></div>
		<div id="footer"></div>
	</div>
</body>
</html>