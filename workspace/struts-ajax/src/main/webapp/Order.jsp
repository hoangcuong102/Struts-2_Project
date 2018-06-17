<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
var tableOrder = null;
var tableOrderLine = null;
$(document).ready(function() {
	tableOrder = $('#table_order').DataTable({
		"sScrollY" : "500px",
		"lengthMenu" : [15, 20, 50, 100],
		"aaSorting" : [],
		"bAutoWidth" : true,
		"language" : {
			"processing" : "DataTables is currently busy",
			"decimal": ",",
            "thousands": "."
		},
		"iDisplayLength" : 15,
		"aoColumnDefs" : [ {
			bSortable : false,
			aTargets : [ ]
		},{
			"targets": 0,
		    "createdCell": function (td, cellData, rowData, row, col) {
		      if(row ==0 || row % 2 ==0){
		    	  $(td).css('background-color', '#f1f1f1');
		      }
		    }
		}],
		"pagingType": "full_numbers",
		"bSort" : true,
		"aoColumns" : [ {
			"width" : "25%",
			"sTitle": "OrderID"	
		}, {
			"width" : "25%",
			"sTitle": "OrderDate"
		}, {
			"width" : "25%",
			"sTitle": "CustomerID"
		}, {
			"width" : "25%",
			"sTitle": "Payment" 		
		} ],
		"dom": '<"top"lf>t<"bottom"ip><"clear">'

	});
	
	var info = tableOrder.page.info();
	var page = info.page;
	getAllOrder(page);

});
function getAllOrder(page){
	
	$.ajax({
		cache: false,
		url: 'OrderManagement',
		type: 'GET',
		data: 'command=view',
		dataType: "json",
		success: function(response){
			
			var listOrder = response.listOrder;
			var len = listOrder.length;
			if(len > 0){
				for(var i = 0; i< len; i++){
					var orderId = listOrder[i].orderID;
					var orderdate = listOrder[i].orderDate;
					var customerID = listOrder[i].customerID;
					var cus = "\""+customerID+"\"";
					var payment = listOrder[i].payment;
					var idlink = "<a class='orderlink' onclick='viewOrderLine("+orderId+")' >"+orderId+"</a>";
					var customeridlink = "<a onclick='viewCustomer("+cus+")'>"+customerID+"</a>";
					if(payment === null)
						payment = 'not yet';
						 var n = tableOrder.row.add([idlink,orderdate,customeridlink,payment]).node();
						 if(i==0 || (i%2) == 0)
						$(n).css('background-color','#f9f9f9');
					
				}
				tableOrder.draw();
				
				$('#table_order').dataTable().fnPageChange(page);
			}
		}
	});
}
function viewCustomer(customerid){
	$.ajax({
		url: 'CustomerManager',
		type: 'POST',
		data: 'command=viewcustomer&customerID='+customerid,
		dataType: "json",
		success: function(response){
			var customer = response.customer;
			alert("CustomerID: "+customerid+"\nCustomerName: "+customer.customerName);
		}
	});
}

function viewOrderLine(orderid){
	document.getElementById("overlay").style.display = "block";
	$('#loader').hide();
	$('#title').text('Order '+orderid);
	$(document).ready(function() {
		tableOrderLine = $('#table_orderline').DataTable({
			"sScrollY" : "200px",
			
			"aoColumnDefs" : [ {
				bSortable : false,
				aTargets : [ ]
			},{
				"targets": 0,
			    "createdCell": function (td, cellData, rowData, row, col) {
			      if(row ==0 || row % 2 ==0){
			    	  $(td).css('background-color', '#f1f1f1');
			      }
			    }
			}],
			"paging": false,
			"searching": false,
			 "retrieve": true,
			"bSort" : true,
			"aoColumns" : [ {
				"width" : "25%",
				"sTitle": "ProductID"
			}, {
				"width" : "25%",
				"sTitle": "Quantity"
			}, {
				"width" : "25%",
				"sTitle": "UnitPrice" 		
			} ],
			"dom": '<"clear">Clftrip'

		});
		
		var info = tableOrderLine.page.info();
		var page = info.page;
		abc(page,orderid);
	});
	
	
}

function abc(page,orderid){
	
	$.ajax({
		url: 'OrderManagement',
		type: 'POST',
		data: 'command=vieworder&orderID='+orderid,
		dataType: "json",
		beforeSend:  function(){ $("img#loader").show(); },
		success: function(response){
			var listOrderline = response.listOrderLine;
			var len = listOrderline.length;
			tableOrderLine.clear();
			for(var i = 0; i< len;i++){
				var orderid = listOrderline[i].orderID;
				var productid = listOrderline[i].productID;
				var quantity = listOrderline[i].quantity;
				var unitprice = listOrderline[i].unitprice;
				var n = tableOrderLine.row.add([productid,quantity,unitprice]).node();
				 if(i==0 || (i%2) == 0)
				$(n).css('background-color','#f9f9f9');
			}
			tableOrderLine.draw();
			
			$('#table_orderline').dataTable().fnPageChange(page);
		}
	});
}
 function off() {
    document.getElementById("overlay").style.display = "none";
}  
</script>
<style type="text/css">
#overlay {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 2;
	transition: 0.5s;
}

#orderline_overlay {
	width: 50%;
	height:55%;
	background-color: #ffffff;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	font-size: 14px;
	 box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.dropbtn {
    background-color: #3498DB;
    color: white;
    padding: 10px;
    font-size: 12px;
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #2980B9;
}
#content_orderline{
text-align: center;
}
</style>
<title>Order Management</title>
</head>
<body onload="getAllOrder()">
	<div id="container">
		<div id="overlay" >
			<div id="orderline_overlay">
				<div id="title" style="text-align: center; font-size: 30px; font-weight: bold;"></div>
				<div id="content_orderline">
				
					<table id="table_orderline">
						
					</table>
					<button onclick="off()" class="dropbtn">Close</button>
				</div>
				<div>
				
				
				</div>

			</div>
		</div>

		<div id="header">
			<h1 class="header_title">Product Management System</h1>
		</div>
		<div id="content">
			<s:include value="content-left.jsp"></s:include>
			<div class="content-right">
			<img id="loader" src="loader.gif" />
				<table height="500px" id="table_order">

				</table>

			</div>
		</div>

	</div>

</body>
</html>