<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>What's Cooking?</title>
</head>
<body>

<div id="flipkart-navbar" style="margin-top: 20px;">
    <div class="container">
        <div class="row row1">
            <ul class="largenav pull-right">
                <li class="upper-links"><a class="links" data-toggle="modal" data-target="#myModal" href="#">Login / Registration</a></li>
              	<li class="upper-links"><a href="#" class="links">My Profile</a></li>
                <li class="upper-links">
                    <a class="links" href="/home/favorites">
                        <span style="font-size: 16px; top: 3px;" class="glyphicon glyphicon-heart"></span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="row row2">
            <div class="col-sm-3">
                <h2 style="margin:0px;"><span class="smallnav menu" onclick="openNav()">☰ What's Cooking?</span></h2>
                <h1 style="margin:0px;"><span class="largenav" style="font-size: 35px;">What's Cooking</span></h1>
            </div>
            <div class="flipkart-navbar-search smallsearch col-sm-7 col-xs-11" style="border:1px solid black;">
                <div class="row">
                <form id=search>
                    <input id="keyword" class="flipkart-navbar-input col-xs-11" type="text" placeholder="Search for Recipes" name="keyword">
                    <button class="flipkart-navbar-button col-xs-1">
                        <svg width="15px" height="15px">
                            <path d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
                        </svg>
                    </button>
                    	</form>
                </div>
                
           

                
                
            </div>
            <div class="cart largenav col-sm-2">
                <a class="cart-button" style="margin-top: 4px;">
                		<span style="font-size: 13px;" class="glyphicon glyphicon-shopping-cart"></span>
                     Grocery List
                    <span class="item-number ">0</span>
                </a>
            </div>
        </div>
    </div>
</div>
<div id="mySidenav" class="sidenav">
    <div class="container" style="background-color: #2874f0; padding-top: 10px;">
        <span class="sidenav-heading">Home</span>
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    </div>
    <a href="http://clashhacks.in/">Link</a>
    <a href="http://clashhacks.in/">Link</a>
    <a href="http://clashhacks.in/">Link</a>
    <a href="http://clashhacks.in/">Link</a>
</div>


	<div class="container-fluid">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-md">
	     	<div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabel">Login / Registration</h4>
	            </div>
	            
	            <div class="modal-body">
	                <div class="row">
	                    <div class="col-md-12">
	                        <ul class="nav nav-tabs">
	                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
	                            <li><a href="#Register" data-toggle="tab">Register</a></li>
	                        </ul>
	                        <div class="tab-content">
	                            <div class="tab-pane active fade in" id="Login">
	                            
	                                <form method="POST" action="/" role="form" class="form-horizontal">
	                                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                                <div class="form-group">
		                                    <label for="email" class="col-sm-2 control-label">Email:</label>
		                                    <div class="col-sm-10">
		                                        <input class="form-control" type="email" id="email" name="username" placeholder="Email"/>
		                                    </div>
		                                </div>
		                                
		                                <div class="form-group">
		                                    <label for="password" class="col-sm-2 control-label">Password</label>
		                                    <div class="col-sm-10">
		                                    		<input class="form-control" type="password" id="password" name="password" placeholder="Password"/>
		                                    </div>
		                                </div>
		                                
		                                <div class="row">
		                                    <div class="col-sm-2">
		                                    </div>
		                                    <div class="col-sm-10">
		                                        <input type="submit" class="btn btn-primary btn-sm" value="Login" />
		                                    </div>
		                                </div>
	                                </form>
	                                
	                            </div>
	                            
	                            <div class="tab-pane fade" id="Register">
	                            		<form:form method="POST" action="/register" cssClass="form-horizontal" modelAttribute="userInfo">
										<form:errors path="user.*"/>
	                                		
		                                <div class="form-group">
		                                    <form:label path="username" cssClass="col-sm-2 control-label">Email:</form:label>
		                                    <div class="col-sm-10">
		                                        <form:input cssClass="form-control" path="username"/>
		                                    </div>
		                                </div>
		                                
	                                		
		                                <div class="form-group">
		                                    <form:label path="firstname" cssClass="col-sm-2 control-label">First Name:</form:label>
		                                    <div class="col-sm-10">
		                                        <form:input cssClass="form-control" path="firstname"/>
		                                    </div>
		                                </div>
		                                
		                                <div class="form-group">
		                                    <form:label path="lastname" cssClass="col-sm-2 control-label">Last Name:</form:label>
		                                    <div class="col-sm-10">
		                                        <form:input cssClass="form-control" path="lastname"/>
		                                    </div>
		                                </div>
		                                
		                                <div class="form-group">
		                                    <form:label path="password" cssClass="col-sm-2 control-label">Password:</form:label>
		                                    <div class="col-sm-10">
		                                        <form:password cssClass="form-control" path="password"/>
		                                    </div>
		                                </div>
		                                
		                                <div class="form-group">
		                                    <form:label path="passwordConfirmation" cssClass="col-sm-2 control-label">Password Confirmation:</form:label>
		                                    <div class="col-sm-10">
		                                        <form:password cssClass="form-control" path="passwordConfirmation"/>
		                                    </div>
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
		                                <div class="row">
		                                    <div class="col-sm-2">
		                                    </div>
		                                    <div class="col-sm-10">
		                                        <input type="submit" class="btn btn-primary btn-sm" value="Register" />
		                                    </div>
		                                </div>
		                                </div>
		                                </div>
		                                
		                                
	    							</form:form>
	                                
	                            </div>
	                            
	                        </div>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	</div>
	
	<div class="container-fluid">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-8">
					<div id="paginate_top"></div>
				</div>
			</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

				<div id="loader"></div>						

			<div id="results"></div>
		</div>
		<div class="col-md-2"></div>
	</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-5">
					<div id="paginate_bot"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
	
	
	</div>
	
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.min.js"></script>
	<script type="text/javascript">/*

	 bootpag - jQuery plugin for dynamic pagination

	 Copyright (c) 2015 botmonster@7items.com

	 Licensed under the MIT license:
	   http://www.opensource.org/licenses/mit-license.php

	 Project home:
	   http://botmonster.com/jquery-bootpag/

	 Version:  1.0.7

	*/
	(function(h,q){h.fn.bootpag=function(p){function m(c,b){b=parseInt(b,10);var d,e=0==a.maxVisible?1:a.maxVisible,k=1==a.maxVisible?0:1,n=Math.floor((b-1)/e)*e,f=c.find("li");a.page=b=0>b?0:b>a.total?a.total:b;f.removeClass(a.activeClass);d=1>b-1?1:a.leaps&&b-1>=a.maxVisible?Math.floor((b-1)/e)*e:b-1;a.firstLastUse&&f.first().toggleClass(a.disabledClass,1===b);e=f.first();a.firstLastUse&&(e=e.next());e.toggleClass(a.disabledClass,1===b).attr("data-lp",d).find("a").attr("href",g(d));k=1==a.maxVisible?
	0:1;d=b+1>a.total?a.total:a.leaps&&b+1<a.total-a.maxVisible?n+a.maxVisible+k:b+1;e=f.last();a.firstLastUse&&(e=e.prev());e.toggleClass(a.disabledClass,b===a.total).attr("data-lp",d).find("a").attr("href",g(d));f.last().toggleClass(a.disabledClass,b===a.total);e=f.filter("[data-lp="+b+"]");k="."+[a.nextClass,a.prevClass,a.firstClass,a.lastClass].join(",.");if(!e.not(k).length){var m=b<=n?-a.maxVisible:0;f.not(k).each(function(b){d=b+1+n+m;h(this).attr("data-lp",d).toggle(d<=a.total).find("a").html(d).attr("href",
	g(d))});e=f.filter("[data-lp="+b+"]")}e.not(k).addClass(a.activeClass);l.data("settings",a)}function g(c){return a.href.replace(a.hrefVariable,c)}var l=this,a=h.extend({total:0,page:1,maxVisible:null,leaps:!0,href:"javascript:void(0);",hrefVariable:"{{number}}",next:"&raquo;",prev:"&laquo;",firstLastUse:!1,first:'<span aria-hidden="true">&larr;</span>',last:'<span aria-hidden="true">&rarr;</span>',wrapClass:"pagination",activeClass:"active",disabledClass:"disabled",nextClass:"next",prevClass:"prev",
	lastClass:"last",firstClass:"first"},l.data("settings")||{},p||{});if(0>=a.total)return this;h.isNumeric(a.maxVisible)||a.maxVisible||(a.maxVisible=parseInt(a.total,10));l.data("settings",a);return this.each(function(){var c,b,d=h(this);c=['<ul class="',a.wrapClass,' bootpag">'];a.firstLastUse&&(c=c.concat(['<li data-lp="1" class="',a.firstClass,'"><a href="',g(1),'">',a.first,"</a></li>"]));a.prev&&(c=c.concat(['<li data-lp="1" class="',a.prevClass,'"><a href="',g(1),'">',a.prev,"</a></li>"]));for(b=
	1;b<=Math.min(a.total,a.maxVisible);b++)c=c.concat(['<li data-lp="',b,'"><a href="',g(b),'">',b,"</a></li>"]);a.next&&(b=a.leaps&&a.total>a.maxVisible?Math.min(a.maxVisible+1,a.total):2,c=c.concat(['<li data-lp="',b,'" class="',a.nextClass,'"><a href="',g(b),'">',a.next,"</a></li>"]));a.firstLastUse&&(c=c.concat(['<li data-lp="',a.total,'" class="last"><a href="',g(a.total),'">',a.last,"</a></li>"]));c.push("</ul>");d.find("ul.bootpag").remove();d.append(c.join(""));c=d.find("ul.bootpag");d.find("li").click(function(){var b=
	h(this);if(!b.hasClass(a.disabledClass)&&!b.hasClass(a.activeClass)){var c=parseInt(b.attr("data-lp"),10);l.find("ul.bootpag").each(function(){m(h(this),c)});l.trigger("page",c)}});m(c,a.page)})}})(jQuery,window);
	 </script>

	<script type="text/javascript">
	
	function openNav() {
	    document.getElementById("mySidenav").style.width = "70%";
	    // document.getElementById("flipkart-navbar").style.width = "50%";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	    document.body.style.backgroundColor = "rgba(0,0,0,0)";
	}
	
	$(document).ready(function() {
			


	
		$("img.lazy").lazyload({
		    effect : "fadeIn"
		});
		$('#loader').hide();
	    $('#search').submit(function(e){
	    	
	    		e.preventDefault();
	    		var keyword = $("#keyword").val();
	    		
	    		/* search */
	         $.ajax({
	            url:'http://api.yummly.com/v1/api/recipes?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee&q='+keyword+'&maxResult=20',
	            method: 'get',
	            beforeSend: function() {
	                $('#loader').show();
	             },
	             complete: function(){
	                $('#loader').hide();
	             },
	            success: function(response){		
					
	            		var imatched = response.matches;
	            		var iresults = "";
	            		for(var j = 0; j < imatched.length; j++) {
	            			var irecipeLink = imatched[j].id;
	            			iresults += "<div class='onimage'><img class='image' src='"+imatched[j].imageUrlsBySize['90']+"'><div class='overlay'><a class='text' href='http://www.yummly.com/recipe/"+irecipeLink+"' target='_blank'>"+imatched[j].recipeName + "</a></div></div>";
	            		}
	             	$("#results").html(iresults); 
	             	
	             	/* pagination */
	            		var maxPages = response.totalMatchCount/20;
	        		    // init bootpag
	        		    var maxVis;
	        		    if (maxPages < 10) {
	        		    		maxVis = maxPages
	        		    } else if (maxPages < 1){
	        		   		maxVis = 1;
	        		    } else {
	        		    		maxVis = 10;
	        		    }
	        		    
	        		    console.log(maxVis);
	        		    
	        	        $('#paginate_top,#paginate_bot').bootpag({
	        	            total: Math.floor(maxPages),
	        	            maxVisible: maxVis
	        	        }).on("page", function(event, /* page number here */ num){
	        	        		var atResult = (num-1)*20;
	        	       		$.ajax({
	        	       			url: 'http://api.yummly.com/v1/api/recipes?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee&q='+keyword+'&maxResult=20&start='+atResult,
	        	       			method: 'get',
	        	       			success: function(res) {
	        	       				console.log(res);
		        	            		var matched = res.matches;
		        	            		var results = "";
		        	            		for(var i = 0; i < matched.length; i++) {
		        	            			recipeLink = matched[i].id;
		        	            			results += "<div class='onimage'><img class='image lazy' src='"+matched[i].imageUrlsBySize['90']+"'><div class='overlay'><a class='text' href='http://www.yummly.com/recipe/"+recipeLink+"' target='_blank'>"+matched[i].recipeName + "</a></div></div>";
		        	            		}
		        	             	$("#results").html(results); // some ajax content loading...
	        	       			}
	        	       		})
	        	        });
	        	        
	            }
	        	})
	         $('ul.bootpag>li').not('.prev').first().trigger('submit');
	         

	    })
	    
		//$('#myModal').modal('show');
	})
	</script>
</body>
</html>