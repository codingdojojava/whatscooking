<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${recipeId}</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<style>
        .square, .btn {
            border-radius: 0px!important;
        }
        
        /* -- color classes -- */
        .coralbg {
            background-color: #ffe11b;
        } 
        
        .coral {
            color: #ffe11b;
        }
        
        .turqbg {
            background-color: #46D8D2;
        }
        
        .turq {
            color: #46D8D2;
        }
        
        .white {
            color: black!important;
        }
        
        /* -- The "User's Menu Container" specific elements. Custom container for the snippet -- */
        div.user-menu-container {
          z-index: 10;
          background-color: #fff;
          margin-top: 20px;
          background-clip: padding-box;
          opacity: 0.97;
          filter: alpha(opacity=97);
          -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
          box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
        }
        
        div.user-menu-container .btn-lg {
            padding: 0px 12px;
        }
        
        div.user-menu-container h4 {
            font-weight: 300;
            color: black;
        }
        
        div.user-menu-container a, div.user-menu-container .btn  {
            transition: 1s ease;
        }
        
        div.user-menu-container .thumbnail {
           width:100%;
           min-height:200px;
           border: 0px!important;
           padding: 0px;
           border-radius: 0;
           border: 0px!important;
        }
        
        /* -- Vertical Button Group -- */
        div.user-menu-container .btn-group-vertical {
            display: block;
        }
        
        div.user-menu-container .btn-group-vertical>a {
            padding: 20px 25px;
            background-color: #46D8D2;
            color: black;
            border-color: #fff;
        }
        
        /* div.btn-group-vertical>a:hover {
            color: white;
            border-color: white;
        } */
        
        div.btn-group-vertical>a.active {
            background: #ffe11b;
            box-shadow: none;
            color: black;
        }
        /* -- Individual button styles of vertical btn group -- */
        div.user-menu-btns {
            padding-right: 0;
            padding-left: 0;
            padding-bottom: 0;
        }
        
        div.user-menu-btns div.btn-group-vertical>a.active:after{
          content: '';
          position: absolute;
          left: 100%;
          top: 50%;
          margin-top: -13px;
          border-left: 0;
          border-bottom: 13px solid transparent;
          border-top: 13px solid transparent;
          border-left: 10px solid #46D8D2;
        }
        /* -- The main tab & content styling of the vertical buttons info-- */
        div.user-menu-content {
            color: #323232;
        }
        
        ul.user-menu-list {
            list-style: none;
            margin-top: 20px;
            margin-bottom: 0;
            padding: 10px;
            border: 1px solid #eee;
        }
        ul.user-menu-list>li {
            padding-bottom: 8px;
            text-align: center;
        }
        
        div.user-menu div.user-menu-content:not(.active){
          display: none;
        }
        
        /* -- The btn stylings for the btn icons -- */
        .btn-label {position: relative;left: -12px;display: inline-block;padding: 6px 12px;background: rgba(0,0,0,0.15);border-radius: 3px 0 0 3px;}
        .btn-labeled {padding-top: 0;padding-bottom: 0;}
        
        /* -- Custom classes for the snippet, won't effect any existing bootstrap classes of your site, but can be reused. -- */
        
        .user-pad {
            padding: 20px 25px;
        }
        
        .no-pad {
            padding-right: 0;
            padding-left: 0;
            padding-bottom: 0;
        }
        
        .user-details {
            background: #eee;
            min-height: 333px;
        }
        
        .user-image {
          max-height:200px;
          overflow:hidden;
        }
        
        .overview h3 {
            font-weight: 300;
            margin-top: 15px;
            margin: 10px 0 0 0;
        }
        
        .overview h4 {
            font-weight: bold!important;
            font-size: 40px;
            margin-top: 0;
        }
        
        .view {
            position:relative;
            overflow:hidden;
            margin-top: 10px;
        }
        
        .view p {
            margin-top: 20px;
            margin-bottom: 0;
        }
         
        .caption {
            position:absolute;
            top:0;
            right:0;
            background: rgba(70, 216, 210, 0.44);
            width:100%;
            height:100%;
            padding:2%;
            display: none;
            text-align:center;
            color:#fff !important;
            z-index:2;
        }
        
        .caption a {
            padding-right: 10px;
            color: #fff;
        }
        
        .info {
            display: block;
            padding: 10px;
            background: #eee;
            text-transform: uppercase;
            font-weight: 300;
            text-align: right;
        }
        
        .info p, .stats p {
            margin-bottom: 0;
        }
        
        .stats {
            display: block;
            padding: 10px;
            color: white;
        }
        
        .share-links {
            border: 1px solid #eee;
            padding: 15px;
            margin-top: 15px;
        }
        
        .square, .btn {
            border-radius: 0px!important;
        }
        
        /* -- media query for user profile image -- */
        @media (max-width: 767px) {
            .user-image {
                max-height: 400px;
            }
		}
		.changeBoxSize{

			min-height: 100%;
		}
    </style>
    <script>
        $(document).ready(function() {
            var $btnSets = $('#responsive'),
            $btnLinks = $btnSets.find('a');
        
            $btnLinks.click(function(e) {
                e.preventDefault();
                $(this).siblings('a.active').removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $("div.user-menu>div.user-menu-content").removeClass("active");
                $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
            });
        });

        $( document ).ready(function() {
            $("[rel='tooltip']").tooltip();    
        
            $('.view').hover(
                function(){
                    $(this).find('.caption').slideDown(250); //.fadeIn(250)
                },
                function(){
                    $(this).find('.caption').slideUp(250); //.fadeOut(205)
                }
            ); 
        });
    </script>
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
	<div class="container">
			<div class="row user-menu-container square">
				<div class="col-md-7 user-details">
					<div class="row coralbg white">
						<div style="margin-top: -25px" class="col-md-6 no-pad">
							<div class="user-pad">
								<h3 id="name"></h3>
								<h4 style="font-size: 16px; font-weight:bold;" class="white"><a href="/favorite/${recipeId}">Favorite</a></h4>
								<h4 style="font-size: 16px; font-weight:bold;" class="white"><a href="/addtoplan/${recipeId}">Add to plan</a></h4>
								<h4 style="font-size: 16px; font-weight:bold;" class="white"><a href="/groceries/add/${recipeId}">Add to groceries</a></h4>
								<div id="instructions"></div>
							</div>
						</div>
						<div class="col-md-6 no-pad">
							<div class="user-image">
								<div id='image'></div>
							</div>
						</div>
					</div>
					<div class="row overview">
						<div class="col-md-4 user-pad text-center">
							<h3>RATING</h3>
							<h4 id='rating'></h4>
						</div>
						<div class="col-md-4 user-pad text-center">
							<h3>FAVORITES</h3>
							<h4 id='numFavorite'></h4>
						</div>
						<div class="col-md-4 user-pad text-center">
							<h3>COOK TIME</h3>
							<h4 id='cookTime'></h4>
						</div>
					</div>
				</div>
				<div class="col-md-5 user-menu-btns">
					<div class="btn-group-vertical square" id="responsive">
						<a href="#" class="btn btn-block btn-default active changeBoxSize">
							<i class="fa fa-bell-o fa-3x">Nutrition</i>
						</a>
						<a href="#" class="btn btn-default changeBoxSize">
							<i class="fa fa-envelope-o fa-3x">Ingredients</i>
						</a>
					</div>
				</div>
				<div class="col-md-5 user-menu user-pad">
					<div class="user-menu-content active">
						<h3>
							Nutrition Facts
						</h3>
						<ul class="user-menu-list" id="nutrition">
						</ul>
					</div>
					<div class="user-menu-content">
						<h3>
							Ingredients
						</h3>
						<ul class="user-menu-list" id='ingredients'>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<script>
	$.ajax({
        url:"http://api.yummly.com/v1/api/recipe/${recipeId}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
        method:'get',
        success: function(res){
			$("#name").html(res.name);
			var ingrStr = "";
			for(var i = 0; i < res.ingredientLines.length; i++){
				ingrStr += "<li>"+ res.ingredientLines[i] +"</li>"
			}
			$("#ingredients").html(ingrStr);
			var nutrStr = "";
			for(var i = 0; i < res.nutritionEstimates.length; i++){
				nutrStr += "<li>" + res.nutritionEstimates[i].attribute + ": " + res.nutritionEstimates[i].value + res.nutritionEstimates[i].unit.abbreviation + "</li>";
			}
			$("#nutrition").html(nutrStr);
			$("#cookTime").html(res.totalTime);
			$("#numServe").html(res.numberOfServings);
			$("#image").html("<img src='" + res.images[0].hostedLargeUrl +"' class='img-responsive thumbnail'>");
			$("#instructions").html("<button style='font-weight:bold;' type='button' class='btn btn-labeled btn-info' href='" + res.attribution.url + "'>See more</button>")
			$("#rating").html(res.rating);
			$("#numFavorite").html("${numFavs}");
        }
		})
	</script>
</body>
</html>