<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/function.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css" />
	<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
<title>ProductManagement</title>
<%-- <script>
$(document).ready(function(){
	$("a").click(function(){
		alert("Text: " + $("#name").text());
	});
		
	});

</script> --%>

<style type="text/css">
#myInput{
background: #E8E8E8;
	width: 100%;
	font-size: 16px;
	  padding: 12px 20px 12px 40px;
	  border: 1px solid #ddd;
	  background-position: 10px 10px;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1 class="header_title">Product Management System</h1>
		</div>
		<div id="content">
			<s:include value="content-left.jsp"></s:include>

			<!-- Interface for Display all Product -->
			<div class="content-right">
				<div class="sub_left_content-right">
					
					<input type="text" id="myInput" onkeyup="myFunction()"  title="Type in a name">
					
					<div class="tableA">
						<table class="table_product" id="myTable">
							<tr>
								<th>Product ID</th>
								<th title="click to sort by name" onclick="sortByName(1)">Product Name
									
								</th>
								<th title="click to sort by price" onclick="sortByPrice(2)">Product Price</th>
								<th colspan="2">Option</th>
							</tr>
							<s:iterator value="listProduct">
								<s:url action="ProductManagement" var="edit">
									<s:param name="command">editview</s:param>
									<s:param name="productId" value="%{productId}"></s:param>
								</s:url>

								<s:url action="ProductManagement" var="delete">
									<s:param name="command">delete</s:param>
									<s:param name="productId" value="%{productId}"></s:param>
								</s:url>

								<tr>
									<td><%-- <span id="${productId}"> --%>${productId}<%-- </span> --%></td>
									<td>${productName}</td>
									<td>${productPrice}</td>
									<td><a class="${productId}" href="${edit}">Edit</a></td>
									<td><a onclick="return confirmDelete()" href="${delete}">Delete</a></td>
								</tr>
								<%-- <script>
									$(document).ready(function(){
										$("a.${productId}").click(function(){
											$.get("edit.jsp", function(data) {
												$("#getdata").html(data);
											});
										});
		
									});

										</script> --%>
							</s:iterator>
						</table>
					</div>
					<!-- Paging -->
					<div class="paging">
						<s:iterator begin="1" end="%{paging}">
							<s:url action="ProductManagement" var="pagingURL">
								<s:param name="command">view</s:param>
								<s:param name="page" value="top" />


							</s:url>
							<s:if test="%{top==page}">
								<span class="currpage"><s:property value="top" /></span>
							</s:if>
							<s:else>
								<a href="${pagingURL}"> <s:property value="top" />
								</a>
							</s:else>
						</s:iterator>
					</div>
				</div>

				<!-- Interface for Add and Edit Product Function -->

				<div class="sub_right_content-right">
					<div class="edit">
						<h3>Add New Product</h3>
						<s:form action="ProductManagement?command=add">
							<table class="table_product">
								<tr>
									<s:textfield label="Product Name" name="productName"></s:textfield>
									<s:textfield label="Product Price" name="productPrice"></s:textfield>
									<s:submit align="center" name="notice" value="Add"></s:submit>

								</tr>
							</table>
						</s:form>
					</div>
					<div class="add">
						<h3>Edit Product</h3>
						<s:form action="ProductManagement?command=edit">
						<%-- <span id="getdata">...</span> --%>
							 <table class="table_product">
								<tr>
									<s:hidden name="productId" value="%{product.productId}"></s:hidden>
									<s:textfield label="Product Name" name="productName"
										value="%{product.productName}"></s:textfield>
									<s:textfield label="Product Price" name="productPrice"
										value="%{product.productPrice}"></s:textfield>
									<s:submit align="center" value="Edit"></s:submit>
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
		<div class="clearfix "></div>
		<div id="footer"></div>
	</div>
</body>
</html>