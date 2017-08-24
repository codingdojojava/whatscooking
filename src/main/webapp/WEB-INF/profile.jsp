<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Profile</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<style>
.center {
    margin-top:50px;   
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
    	padding: 0;
	}
    
.modal-footer .btn-group button {
	height:40px;
	border-top-left-radius : 0;
	border-top-right-radius : 0;
	border: none;
	border-right: 1px solid #ddd;
}
	
.modal-footer .btn-group:last-child > button {
	border-right: 0;
}
	body {
	    background: linear-gradient(rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), url(http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_1447/v1503556990/aurelien-sinte-328790_qdbrgp.jpg) center center no-repeat fixed;
	    background-size: cover;
	    -webkit-font-smoothing: antialiased;
	    text-rendering: optimizelegibility;
	}
	
	.change_size {
		height: 100px;
		background: linear-gradient(rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6));
		color: black;
		border: none;
		font-size: 20px;
	}
	
	.bgtab {
		height: 100%;
		margin-top: -230px;
	}
	
	.wellcontent {
		background: none;
		border: none;
		color: black;
	}
	
	.cardbgnew {
		background: none;
		
	}
	
	.behindz {
		z-index: 1;
		background: none;
		text-decoration: none;
		border: none;
	}
	
	.tabcontent {
		    margin-left: 980px;
		    min-height: 480px;
    			padding: 50px;
    			background: linear-gradient(rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4));
	}
</style>
</head>
<body>
	<div class="row">
	    <div style="margin-top: 20px;" class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
	        <div class="btn-group" role="group">
	            <button type="button" id="stars" class="btn btn-primary change_size" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	                <div class="hidden-xs">Profile</div>
	            </button>
	        </div>
	        <div class="btn-group" role="group">
	            <button type="button" id="favorites" class="btn btn-default change_size" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
	                <div class="hidden-xs">Favorites</div>
	            </button>
	        </div>
	        <div class="btn-group" role="group">
	            <button type="button" id="following" class="btn btn-default change_size" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
	                <div class="hidden-xs">Grocery List</div>
	            </button>
	        </div>
	        <div class="btn-group" role="group">
	            <button type="button" id="following" class="btn btn-default change_size" href="#tab4" data-toggle="tab"><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
	                <div class="hidden-xs">Meal Plans</div>
	            </button>
	        </div>
	    </div>
	    
			<div class="col-lg-12 col-sm-12">
		    <div class="card hovercard" style="width: 15%; margin-left: 76%; background: none;">
		        <div class="card-background cardbgnew">
		            <!-- <img class="card-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/"> -->
		            <!-- http://lorempixel.com/850/280/people/9/ -->
		        </div>
		        <div class="useravatar" style="z-index: 1;">
		            <img alt="" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg">
		        </div>
		    </div>
		        <div class="well wellcontent">
		      <div class="tab-content">
		        <div class="tab-pane fade in active bgtab" id="tab1">
		        		<div class="row tabcontent">
		        		<button class="behindz" data-toggle="modal" data-target="#squarespaceModal">Edit Profile</button>
		          <h3>First Name: <c:out value="${currentUser.firstname}"></c:out></h3>
		          <h3>Last Name: <c:out value="${currentUser.lastname}" /></h3>
		          <h3>Email: <c:out value="${currentUser.username}"></c:out></h3>
		          <h3>Diet: 
		          	<c:forEach items="${currentUser.diets}" var="diet">
		          		<c:out value="${diet.name}" />
		          	</c:forEach>
		          </h3>
		          <h3>Allergies: 
		          	<c:forEach items="${currentUser.allergies}" var="allergy">
		          		<c:out value="${diet.name}" />
		          	</c:forEach>
		          </h3>
		        		</div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab2">
		          	        		<div class="row tabcontent">
		          <h3>This is tab 1</h3>
		        		</div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab3">
		          	        		<div class="row tabcontent">
		          <h3>This is tab 1</h3>
		        		</div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab4">
		          	        		<div class="row tabcontent">
		          <h3>This is tab 1</h3>
		        		</div>
		        </div>
		      </div>
		    </div>
		
		    
		    </div>
	            
	</div>
	
	
	


<!-- line modal -->
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
			<form>
              <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
              </div>
              <div class="form-group">
                <label for="exampleInputFile">File input</label>
                <input type="file" id="exampleInputFile">
                <p class="help-block">Example block-level help text here.</p>
              </div>
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Check me out
                </label>
              </div>
              <button type="submit" class="btn btn-default">Submit</button>
            </form>

		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
				</div>
				<div class="btn-group btn-delete hidden" role="group">
					<button type="button" id="delImage" class="btn btn-default btn-hover-red" data-dismiss="modal"  role="button">Delete</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
	
	
	
   <script type="text/javascript">
   $(document).ready(function() {
	   $(".btn-pref .btn").click(function () {
	       $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	       // $(".tab").addClass("active"); // instead of this do the below 
	       $(this).removeClass("btn-default").addClass("btn-primary");   
	   });
	   });
   </script>
</body>
</html>