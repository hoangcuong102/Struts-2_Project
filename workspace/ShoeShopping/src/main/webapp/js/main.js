/**
 * 
 */

function popupLogin(){
	document.getElementById('id01').style.display = 'block';
}



var tableProduct = null;
var tableImage = null;
var categorise;
let check = true;
$(document).ready(function() {	
	if(localStorage.getItem("hasload")==null){
		localStorage.setItem("hasload", check);
	}
	
		if(localStorage.getItem("hasload")==true){
			check = false;
			localStorage.setItem("hasload", check);
			alert('dsd');
			$.ajax({
				url: 'CategoryManager',
				type: 'GET',
				data: 'command=get',
				dataType: "json",
				success: function(response){
					categorise = response.listCategory;
				}
			});
		}
		$('.nav-trigger').click(function() {
			$('.side-nav').toggleClass('visible');
		});

		tableProduct = $('#tableproduct').DataTable({
						select: true,
						 responsive: true,
						 "sScrollY" : "400px",
						 "lengthMenu" : [10, 20, 50, 100],
						 "iDisplayLength" : 10,
						"bProcessing": true,
						"autoWidth": true,
						
						"pagingType": "full_numbers",
						"aoColumnDefs" : [ {
							bSortable : false,
							aTargets : [0,4,5,6,-1,-2,-3,-4 ]
						}],
						"aoColumns": [{
							"sTitle": ""
						},{
							/* "Width": "2%", */
							/* "mData": "cid", */
							"sTitle": "Category"
						},{
							/* "Width": "15%", */
							/* "mData": "pname", */
							"sTitle": "Product Name"
						},{
							/* "Width": "5%", */
							/* "mData": "price", */
							"sTitle": "Price"
						},{
							"sTitle": "Color"
						},{
							"sTitle": "Brand"
						},{
							"sTitle": "Discount"
						},{
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
		
		new $.fn.dataTable.FixedHeader( tableProduct );	
		getProduct();
    
} );

function popupAddProduct(){
	alert(categories.length);
	document.getElementById("overlay").style.display = "block";
	$('.tit').text("Add New Product");
	/*$.ajax({
		url: 'ProductManager',
		type: 'GET',
		data: 'command=add',
		dataType: "json",
		success: function(response){
			
		}
	});*/
	for(var i=0;i<categories.length;i++){
		var cid = categories[i].cid;
		var cname = categories[i].cname;
		if(cid==cid1){
			options += "<option selected value='"+cid+"'>"+cname+"</option>";
		}else{
			options += "<option value='"+cid+"'>"+cname+"</option>";
		}
		
	}
	$('#sel1').html(options);
	$('#pid').val('');
	$('#name').val('');
	$('#price').val('');
	$('#color').val('');
	$('#brand').val('');
	$('#discount').val('');
	$('#descript').val('');
}

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
			var listCategory = response.listCategory;
			var len = list.length;
			var dataset = [];
			tableProduct.clear();
			if(len > 0){
				for(var i = 0; i<len ; i++){
					var cname;
					var datarow=[];
					var pid = "\""+list[i].pid+"\"";
					var cid = list[i].cid;
					for(var j=0;j<listCategory.length;j++){
						if(listCategory[j].cid == cid)
							cname = listCategory[j].cname;
					}
					var pname = list[i].pname;
					var name = "\""+pname+"\"";
					var price = list[i].price;
					var color = list[i].color;
					var brand = list[i].brand;
					var discount = list[i].discount;
					var descript = list[i].descript;
					var checkbox = "<input type='checkbox'  id='checkbox' name='s' value='"+pid+"'  />";
					 var edit = "<a style='text-decoration: none; cursor: pointer;' onclick='edit("+pid+")'"+">Edit</a>"; 
					var del = "<a style='text-decoration: none; cursor: pointer;' onclick='dele("+pid+")'"+">Delete</a>";
					var linkimg = "<a style='text-decoration: none; cursor: pointer;' data-toggle='collapse' data-target='#imageshow' onclick='linkimg("+pid+","+name+")'"+">View Image</a>";
					
					datarow.push(checkbox,cname,pname,price,color,brand,discount,descript,edit,del,linkimg);
					dataset.push(datarow);
				}
				tableProduct.rows.add(dataset);
				tableProduct.draw();
			}
		}
	});
}
function edit(id){
	document.getElementById("overlay").style.display = "block";
	$('.tit').text('Edit Product '+id);
	$.ajax({
		url: 'ProductManager',
		type: 'GET',
		data: 'command=viewedit&pid='+id,
		dataType: "json",
		sync: false,
		success: function(response){
			var product = response.product;
			var cid1 = product.cid;
			categories = response.listCategory;
			var listCategory = response.listCategory;
			var len = listCategory.length;
			var options;
			for(var i=0;i<len;i++){
				var cid = categories[i].cid;
				var cname = categories[i].cname;
				if(cid==cid1){
					options += "<option selected value='"+cid+"'>"+cname+"</option>";
				}else{
					options += "<option value='"+cid+"'>"+cname+"</option>";
				}
				
			}
			$('#sel1').html(options);
			$('#pid').val(product.pid);
			$('#name').val(product.pname);
			$('#price').val(product.price);
			$('#color').val(product.color);
			$('#brand').val(product.brand);
			$('#discount').val(product.discount);
			$('#descript').val(product.descript);
		}
	});
	
}

function submitform(){
	var p = new Object();	
	p.cid = $('#sel1').val();
	p.pid = $('#pid').val();
	p.pname = $('#name').val();
	p.price = $('#price').val();
	p.color = $('#color').val();
	p.brand = $('#brand').val();
	p.discount = $('#discount').val();
	p.descript = $('#descript').val();
	p.command = "edit";
	$.ajax({
		url: 'ProductManager',
		type: 'POST',
		data: p,
		dataType: "json",
		success: function(response){
			alert("Edit successfully!");
			document.getElementById("overlay").style.display = "none";
			getProduct();
		},
		error:function(jqXhr, textStatus, errorThrown) {
            if(checkLoginRequiredForAjax(jqXhr)){
            showSystemErrorDialog("System Error");
            }
		}
	});
	
}

function dele(id){
	var select = confirm('Are you want to delete?');
	if(select ){
		
		 $.ajax({
			url: 'ProductManager',
			type: 'POST',
			data: "command=delete&pid="+id,
			dataType: "json",
			success: function(response){
				alert('Delete successfully!');
				tableProduct.clear();
				getProduct();
			}
			
		}); 
	}
}

function linkimg(id,name){
	$('#h2').text("Image of "+name);
	tableimage = $('#tableimage').DataTable({
		responsive: true,
		retrieve: true,
		"sScrollY": "200px",
		"bProcessing": true,
		"paging": false,
		"searching": false,
		"lengthChange": false,
		"ordering": false,
		"aoColumns": [{
			"sTitle": ""
		},{
			"sTitle": "Images"
		},{
			"sTitle": "Delete"
		}
	]
		
	});
	getImage(id);
}
function getImage(id){
	$.ajax({
		url: 'ProductManager',
		type: 'GET',
		data: 'command=viewImage&pid='+id,
		dataType: "json",
		Processing : true,
		serverSide : true,
		
		success: function(response){
			var listimage = response.listImage;
			var len = listimage.length;
			var dataset = [];
			tableimage.clear();
			for(var i=0;i<len;i++){
				var datarow = [];
				
				var url = "img/"+listimage[i];
				var checkbox = "<input type='checkbox'  id='checkbox' name='s' value='"+url+"'  />";
				var img = "<img src='"+url+"' alt='image' class='img-thumbnail' width='200' height='200'>";
				var del = "<a style='text-decoration: none; cursor: pointer;' onclick='dele("+url+")'"+">Delete</a>";
				datarow.push(checkbox,img,del);
				dataset.push(datarow);
			}
			tableimage.rows.add(dataset).draw();
			
		}
	});
}
