<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="js/function.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css" />
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

<script type="text/javascript">
var tableProduct = null;
$(document).ready(function() {	
	
		$('.nav-trigger').click(function() {
			$('.side-nav').toggleClass('visible');
		});
		
				
					
		tableProduct = $('#tableproduct').DataTable({
						 responsive: true,
						 "sScrollY" : "480px",
						 "lengthMenu" : [15, 20, 50, 100],
						 "iDisplayLength" : 15,
						"bProcessing": true,
						"autoWidth": false,
						
						"pagingType": "full_numbers",
						"aoColumnDefs" : [ {
							bSortable : false,
							aTargets : [3,4,5,6,-1,-2,-3 ]
						}],
						"aoColumns": [{
							"Width": "2%",
							/* "mData": "cid", */
							"sTitle": "Category"
						},{
							"Width": "15%",
							/* "mData": "pname", */
							"sTitle": "Product Name"
						},{
							"Width": "5%",
							/* "mData": "price", */
							"sTitle": "Price"
						},{
							"Width": "5%",
							/* "mData": "color", */
							"sTitle": "Color"
						},{
							"Width": "10%",
							/* "mData": "brand", */
							"sTitle": "Brand"
						},{
							"Width": "5%",
							/* "mData": "discount", */
							"sTitle": "Discount"
						},{
							"Width": "58%",
							/* "mData": "descript", */
							"sTitle": "Description"
						},{
							"sTitle": "Edit"
						},{
							"sTitle": "Delete"
						},{
							"sTitle": "Image"
						}
					]
					
					}); 
		//new $.fn.dataTable.FixedHeader( tableProduct );	
		getProduct();
    
} );
function getProduct(){
	$.ajax({
		url: 'ProductManager',
		type: 'GET',
		data: 'command=view',
		dataType: "json",
		Processing : true,
		serverSide : true,
		success: function(response){
			var list = response.listProduct;
			var len = list.length;
			var dataset = [];
			if(len > 0){
				for(var i = 0; i<len ; i++){
					var datarow=[];
					var pid = list[i].pid;
					var cid = list[i].cid;
					var pname = list[i].pname;
					var price = list[i].price;
					var color = list[i].color;
					var brand = list[i].brand;
					var discount = list[i].discount;
					var descript = list[i].descript;
					var edit = "<a style='text-decoration: none;' onclick='edit("+pid+")'"+">Edit</a>";
					var del = "<a style='text-decoration: none;' onclick='dele("+pid+")'"+">Delete</a>";
					var linkimg = "<a style='text-decoration: none;' onclick='linkimg("+pid+")'"+">View Image</a>";
					datarow.push(cid,pname,price,color,brand,discount,descript,edit,del,linkimg);
					dataset.push(datarow);
				}
				tableProduct.rows.add(dataset);
				tableProduct.draw();
			}
		}
	});
}
function edit(id){
	alert(id);
}
</script>

<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="js/main.js"></script>
</head>
<body>
<s:include value="general.jsp"></s:include>
<div class="main-content" >
		<div class="main" >
			<div class="widget "  >
				<div class="title">View Product</div>
				<div class="chart" >
					<table id="tableproduct"  >
						
					</table>
				</div>
			</div>
			
		</div>
	
	</div>
	

</body>
</html>