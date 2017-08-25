<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
	.daycircle{
		border-radius: 50%;
	}
	.day{
		display:inline-block;
		height: 150px;
		width: 150px;
		border: 1px solid black;
		vertical-align:top;
	}
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
		          		<c:out value="${allergy.name}" />
		          	</c:forEach>
		          </h3>
		        		</div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab2">
		          <div class="row tabcontent" id="favtab">
		          
		          
		        	  </div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab3">
		          	 <div class="row tabcontent" id="groctab">

		        		</div>
					</div>
					<div class="tab-pane fade in bgtab" id="tab4">
						<div class="row tabcontent" id="plantab" style="width: 80%; margin-left: 0;">
						<h2>${currentUser.selected.name}</h2>
						<div id="week">
							
						</div>
						
						<h3 style="text-align:right"><button class="behindz" data-toggle="modal" data-target="#plansquarespaceModal">Create New Plan</button></h3>
		          <c:forEach items="${plans}" var="plan" >
				  
					  
					  <form class='selectWeek' method="POST" action="/home/profile/${plan.id}/change-selected">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input class="links" style="text-decoration: none; background:none; border: none;" type="submit" value="${plan.name}" />
							</form>
			    		
		          <form method="POST" action="/home/plans/${plan.id}/delete">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<!-- <input class="links" type="submit" value="Remove Plan" /> -->
					<button class='btn btn-secondary' type='submit'><span class="glyphicon glyphicon-trash"></span></button>
			    		</form>
			    		
		          </c:forEach>
		          
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
			<h3 class="modal-title" id="lineModalLabel">Edit Profile</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
			<form:form method="POST" action="/home/profile" modelAttribute="user">
			<form:hidden path="id"/>
			<form:hidden path="favorites"/>
              <div class="form-group">
                <form:label path="firstname">First Name: </form:label>
                <form:input cssClass="form-control" path="firstname"/>
              </div>
              <div class="form-group">
                <form:label path="lastname">Last Name: </form:label>
                <form:input cssClass="form-control" path="lastname"/>
              </div>
              <div class="form-group">
                <form:label path="username">Email: </form:label>
                <form:input cssClass="form-control" path="username"/>
              </div>
				<div class="form-group">
		                                		<div class="row">
			                                    <label class="col-sm-2 control-label">Diets:</label>
			                                    
			                                    <c:forEach var="diet" items="${diets}" varStatus="loop">
													
													<c:choose>
													
														
 														<c:when test="${loop.index eq 2}">
														
																<div class="col-sm-1 checkbox_container">
												        				<form:checkbox class="form-control shrinkify" path="diets" value="${diet}"/>
												        			</div>
												        			<div class="col-sm-2 label_checkbox">
												        				<label>${diet.name}</label>
												        			</div>
															</div>
															
														</c:when> 
														
 														<c:when test="${loop.index eq 5}">
														
																<div class="col-sm-1 checkbox_container">
												        				<form:checkbox class="form-control shrinkify" path="diets" value="${diet}"/>
												        			</div>
												        			<div class="col-sm-2 label_checkbox">
												        				<label>${diet.name}</label>
												        			</div>
															</div>
															
														</c:when> 
														
 														<c:when test="${loop.index eq 3 }">
									        					<div class="row">
									        					<div class="col-sm-2"></div>
									        					<div class="col-sm-1 checkbox_container">
											        				<form:checkbox class="form-control shrinkify" path="diets" value="${diet}"/>
											        			</div>
											        			<div class="col-sm-2 label_checkbox">
											        				<label>${diet.name}</label>
											        			</div>
														</c:when> 
														
														<c:otherwise>
											        			<div class="col-sm-1 checkbox_container">
											        				<form:checkbox class="form-control shrinkify" path="diets" value="${diet}"/>
											        			</div>
											        			<div class="col-sm-2 label_checkbox">
											        				<label>${diet.name}</label>
											        			</div>
														</c:otherwise>
														
													</c:choose>
													
			                                    </c:forEach>
			                  				</div>
			                  				
			                  			<div class="form-group">
		                                	   <div class="row">
			                                    <label class="col-sm-2 control-label">Allergies:</label>
	 		                                    	<c:forEach var="allergy" items="${allergies}" varStatus="loop">
													
													<c:choose>
													
														<c:when test="${loop.index eq 2 }">
																<div class="col-sm-1 checkbox_container">
												        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
												        			</div>
												        			<div class="col-sm-2 label_checkbox">
												        				<label>${allergy.name}</label>
												        			</div>
															</div>
														</c:when>
														<c:when test="${loop.index eq 5 }">
																<div class="col-sm-1 checkbox_container">
												        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
												        			</div>
												        			<div class="col-sm-2 label_checkbox">
												        				<label>${allergy.name}</label>
												        			</div>
															</div>
														</c:when>
														<c:when test="${loop.index eq 8 }">
																<div class="col-sm-1 checkbox_container">
												        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
												        			</div>
												        			<div class="col-sm-2 label_checkbox">
												        				<label>${allergy.name}</label>
												        			</div>
															</div>
														</c:when>
														<c:when test="${loop.index eq 9 }">
																<div class="row">
									        						<div class="col-sm-2"></div>
																<div class="col-sm-1 checkbox_container">
												        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
												        			</div>
												        			<div class="col-sm-2 label_checkbox">
												        				<label>${allergy.name}</label>
												        			</div>
															</div>
														</c:when>
														
														<c:when test="${loop.index eq 3 }">
									        					<div class="row">
									        					<div class="col-sm-2"></div>
									        					<div class="col-sm-1 checkbox_container">
											        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
											        			</div>
											        			<div class="col-sm-2 label_checkbox">
											        				<label>${allergy.name}</label>
											        			</div>
														</c:when>
														<c:when test="${loop.index eq 6 }">
									        					<div class="row">
									        					<div class="col-sm-2"></div>
									        					<div class="col-sm-1 checkbox_container">
											        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
											        			</div>
											        			<div class="col-sm-2 label_checkbox">
											        				<label>${allergy.name}</label>
											        			</div>
														</c:when>
														<c:otherwise>
											        			<div class="col-sm-1 checkbox_container">
											        				<form:checkbox class="form-control shrinkify" path="allergies" value="${allergy}"/>
											        			</div>
											        			<div class="col-sm-2 label_checkbox">
											        				<label>${allergy.name}</label>
											        			</div>
														</c:otherwise>
													</c:choose>
									        		</c:forEach> 
									        		</div>	
			                  				

              <button type="submit" class="btn btn-default">Update Changes</button>


            </form:form>
		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
				</div>
				<div class="btn-group btn-delete hidden" role="group">
					<button type="button" id="delImage" class="btn btn-default btn-hover-red" data-dismiss="modal"  role="button">Delete</button>
				</div>
				<div class="btn-group hidden" role="group">
					<button type="button" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
	
	
<div class="modal fade" id="plansquarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">Edit Profile</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
            <form:form method="POST" action="/home/addPlan" modelAttribute="plan">
			  <div class="form-group">
                <form:label path="name">Plan Name: </form:label>
                <form:input cssClass="form-control" path="name"/>
              </div>            
              <button type="submit" class="btn btn-default">Add Plan</button>
            </form:form>
			                  				



		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
				</div>
				<div class="btn-group btn-delete hidden" role="group">
					<button type="button" id="delImage" class="btn btn-default btn-hover-red" data-dismiss="modal"  role="button">Delete</button>
				</div>
				<div class="btn-group hidden" role="group">
					<button type="button" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
	
	
	
	
	
   <script type="text/javascript">
   $(".selectWeek").submit(function(e){
	   e.preventDefault();
	   $.ajax({
	       url:$(this).attr("action"),
	       method:'get',
	       success: function(res){
			   console.log("WE DONE ITTTTT");
			   $("#week").html(res);
	       }
		})
   })
	$.ajax({
	        url:"/selectedWeek",
	        method:'get',
	        success: function(res){
	            // console.log(res.images[0].hostedLargeUrl);
				console.log(res);
	            $("#week").html(res);
	        }
   		})
   $(document).ready(function() {
	   $(".btn-pref .btn").click(function () {
	       $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	       // $(".tab").addClass("active"); // instead of this do the below 
	       $(this).removeClass("btn-default").addClass("btn-primary");   
	   });
	   

   
   <c:forEach items="${favoritess}" var="favorite" varStatus="loop">
	   $.ajax({
	       url:"http://api.yummly.com/v1/api/recipe/${favorite.name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	       method:'get',
	       success: function(res){
				console.log(res);
				var imgUrl = res.images[0]["hostedSmallUrl"];
	
				$("#favtab").append("<img src='"+imgUrl+"'><h3>"+res.name+"</h3><form method='POST' action='/home/favorites/${favorite.id}/delete'><input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/><input class='links' type='submit' value='Remove Favorite' /></form><p>"+res.cookTime+"</p>");
				
				
// 			$("#slide-content").append("<div id='slide-content-${loop.index}'><h2>"+ res.name +"</h2><p>Source: <a href='#'>"+res.source.sourceDisplayName+"</a></p><p>Rating: "+res.rating+"</p><p>Prep Time: "+res.prepTime+"</p><p>Cook Time: "+res.cookTime+"</p><p>Total Time: "+res.totalTime+"</p></div>");
//				$(".hide-bullets").append("<li class='col-sm-2'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+res.images[0]["hostedLargeUrl"]+"'></a></li>"); 
				
	       }
		})
   
	</c:forEach>
	   
   <c:forEach items="${shoppings}" var="favorite" varStatus="loop">
	   $.ajax({
	       url:"http://api.yummly.com/v1/api/recipe/${favorite.name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	       method:'get',
	       success: function(res){
				console.log(res);
				var imgUrl = res.images[0]["hostedSmallUrl"];
	
				$("#groctab").append("<img src='"+imgUrl+"'><h3>"+res.name+"</h3><form method='POST' action='/home/groceries/${favorite.id}/delete'><input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/><input class='links' type='submit' value='Remove Recipe' /></form><p>Ingredients: </p><ul id='ingredientList-${loop.index}'></ul>");
	       	
				var ingred = res.ingredientLines;
				console.log(ingred.length);
				
				for(var i=0; i < ingred.length; i++) {
					$("#ingredientList-${loop.index}").append("<li>"+ingred[i]+"</li>");
				}

				
				
				
// 			$("#slide-content").append("<div id='slide-content-${loop.index}'><h2>"+ res.name +"</h2><p>Source: <a href='#'>"+res.source.sourceDisplayName+"</a></p><p>Rating: "+res.rating+"</p><p>Prep Time: "+res.prepTime+"</p><p>Cook Time: "+res.cookTime+"</p><p>Total Time: "+res.totalTime+"</p></div>");
//				$(".hide-bullets").append("<li class='col-sm-2'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+res.images[0]["hostedLargeUrl"]+"'></a></li>"); 
				
	       }
		})
   
	</c:forEach>
	   
	   $.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.monRecipes[fn:length(current.selected.monRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#monimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})
   		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.tueRecipes[fn:length(current.selected.tueRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#tueimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})
   		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.wedRecipes[fn:length(current.selected.wedRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#wedimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})
   		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.thurRecipes[fn:length(current.selected.thurRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#thurimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})
   		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.friRecipes[fn:length(current.selected.friRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#friimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})
   		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.satRecipes[fn:length(current.selected.satRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#satimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})
   		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.sunRecipes[fn:length(current.selected.sunRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#sunimgs").html("<img class='daycircle' style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
   		})

	});
   </script>
</body>
</html>