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
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<style>
	#list-meal-plans {
    background: rgba(51, 122, 183 ,0.0);
    width: 19%;
    margin-top: -42%;
    margin-left: 1%;
    min-height: 520px;
    font-size: 28px;
    box-sizing: border-box;
    padding: 21px;
    padding-top: 26%;
    height: 1000px;
    z-index: 7;
	}

	.daycircle{
		border-radius: 50%;
	}
	.day{
		display:inline-block;
		height: 150px;
		width: 150px;
		border: 1px solid black;
		vertical-align:top;
		box-shadow:0 0 5px #000;
		border-radius: 50%;
		 margin-right: 14px;
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
		    margin-left: 0px;
		    min-height: 480px;
    			padding: 50px;
    			background: linear-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0.7));
    			border-radius: 1%;
    			box-shadow:0 0 25px #fff;
	}
	
	
	.hide-bullets {
    list-style:none;
    margin-left: -40px;
    margin-top:20px;
}

.thumbnail {
    padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
    width: 100%;
}
	
</style>
</head>
<body>
      <div class="row" style="margin-top: 10px;">
            <ul class="largenav pull-right">
                
              	<li style="margin-top:1px;" class="upper-links"><a href="/home" class="links"> <span style="font-size: 16px; top: 3px;" class="glyphicon glyphicon-home"></span>  Home</a></li>
              	<li class="upper-links"><a href="/home/profile" class="links">My Profile</a></li>
				 <li class="upper-links"><form id="logoutForm" method="POST" action="/logout">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        <input style="background: none;, border: none; text-decoration: none; box-shadow: none; border: none;     margin-right: 114px;" class="links" id="logout" type="submit" value="Logout" />
				    </form></li>
            </ul>
        </div>

	<div class="row">
	    <div style="z-index: 1;" class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
	        <div class="btn-group" role="group">
	            <button type="button" id="stars" class="btn btn-primary change_size barbutton" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	                <div class="hidden-xs">Profile</div>
	            </button>
	        </div>
	        <div class="btn-group" role="group">
	            <button type="button" id="favorites" class="btn btn-default change_size barbutton" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
	                <div class="hidden-xs">Favorites</div>
	            </button>
	        </div>
	        <div class="btn-group" role="group">
	            <button type="button" id="following" class="btn btn-default change_size barbutton" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
	                <div class="hidden-xs">Grocery List</div>
	            </button>
	        </div>
	        <div class="btn-group" role="group">
	            <button type="button" id="following" class="btn btn-default change_size barbutton" href="#tab4" data-toggle="tab"><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
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
		        </div>
		    </div>
		        <div class="well wellcontent" style="padding: 0;">
		      <div class="tab-content">
		        <div class="tab-pane fade in active bgtab" id="tab1">
		        		<div class="row tabcontent">
		        		<button class="behindz" data-toggle="modal" data-target="#squarespaceModal">Edit Profile</button>
		          <h3>First Name: <c:out value="${currentUser.firstname}"></c:out></h3>
		          <h3>Last Name: <c:out value="${currentUser.lastname}" /></h3>
		          <h3>Email: <c:out value="${currentUser.username}"></c:out></h3>
		          <h3>Diets: 
		          	<c:forEach items="${currentUser.diets}" var="diet">
		          		<div><c:out value="${diet.name}" /></div>
		          	</c:forEach>
		          </h3>
		          <h3>Allergies: 
		          	<c:forEach items="${currentUser.allergies}" var="allergy">
		          		<div><c:out value="${allergy.name}" /></div>
		          	</c:forEach>
		          </h3>
		        		</div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab2">
		          <div class="row tabcontent" id="favtab" style="margin-left: 0;">
		          
		          
		          
		          
		          
		          
		          
<div class="container">
    <div id="main_area">
        <!-- Slider -->
        <div class="row">
            <div class="col-sm-6" id="slider-thumbs">
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets" id="favthumblist">
                
  
                </ul>
            </div>
            <div class="col-sm-6">
                <div class="col-xs-12" id="slider">
                    <!-- Top part of the slider -->
                    <div class="row">
                        <div class="col-sm-12" id="carousel-bounding-box">
                            <div class="carousel slide" id="myCarousel">
                                <!-- Carousel items -->
                                <div class="carousel-inner" id="favlargelist">

                                    
                                </div>
                                <!-- Carousel nav -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                            
                        </div>

                    </div>
                </div>
            </div>
            <!--/Slider-->
        </div>

    </div>
</div>
		          
		          
		          
		          
		          
		          
		          
		          
		          
		        	  </div>
		        </div>
		        <div class="tab-pane fade in bgtab" id="tab3">
		          	 <div class="row tabcontent" id="groctab">

		        		</div>
					</div>
					<div class="tab-pane fade in bgtab" id="tab4">
						<div class="row tabcontent" id="plantab" style="width: 100%; margin-left: 0;min-height: 30px;height: 328px; margin-top: 4%;">
						<h2 style="margin-left: 30px; font-size: 21px;">You are viewing: <span id="weekName">${currentUser.selected.name}</span></h2>
						<div id="week" style="margin-left: 30%; margin-top: 3%;">
							
						</div>
						
						<h3 style="text-align:right"><button class="behindz" data-toggle="modal" data-target="#plansquarespaceModal" style="margin-top: 2%;margin-right: 3%;font-size: 18px;"><span class="glyphicon glyphicon-plus"> </span> Create New Plan</button></h3>
		          <div id="list-meal-plans">
		          <c:forEach items="${plans}" var="plan" >
		          <div>
		          			    		<div style="display: inline-block;" >
		          <form method="POST" action="/home/plans/${plan.id}/delete">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<!-- <input class="links" type="submit" value="Remove Plan" /> -->
					<button style="display:inline; background:none;" class='btn btn-secondary' type='submit'><span class="glyphicon glyphicon-trash"></span></button>
			    		</form>
			    		
			    		</div>
		          <div style="display: inline-block;" >
					  <form class='selectWeek' method="POST" action="/home/profile/${plan.id}/change-selected">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input class="links" style="text-decoration: none; background:none; border: none; display:inline; " type="submit" value="${plan.name}" />
							</form>
			    		
			    		</div>

		          </div>
		          </c:forEach>
		          
		          </div>
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
              
                <form:hidden cssClass="form-control" path="password"/>
       
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
 														<c:when test="${loop.index eq 6 }">
									        					<div class="row">
									        					<div class="col-sm-2"></div>
									        					<div class="col-sm-1 checkbox_container">
											        				<form:checkbox class="form-control shrinkify" path="diets" value="${diet}"/>
											        			</div>
											        			<div class="col-sm-2 label_checkbox">
											        				<label>${diet.name}</label>
											        			</div>
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
			                  				
<!-- 		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="submit" class="btn btn-default" data-dismiss="modal"  role="button">Update</button>
				</div>
			</div>
		</div>
              <button type="submit" class="btn btn-default">Update Changes</button> -->


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
					<button type="submit" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Update</button>
				</div>
			</div>
		</div>
            </form:form>
	</div>
  </div>
</div>
	
	
<div class="modal fade" id="plansquarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">Create a New Plan</h3>
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
	
	$(".barbutton").click(function(e){
		$(this).addClass("active");
		$(this).parents().siblings().children().removeClass("active");
	})
   var randomnumber = Math.floor(Math.random() * (4 - 0 + 1)) + 0;
   var bgpics = ["http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_1525/v1503650953/brooke-lark-93583_ipbwsq.jpg","http://res.cloudinary.com/rockafella20/image/upload/v1503650949/monstruo-estudio-574_tmoiyo.jpg","http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_1585/v1503650951/brenda-godinez-229718_w9tcm1.jpg","http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_1323/v1503650719/brooke-lark-212309_zcgwy9.jpg","http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_3246/v1503556990/aurelien-sinte-328790_qdbrgp.jpg"]
   var rbgimage = "linear-gradient(rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), url("+bgpics[randomnumber]+") center center no-repeat fixed"
   $('body').css("background",rbgimage)
   $('body').css("background-size","cover")
   
   $(".selectWeek").submit(function(e){
	   e.preventDefault();
	   $.ajax({
	       url:$(this).attr("action"),
	       method:'get',
	       success: function(res){
			   console.log("WE DONE ITTTTT");
			   $("#week").html(res);
			   $.ajax({
				   url:"/getWeekName",
				   method:'get',
				   success: function(res){
					   console.log(res);
					   $("#weekName").html(res);
				   }
			   })
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
	   

	$(document).on('click', '.rmFav', function(e){
		var _this=this;
		e.preventDefault();
		$.ajax({
	       url:$(_this).attr('href'),
	       method:'get',
	       success: function(res){
				$("#favtab").html(res);
	       }
		})
	})

	$(document).on('submit', '.rmGroc', function(e){
		e.preventDefault();
		$.ajax({
	       url:$(this).attr('action'),
	       method:'get',
	       success: function(res){
			   console.log("QQQQQ");
				$("#groctab").html(res);
	       }
		})
	})
   
   <c:forEach items="${favoritess}" var="favorite" varStatus="loop">
	   $.ajax({
	       url:"http://api.yummly.com/v1/api/recipe/${favorite.name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	       method:'get',
	       success: function(res){
				console.log(res);
				var imgUrl = res.images[0]["hostedSmallUrl"];
				var bigimgUrl = res.images[0]["hostedLargeUrl"];
	
				
				<c:choose>
				<c:when test="${loop.index eq 0 }" >
				$("#favthumblist").append("<li class='col-sm-3'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+imgUrl+"'></a><p style='text-align:center;'><a class='rmFav' style='display:inline-block;' href='/home/favorites/"+res.id+"/delete'><span class='glyphicon glyphicon-star' style='color:rgb(204,204,0); font-size: 20px;'></span></a> <div style='display: inline-block; width: 80px;'><a href='/recipe/"+res.id+"'>"+res.name+"</a></div></p></li>");
				$("#favlargelist").append("<div class='active item' data-slide-number='${loop.index}'><img src='"+bigimgUrl+"'></div>");
	 			$("#slide-content").append("<div id='slide-content-${loop.index}'><a href='/recipe/"+res.id+"'>"+res.name+"</a></div>");
				</c:when>
				<c:otherwise>
				$("#favthumblist").append("<li class='col-sm-3'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+imgUrl+"'></a><p style='text-align: center;'><a class='rmFav' style='display: inline-block;' href='/home/favorites/"+res.id+"/delete'><span class='glyphicon glyphicon-star' style='color:rgb(204,204,0); font-size: 20px;'></span></a> <div style='display:inline-block; width: 80px;'><a href='/recipe/"+res.id+"'>"+res.name+"</a></div></p></li>");
				$("#favlargelist").append("<div class='item' data-slide-number='${loop.index}'><img src='"+bigimgUrl+"'></div>");
	 			$("#slide-content").append("<div id='slide-content-${loop.index}'><a href='#'>"+res.name+"</a></div>");
				</c:otherwise>
			</c:choose>
				
				
				
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
	
				$("#groctab").append("<img style='margin-top: 20px;' class='col-md-2' src='"+imgUrl+"'><h3 class='col-md-7'>"+res.name+"</h3><form class='rmGroc' method='POST' action='/home/groceries/${favorite.id}/delete'><input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/><p style='margin-top: 170px; margin-left: 20px;'>Ingredients: </p><div class='col-md-12'><ul id='ingredientList-${loop.index}'></ul></div><div style='margin-bottom: 10px;'><input class='links btn btn-danger' style='margin-left: 50%' type='submit' value='Remove Recipe' /></div></form>");
	       	
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
   
 $('#myCarousel').carousel({
       interval: 10000
});

//Handles the carousel thumbnails
/* $('[id^=carousel-selector-]').click(function () {
var id_selector = $(this).attr("id");
try {
   var id = /-(\d+)$/.exec(id_selector)[1];
   console.log(id_selector, id);
   jQuery('#myCarousel').carousel(parseInt(id));
} catch (e) {
   console.log('Regex failed!', e);
}
});

 */

$(document).on("click", '[id^=carousel-selector-]', function(){
    // do stuff
var id_selector = $(this).attr("id");
try {
   var id = /-(\d+)$/.exec(id_selector)[1];
   console.log(id_selector, id);
   jQuery('#myCarousel').carousel(parseInt(id));
} catch (e) {
   console.log('Regex failed!', e);
}
});

// When the carousel slides, auto update the text
$('#myCarousel').on('slid.bs.carousel', function (e) {
        var id = $('.item.active').data('slide-number');
       $('#carousel-text').html($('#slide-content-'+id).html());
});
   
   </script>
</body>
</html>