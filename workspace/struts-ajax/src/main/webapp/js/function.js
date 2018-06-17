/**
 * 
 */

function confirmDelete(){
	return window.confirm("Do you want to delete?");
}

function sortByName(n) {
	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("myTable");
	  switching = true;
	  dir = "asc"; 
	  while (switching) {
	    switching = false;
	    rows = table.getElementsByTagName("TR");
	    for (i = 1; i < (rows.length - 1); i++) {
	
	      shouldSwitch = false;
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      /*check if the two rows should switch place,
	      based on the direction, asc or desc:*/
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      //Each time a switch is done, increase this count by 1:
	      switchcount ++;      
	    } else {
	      /*If no switching has been done AND the direction is "asc",
	      set the direction to "desc" and run the while loop again.*/
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}

function sortByPrice(n) {
	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("myTable");
	  switching = true;
	  //Set the sorting direction to ascending:
	  dir = "asc"; 
	  /*Make a loop that will continue until
	  no switching has been done:*/
	  while (switching) {
	    //start by saying: no switching is done:
	    switching = false;
	    rows = table.getElementsByTagName("TR");
	    /*Loop through all table rows (except the
	    first, which contains table headers):*/
	    for (i = 1; i < (rows.length - 1); i++) {
	      //start by saying there should be no switching:
	      shouldSwitch = false;
	      /*Get the two elements you want to compare,
	      one from current row and one from the next:*/
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      /*check if the two rows should switch place,
	      based on the direction, asc or desc:*/
	      if (dir == "asc") {
	        if (parseFloat(x.innerHTML) > parseFloat(y.innerHTML)) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (parseFloat(x.innerHTML) < parseFloat(y.innerHTML)) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      //Each time a switch is done, increase this count by 1:
	      switchcount ++;      
	    } else {
	      /*If no switching has been done AND the direction is "asc",
	      set the direction to "desc" and run the while loop again.*/
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}

function myFunction() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}

var tableProduct;
/*var tableOrder = null;*/

function doDelete(){
	var count  = 0;
	var isdel=true;
	$("#table_id input[name='s']:checked").each(function(){
		count++;
	});
	var r = confirm("Confirm Delete " + count + " record(s)");
	if (r == true) {
		var d;
	    $("#table_id input[name='s']:checked").each(function(){
	        d = $(this).val();
	        
	        tableProduct.row( $(this).parents('tr')).remove();
	        $.ajax({
	    		cache: false,
	            url : 'ProductManagement',
	            type : 'GET',
	            data: 'command=delete&productId=' + d,
	            dataType : "json",
	            error: function(errorThrown){
	            	idel = false; 	
	            },
	            
	    	});
	    });
	    if(isdel){
	    	var info = tableProduct.page.info();
			var page = info.page;
			alert("Delete "+count+ " record(s) successfully");
			tableProduct.clear();
			getAllProduct(page);
	    }else{
	    	alert("Error");
	    }
	    
	} 
	
	
}

function add(){
	var name = $('#pnamea').val();
	var price = $('#pricea').val();
	$.ajax({
		cache: false,
		url: 'ProductManagement',
		type: 'POST',
		data: 'command=add&productName='+name+'&productPrice='+price,
		dataType: "json",
		success: function(){
			var info = tableProduct.page.info();
			var page = info.page;
			alert("Add successfully!");
			tableProduct.clear();
			getAllProduct(page);
		},
		error: function(request, errorThrown){
			alert("Can't add beacause "+errorThrown);
		}
	
	});
}

function edit(id,n,p){
	
	$.ajax({
		cache: false,
		url: 'ProductManagement',
		type: 'GET',
		data: 'command=editview&productId='+id,
		dataType: "json",
		success: function(response){
			var product = response.product;
			$('#pid').val(product.productID);
			$('#pname').val(product.productName);
			$('#price').val(product.productPrice);
		}
	});
	
}

function dele(id){
	var accept = confirm("Are you want to delete?");
	if(accept){
		$.ajax({
			cache: false,
			url: 'ProductManagement',
			type: 'GET',
			data: 'command=delete&productId='+id,
			dataType: "json",
			success: function(response){
				var info = tableProduct.page.info();
				var page = info.page;
				alert("Delete successfully");
				tableProduct.clear();
				getAllProduct(page);
			},
			error: function(request, errorThrown){
				alert("Can't delete this Product because "+errorThrown);
			}
		
		});
	}
}

function edit_click(){
	var pid = $('#pid').val();
	var pname = $('#pname').val();
	var price = $('#price').val(); 
		$.ajax({
			cache: false,
			url: 'ProductManagement',
			type: 'POST',
			data: 'command=edit&productId='+pid+'&productName='+pname+'&productPrice='+price,
			dataType: "json",
			success: function(response){
				var info = tableProduct.page.info();
				var page = info.page;
				alert("Edit successfully!!!");
				
				tableProduct.clear();
				getAllProduct(page);
			}
		});
}




$(document).ready(function() {
	tableProduct = $('#table_id').DataTable({
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
			aTargets : [ 0,-1,-2 ]
		} ,{
			"targets": [0,1],
		    "createdCell": function (td, cellData, rowData, row, col) {
		      if(row ==0 || row % 2 ==0){
		    	  $(td).css('background-color', '#f1f1f1');
		      }
		    }
		}],
		"pagingType": "full_numbers",
		"bSort" : true,
		"aoColumns" : [ {
			"width" : "3%",
			"sTitle": ""	
		}, {
			"width" : "80%",
			"sTitle": "Product Name"
		}, {
			"width" : "15%",
			"sTitle": "Product Price"
		}, {
			"width" : "2%",
			"sTitle": "Option" 		
		},{
			"width" : "0%",
			"sTitle": "" 
		} ],
		"dom": '<"top"lf>t<"bottom"ip><"clear">'

	});
	var info = tableProduct.page.info();
	var page = info.page;
	getAllProduct(page);
	
});


/*
 * ---------------------------------DEMO CUSTOMIZE DATATABLE-------------------------------------
*/






/*
 * -----------------------------------get data to fill table---------------------------------------
*/
function getAllProduct(page) {
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
			
			var listProduct = response.listProduct;
			var length = listProduct.length;
			
			if (length > 0) {
				for (var i = 0; i < length; i++) {
					var pid = listProduct[i].productID;
					var price = listProduct[i].productPrice;
					var name = listProduct[i].productName;
					
					var checkbox = "<input type='checkbox'  id='checkbox' name='s' value='"+pid+"'  />";
					//var edit = "<a style='text-decoration: none;' onclick='edit("+listProduct[i].productID+",'"+name+"',"+price+")'"+">Edit</a>";
					var edit = "<a style='text-decoration: none;' onclick='edit("+pid+")'"+">Edit</a>";
					var del = "<a style='text-decoration: none;' onclick='dele("+pid+")'"+">Delete</a>";	
					var row = tableProduct.row.add([checkbox,name,price,edit,del]).node();
					if(i==0 || (i%2)==0){
						$(row).css('background-color','#f9f9f9');
					}
					
				}
				tableProduct.draw();
				$('#table_id').dataTable().fnPageChange(page);
			}
		},
		error : function(jqXhr, textStatus, errorThrown) {
			alert(""+errorThrown);
		}
	});
}



