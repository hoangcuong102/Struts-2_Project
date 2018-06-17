<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>


</head>
<body>
	
	<div id="overlay">
	<div class="popup">
	<span style="position: fixed; font-size: 30px;" onclick="document.getElementById('overlay').style.display='none'" class="close" title="Close Modal">&times;</span>
		<div class="container">
		
		  <h2 class="tit"></h2>
		  <form class="form-horizontal">
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Category: </label>
		      <div class="col-sm-10">          
		        <select class="form-control" id="sel1" name="cid">
		        	
		        </select>
		      </div>
		    </div>
		     <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Product Name: </label>
		      <div class="col-sm-10">          
		        <input type="text" class="form-control" id="name" name="pname">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Price: </label>
		      <div class="col-sm-10">          
		        <input type="text" class="form-control" id="price" name="price">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Color: </label>
		      <div class="col-sm-10">          
		        <input type="text" class="form-control" id="color" name="color">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Brand: </label>
		      <div class="col-sm-10">          
		        <input type="text" class="form-control" id="brand" name="brand">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Discount: </label>
		      <div class="col-sm-10">          
		        <input type="text" class="form-control" id="discount" name="discount">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pwd">Description: </label>
		      <div class="col-sm-10">          
		        <textarea  class="form-control" id="descript" name="descript"></textarea>
		      </div>
		    </div>
		    <input type="hidden" id="pid"/>
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="button" onclick="submitform()" class="btn btn-primary btn-md">Submit</button>
		       
		      </div>
		    </div>
		  </form>
	</div>

	</div>
</div>

	<div class="header">
		<div class="logo">
			<i class="fa fa-tachometer"></i> <span>Administration</span>
		</div>
		<s:if test="#session.LoginUser != null">
		<div class="header-notify">
			<div class="dropdown for-notification">
				 <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <i class="fa fa-bell"></i>
                       <span class="count bg-danger">5</span>
                  </button>
                  <div class="dropdown-menu" aria-labelledby="notification">
                  	<p class="red">You have 3 Notification</p>
                            <a class="dropdown-item media bg-flat-color-1" href="#">
                                <i class="fa fa-check"></i>
                                <p>Server #1 overloaded.</p>
                            </a>
                            <a class="dropdown-item media bg-flat-color-4" href="#">
                                <i class="fa fa-info"></i>
                                <p>Server #2 overloaded.</p>
                            </a>
                            <a class="dropdown-item media bg-flat-color-5" href="#">
                                <i class="fa fa-warning"></i>
                                <p>Server #3 overloaded.</p>
                            </a>
                  </div>
			</div>
			<div class="dropdown for-message">
                          <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="message"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="glyphicon glyphicon-envelope"></i>
                            <span class="count bg-primary">9</span>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="message">
                            <p class="red">You have 4 Mails</p>
                            <a class="dropdown-item media bg-flat-color-1" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Jonathan Smith</span>
                                    <span class="time float-right">Just now</span>
                                        <p>Hello, this is an example msg</p>
                                </span>
                            </a>
                            <a class="dropdown-item media bg-flat-color-4" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Jack Sanders</span>
                                    <span class="time float-right">5 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                </span>
                            </a>
                            <a class="dropdown-item media bg-flat-color-5" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Cheryl Wheeler</span>
                                    <span class="time float-right">10 minutes ago</span>
                                        <p>Hello, this is an example msg</p>
                                </span>
                            </a>
                            <a class="dropdown-item media bg-flat-color-3" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Rachel Santos</span>
                                    <span class="time float-right">15 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                </span>
                            </a>
                          </div>
                    </div>
              <div class="user-area dropdown float-right " >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="https://png.icons8.com/color/260/user-male-circle.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="Profile?command=view&uid=<s:property value="#session.LoginUser.uid"/>"><i class="fa fa- user"></i>My Profile</a>

                                <a class="nav-link" href="logout?command=logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
		</div>
		</s:if>
		<a href="#" class="nav-trigger"><span></span></a>
		
	</div>
	<div class="header1">
	<s:if test="#session.LoginUser != null">
		<div class="dropdown for-notification">
				 <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <i class="fa fa-bell"></i>
                       <span class="count bg-danger">5</span>
                  </button>
                  <div class="dropdown-menu" aria-labelledby="notification">
                  	<p class="red">You have 3 Notification</p>
                            <a class="dropdown-item media bg-flat-color-1" href="#">
                                <i class="fa fa-check"></i>
                                <p>Server #1 overloaded.</p>
                            </a>
                            <a class="dropdown-item media bg-flat-color-4" href="#">
                                <i class="fa fa-info"></i>
                                <p>Server #2 overloaded.</p>
                            </a>
                            <a class="dropdown-item media bg-flat-color-5" href="#">
                                <i class="fa fa-warning"></i>
                                <p>Server #3 overloaded.</p>
                            </a>
                  </div>
			</div>
			<div class="dropdown for-message">
                          <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="message"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-bell"></i>
                            <span class="count bg-primary">9</span>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="message">
                            <p class="red">You have 4 Mails</p>
                            <a class="dropdown-item media bg-flat-color-1" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Jonathan Smith</span>
                                    <span class="time float-right">Just now</span>
                                        <p>Hello, this is an example msg</p>
                                </span>
                            </a>
                            <a class="dropdown-item media bg-flat-color-4" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Jack Sanders</span>
                                    <span class="time float-right">5 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                </span>
                            </a>
                            <a class="dropdown-item media bg-flat-color-5" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Cheryl Wheeler</span>
                                    <span class="time float-right">10 minutes ago</span>
                                        <p>Hello, this is an example msg</p>
                                </span>
                            </a>
                            <a class="dropdown-item media bg-flat-color-3" href="#">
                                <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                <span class="message media-body">
                                    <span class="name float-left">Rachel Santos</span>
                                    <span class="time float-right">15 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                </span>
                            </a>
                          </div>
                    </div>
              <div class="user-area dropdown float-right " >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="https://png.icons8.com/color/260/user-male-circle.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="Profile?command=view&uid=<s:property value="#session.LoginUser.uid"/>"><i class="fa fa- user"></i>My Profile</a>      

                                <a class="nav-link" href="logout?command=logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>
                    </s:if>
	</div>
	<div class="side-nav">
		<div class="logo">
			<i class="fa fa-tachometer"></i> <span>Dashboard</span>
		</div>
		
<%-- 		<div class="side-content">
			<a href="#" class="" aria-expanded="true"></a> 
			<a href="#"> <span>
					<i class="fa fa-shopping-bag"></i>
			</span> <span>Product Manager</span>
			</a>
		</div> --%>
		
		
		<div id="main-menu" class="main-menu collapse navbar-collapse">
		 	<ul class="nav navbar-nav">	 
                 <h3 class="menu-title">Product</h3>
                  <li class="menu-item-has-children dropdown">
                  		 <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                  		 	<i class="menu-icon fa fa-laptop"></i>
                  		 	 <span>Product Features</span>
                  			</a>
                  		 <ul class="sub-menu children dropdown-menu">
                  		 	<li><i class="fa fa-puzzle-piece"></i><a href="viewProduct.jsp">View</a></li>
                  		 	<li><i class="fa fa-puzzle-piece"></i><a href="#" onclick="popupAddProduct()">Add</a></li>
                  		 </ul>
                  </li>
                   <h3 class="menu-title">Order</h3>
                  <li class="menu-item-has-children dropdown">
                  		 <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                  		 	<i class="menu-icon fa fa-laptop"></i>
                  		 	 <span>Order Features</span>
                  			</a>
                  		 <ul class="sub-menu children dropdown-menu">
                  		 	<li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">View</a></li>
                  		 </ul>
                  </li>
		 	</ul>
		 </div>
		 
		 
	</div>
</body>
</html>