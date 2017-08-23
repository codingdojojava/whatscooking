<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<style>
	.day{
		display:inline-block;
		height: 150px;
		width: 150px;
		border: 1px solid black;
		vertical-align:top;
	}
</style>
</head>
<body>
	<h1>What's cooking, ${current.firstname}?</h1>
	<h2>Current plan</h2>
	<div id="week">
		<div class="day">
			 <div id="monimgs">
			 	
			 </div>
		</div>
		<div class="day">
			 <div id="tueimgs">
			 	
			 </div>
		</div>
		<div class="day">
			 <div id="wedimgs">
			 	
			 </div>
		</div>
		<div class="day">
			 <div id="thurimgs">
			 	
			 </div>
		</div>
		<div class="day">
			 <div id="friimgs">
			 	
			 </div>
		</div>
		<div class="day">
			 <div id="satimgs">
			 	
			 </div>
		</div>
		<div class="day">
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
					tempStr += "<img style='height:200px; width:200px;' src='" + res.matches[i].imageUrlsBySize[90] + 
					"' alt='match" + i + "'><a href='/addtoplan/" + res.matches[i].id + "'>Add to plan</a> <a href='/favorite/"+ res.matches[i].id +"'>Favorite</a> <a href=''>See more</a>"
				}
				$("#forYou").html(tempStr);
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.monRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#monimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.tueRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#tueimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.wedRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#wedimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.thurRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#thurimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.friRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#friimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.satRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#satimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
    		$.ajax({
	        url:"http://api.yummly.com/v1/api/recipe/${current.selected.sunRecipes[0].name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	        method:'get',
	        success: function(res){
	            console.log(res.images[0].hostedLargeUrl);
	            $("#sunimgs").html("<img style='width: 150px; height: 150px;' src='"+res.images[0].hostedLargeUrl+"' alt='0'>")
	        }
    		})
	</script>
</body>
</html>