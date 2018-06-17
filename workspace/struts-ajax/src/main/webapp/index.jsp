<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css" />
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
var tableProduct;
$(document).ready(function() {
	tableProduct = $('#table_id1').DataTable({
		"sScrollY" : "500px",
		"lengthMenu" : [10, 20, 50, 100],
		"aaSorting" : [],
		"bAutoWidth" : true,
		"language" : {
			"processing" : "DataTables is currently busy",
			"decimal": ",",
            "thousands": "."
		},
		"order": [[2,'desc'],[1,'asc']],
		"iDisplayLength" : 10,
		"aoColumnDefs" : [ {
			bSortable : false,
			aTargets : [ 0,-1,-2 ]
		},{
			"targets": 2,
		    "createdCell": function (td, cellData, rowData, row, col) {
		      if ( cellData >100 ) {
		        $(td).css('color', 'red')
		      }
		    }
		}
		
		],
		"drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(2, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="4">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        },
		"stateSave": true,
		
		"pagingType": "full_numbers",
		"bSort" : true,
		"aoColumns" : [ {
			"width" : "3%",
			"sTitle": ""	
		}, {
			"width" : "70%",
			"sTitle": "Product Name"
		}, {
			"width" : "25%",
			"sTitle": "Product Price"
		}, {
			"width" : "2%",
			"sTitle": "Option" 		
		},{
			"width" : "0%",
			"sTitle": "" 
		} ],
		"dom" : '<"top"lf>t<"bottom"ip><"clear">'

	});
	var info = tableProduct.page.info();
	var page = info.page;
	drawData(page);
	
	$('#table_id1 tbody').on('click', 'td', function(){
		var data = tableProduct.cell(this).data();
		
		alert(data);
	});
	
});

function drawData(page) {
	$.ajax({
		cache : false,
		url: 'ProductManagement',
		type: 'GET',
		
		data : 'command=view',
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		Processing : true,
		serverSide : true,
		success : function(response) {
			var dataSet = [];
			var listProduct = response.listProduct;
			var length = listProduct.length;
			
			if (length > 0) {
				for (var i = 0; i < length; i++) {
					var pid = listProduct[i].productID;
					var price = listProduct[i].productPrice;
					var name = listProduct[i].productName;
					var dataRow = [];
					var checkbox = "<input type='checkbox'  id='checkbox' name='s' value='"+pid+"'  />";
					//var edit = "<a style='text-decoration: none;' onclick='edit("+listProduct[i].productID+",'"+name+"',"+price+")'"+">Edit</a>";
					var edit = "<a style='text-decoration: none;' onclick='edit("+pid+")'"+">Edit</a>";
					var del = "<a style='text-decoration: none;' onclick='dele("+pid+")'"+">Delete</a>";
					
					dataRow.push(checkbox,name,price, edit, del);
					dataSet.push(dataRow);
					
				}
				tableProduct.rows.add(dataSet).draw();
				$('#table_id1').dataTable().fnPageChange(page);
			}
		},
		error : function(jqXhr, textStatus, errorThrown) {
			alert(""+errorThrown);
		}
	});
}
</script>
</head>
<body>
<table id="table_id1">

</table>

</body>
</html>