<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.day{
		display:inline-block;
		height: 150px;
		width: 150px;
		border: 1px solid black;
		vertical-align:top;
	}
	#logout{
		border: none;
		background: none;
	}
	body:before {
		content: "";
		position: absolute;
		background: url(http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_957/v1503470664/brooke-lark-158017_bh7gw4.jpg);
		background-size: cover;
		z-index: -1; /* Keep the background behind the content */
		height: 20%; width: 20%; /* Using Glen Maddern's trick /via @mente */
	
		/* don't forget to use the prefixes you need */
		transform: scale(5);
		transform-origin: top left;
		filter: blur(2px);
	}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<body>
	<div id="flipkart-navbar" style="margin-top: 20px;">
	    <div class="container">
	        <div class="row row1">
	            <ul class="largenav pull-right">
	                <li class="upper-links"><form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input class="links" id="logout" type="submit" value="Logout" />
    </form></li>
	              	<li class="upper-links"><a href="/profile" class="links">My Profile</a></li>
	                <li class="upper-links">
	                    <a class="links" href="#">
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

	<h2>${current.firstname}'s plan</h2>
	<div id="week">
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Monday">Monday</a></p>
			</div>
			 <div id="monimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Tuesday">Tuesday</a></p>
			</div>
			 <div id="tueimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Wednesday">Wednesday</a></p>
			</div>
			 <div id="wedimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Thursday">Thursday</a></p>
			</div>
			 <div id="thurimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Friday">Friday</a></p>
			</div>
			 <div id="friimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Saturday">Saturday</a></p>
			</div>
			 <div id="satimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay'>
				<p class='text'><a href="/week/Sunday">Sunday</a></p>
			</div>
			 <div id="sunimgs">
			 	
			 </div>
		</div>
	</div>

	<h2>Most popular:</h2>

	<h2>Made for you:</h2>
	<div id="forYou">
	</div>
	<script>
		$.ajax({
	        url:"${url}",
	        method:'get',
	        success: function(res){
				var tempStr = "";
				for(var i = 0; i < res.matches.length; i++){
					tempStr += "<div style='margin: 10px;' class='onimage'><img class='image' src='" + res.matches[i].imageUrlsBySize[90] + 
					"' alt='match" + i + "'><div class='overlay'><a class='text' style='top:20%' href='/addtoplan/" + res.matches[i].id + "'>Add to plan</a> <a class='text' style='top:50%' href='/favorite/"+ res.matches[i].id +"'><div><span class='star glyphicon glyphicon-star-empty'></span></div></a> <a class='text' style='top:80%' href='/recipe/"+ res.matches[i].id +"'>"+ res.matches[i].recipeName +"</a></div></div>"
				}
				$("#forYou").html(tempStr);
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.monRecipes[fn:length(current.selected.monRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#monimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.tueRecipes[fn:length(current.selected.tueRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#tueimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.wedRecipes[fn:length(current.selected.wedRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#wedimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.thurRecipes[fn:length(current.selected.thurRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#thurimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.friRecipes[fn:length(current.selected.friRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#friimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.satRecipes[fn:length(current.selected.satRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#satimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.sunRecipes[fn:length(current.selected.sunRecipes)-1].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#sunimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
	</script>
</body>
</html>