<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="js/function.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css" />
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

<title>Product</title>
<style type="text/css">

</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1 class="header_title">Product Management System</h1>
		</div>
		<div id="content">
			<s:include value="content-left.jsp"></s:include>
			<div class="content-right">
				<div class="sub_left_content-right">
				<table height="500px" id="table_id" >
				
				</table>
				
				</div>
				<div class="sub_right_content-right">
				<div style="margin-left: 35%;">
				<button onclick="doDelete()">Multiple Delete </button>
				</div>
					<div class="edit">
						<h3>Add New Product</h3>
						<s:form >
							<table class="table_product">
								<tr>
									<s:textfield label="Product Name" id="pnamea" name="productName"></s:textfield>
									<s:textfield label="Product Price" id="pricea" name="productPrice"></s:textfield>
									
									<td><input type="button" onclick="add()" value="Add"/></td>
								</tr>
							</table>
						</s:form>
					</div>
					<div class="add">
						<h3>Edit Product</h3>
						<s:form>
						<%-- <span id="getdata">...</span> --%>
							 <table class="table_product">
								<tr>
									<s:hidden name="productId" id="pid"  value="%{product.productId}"></s:hidden>
									<td style="background-color: red;"><s:textfield  label="Product Name" id="pname" name="productName"
										value="%{product.productName}"></s:textfield></td>
									<s:textfield label="Product Price" id="price" name="productPrice"
										value="%{product.productPrice}"></s:textfield>
									<%-- <s:submit id="btnedit" align="center" value="Edit"></s:submit> --%>
									<td><input type="button" onclick="edit_click()" value="Edit"/></td>
								</tr>
							</table>
						</s:form>
					</div>
					<div class="add">
						<h3>Search Product</h3>
						<s:form action="ProductManagement?command=search">
						<%-- <span id="getdata">...</span> --%>
							 <table class="table_product">
								<tr>
									<s:hidden name="productId" value="%{product.productId}"></s:hidden>
									<s:textfield label="Product Name" name="productName"
										value=""></s:textfield>
									<s:submit align="center" value="Search"></s:submit>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>