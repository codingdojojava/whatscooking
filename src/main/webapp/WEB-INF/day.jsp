<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${day}</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<style>
    .container { margin-top: 20px; }
.mb20 { margin-bottom: 20px; } 

hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }

.search-result .thumbnail { border-radius: 0 !important; }
.search-result:first-child { margin-top: 0 !important; }
.search-result { margin-top: 20px; }
.search-result .col-md-2 { border-right: 1px dotted #ccc; min-height: 140px; }
.search-result ul { padding-left: 0 !important; list-style: none;  }
.search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
.search-result ul li i { padding-right: 5px; }
.search-result .col-md-7 { position: relative; }
.search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
.search-result h3 > a, .search-result i { color: black !important; font-weight:bold;}
.search-result p, a { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; } 
.search-result span.plus { position: absolute; right: 0; top: 126px; }
.search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
.search-result span.plus a:hover { background-color: #414141; }
.search-result span.plus a i { color: #fff !important; }
.search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; }
p{
    color:black;
}
#logout{
		border: none;
		background: none;
	}
.blur{
    z-index:9999;
    -webkit-filter: blur(0px);
    -moz-filter: blur(0px);
    -o-filter: blur(0px);
    -ms-filter: blur(13px);
    filter: blur(0px);
}
/* body:before {
    content: "";
    position: absolute;
    background: url(http://res.cloudinary.com/rockafella20/image/upload/c_scale,w_957/v1503470664/brooke-lark-158017_bh7gw4.jpg);
    background-size: cover;
    z-index: -1; 
    height: 20%; width: 20%; 

    transform: scale(5);
    transform-origin: top left;
    filter: blur(2px);
} */
article{
    background: rgba(255,255,255,.5);
    padding-top: 10px;
}
</style>
</head>
<body style="background: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)), url(http://res.cloudinary.com/rockafella20/image/upload/c_scale,e_blur:352,w_1860/v1503681852/grovemade-239354_o8grht.jpg) center center no-repeat fixed; background-size: cover;">
        <div id="flipkart-navbar" style="margin-top: 20px;">
                <div class="container">
                    <div class="row row1">
                        <ul class="largenav pull-right">
                              <li class="upper-links"><a href="/home" class="links"><span class='glyphicon glyphicon-home'></span></a></li>
                              <li class="upper-links"><a href="/home/profile" class="links">My Profile</a></li>
                            <li class="upper-links"><form id="logoutForm" method="POST" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="links" id="logout" type="submit" value="Logout" />
            </form></li>
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
                                <span class="item-number" id='grocnum'>${grocnum}</span>
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
    <h1 style="background: rgba(255,255,255,0.5);">${day} Recipes</h1>
    <div id="allRecipes">

    </div>
    <c:forEach var="recipe" items="${recipes}">

    </c:forEach>
    <script>
        $(document).on('click', '.favorite', function(e){
            var _this=this;
			e.preventDefault();
			$.ajax({
				url:$(_this).attr("href"),
				method:"get",
				success:function(res){
					console.log("#fav"+$(_this).attr('info'));
					$("#fav"+$(_this).attr('info')).html("<span class='glyphicon glyphicon-star' style='color:#46D8D2'></span> <span>Favorite</span>")
					$("#fav"+$(_this).attr('info')).attr('style', 'text-decoration:none;');
				}
			})
		})

        $(document).on('click', '.groceries', function(e){
            var _this=this;
			e.preventDefault();
			$.ajax({
				url:$(this).attr("href"),
				method:"get",
				success:function(res){
					console.log("fffff");
					$("#addgroc"+$(_this).attr('info')).html("<span id='shopIcon' class='glyphicon glyphicon-thumbs-up' style='color: #46D8D2;'></span> Add to groceries")
					$("#addgroc"+$(_this).attr('info')).attr('style', 'text-decoration:none;');
					$.ajax({
						url:"/getGrocNum",
						method:"get",
						success:function(res){
							console.log(res);
							$("#grocnum").html(res);
						}
					})
				}
			})
		})

        <c:forEach var="recipe" items="${recipes}">
        $.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${recipe.name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
                console.log(res);
                var htmlStr = "<article class='blur search-result row'><div class='col-xs-12 col-sm-12 col-md-3'><a href='"+ res.attribution.url +"' title='Lorem ipsum' class='thumbnail'><img src='"+ res.images[0].hostedLargeUrl +"' alt='Lorem ipsum' /></a></div><div class='col-xs-12 col-sm-12 col-md-2'><ul class='meta-search'><li><a info='"+res.id+"' id='fav"+res.id+"' class='favorite' href='/favorite/"+ res.id+"'><i class='glyphicon glyphicon-star-empty'></i> <span>Favorite</span></a></li>";
                htmlStr+="<li><a info='"+res.id+"' id='addgroc"+res.id+"' class='groceries' href='/groceries/add/"+res.id+"'><i class='glyphicon glyphicon-shopping-cart'></i> <span>Add to groceries</span></a></li><li><a href='/${day}/remove/"+res.id+"'><i class='glyphicon glyphicon-trash'></i> <span>Remove</span></a></li></ul></div>"
                htmlStr+= "<div class='col-xs-12 col-sm-12 col-md-7 excerpet'><h3><a href='"+res.attribution.url+"' title=''>"+res.name+"</a></h3><p>Cooking time: "+res.totalTime+"</p><p>Calories: "+res.nutritionEstimates[0].value + res.nutritionEstimates[0].unit.abbreviation+"</p><p>Rating: " + res.rating + "</p></div>";
                htmlStr+="<span class='clearfix borda'></span></article>";
                $("#allRecipes").append(htmlStr);
	            // $("#allRecipes").append("<div><img src='"+ res.images[0].hostedLargeUrl +"' alt='ok'></div><div></div>");
            }
    	})
        </c:forEach>
    </script>
</body>
</html>