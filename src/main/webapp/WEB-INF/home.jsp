<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet">
<title>Insert title here</title>
<style>
	.day{
		display:inline-block;
		height: 150px;
		width: 150px;
		vertical-align:top;
		margin: 10px;
		box-shadow:0 0 5px #fff;
		border-radius:50%;
	}
	#logout{
		border: none;
		background: none;
	}
	
	.foodname{
		width:100%;
		border: none;
		box-shadow: none;
		height:40%;
	}
	body{
		background: none;
	}
	.daycircle{
		border-radius: 50%;
	}
	#week{
		background: rgba(0, 0, 0, 0.5);
		align-content: center;
		justify-content: center;
		display: flex;
		
	}
	.overlay2 {
		border-radius: 50%;
	  position: absolute;
	  top: 0;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  height: 100%;
	  width: 100%;
	  opacity: 0;
	  transition: .5s ease;
	  background-color: rgba(0,0,0,0.5);
	}
	.onimage:hover .overlay2 {
	  opacity: 1;
	}
	#suggestions{
		/* margin: 0 auto; */
		width: 95%;
		margin-left: 5%;
	}
	h2{
		background-color: rgba(255,255,255,0.5);
	}
	body{
		background: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)), url(http://res.cloudinary.com/rockafella20/image/upload/c_scale,e_blur:1389,w_2245/v1503470664/brooke-lark-158017_bh7gw4.jpg) center center no-repeat fixed;
	}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<script src="//masonry.desandro.com/masonry.pkgd.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.0.4/jquery.imagesloaded.js"></script>
</head>
<body style="background: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)), url(http://res.cloudinary.com/rockafella20/image/upload/c_scale,e_blur:419,w_2245/v1503470664/brooke-lark-158017_bh7gw4.jpg) center center no-repeat fixed;">
	<div id="flipkart-navbar" style="margin-top: 20px;">
	    <div class="container">
	        <div class="row row1">
	            <ul class="largenav pull-right">
	              	<li class="upper-links"><a href="/home/profile" class="links">My Profile</a></li>
	                <li class="upper-links">
	                    <a class="links" href="/home/favorites">
	                        <span style="font-size: 16px; top: 3px;" class="glyphicon glyphicon-heart"></span>
	                    </a>
	                </li>
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

	<h2 style='padding-left: 10%;'>${current.selected.name}</h2>
	<div id="week" style="display:flex;">
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p><a class='text' href="/week/Monday">Monday</a></p>
			</div>
			 <div id="monimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p ><a class='text' href="/week/Tuesday">Tuesday</a></p>
			</div>
			 <div id="tueimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p><a class='text' href="/week/Wednesday">Wednesday</a></p>
			</div>
			 <div id="wedimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p><a class='text' href="/week/Thursday">Thursday</a></p>
			</div>
			 <div id="thurimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p><a class='text' href="/week/Friday">Friday</a></p>
			</div>
			 <div id="friimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p><a class='text' href="/week/Saturday">Saturday</a></p>
			</div>
			 <div id="satimgs">
			 	
			 </div>
		</div>
		<div class="day onimage" style='width:150px; height: 150px;'>
			<div class='overlay2'>
				<p><a class='text' href="/week/Sunday">Sunday</a></p>
			</div>
			 <div id="sunimgs">
			 	
			 </div>
		</div>
	</div>
	<div id="suggestions" style="position:relative;">
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-5">
			<div id="paginate_bot"></div>
		</div>
		<div class="col-md-3"></div>
	</div>
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
	<script>
		$(document).on('click', '#closeadd', function(e){
            e.preventDefault();
            editurl='/users/delete/'+$(this).attr('info');
            var correct='#myModal' + $(this).attr('info');
			$('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
			$(correct).modal('hide');

        })
		$.ajax({
	        url:"${url}&maxResult=20",
	        method:'get',
	        success: function(res){
				console.log(res);
				var tempStr = "<h2 style='position: relative; padding-left: 5%; width: 87%'>Made for you:</h2><div id='container'></div>";
				for(var i = 0; i < res.matches.length; i++){
					tempStr+="<div class='onimage item'>";
					tempStr+="<img class='image' src='" + res.matches[i].imageUrlsBySize[90]+ "' alt='match'>";
					tempStr+="<div class='overlay'>";
					tempStr+="<a class='text' style='top:10%; left: 90%;' data-toggle='modal' href='#myModal"+res.matches[i].id+"'>";
					tempStr+="<div><span class='glyphicon glyphicon-plus'></span></div>";
					tempStr+="</a>";
					tempStr+="<div class='modal fade product_view' id='myModal"+res.matches[i].id+"'> <div class='modal-dialog'> <div class='modal-content'> <div class='modal-header'> <a href='#' data-dismiss='modal' class='class pull-right'><span class='glyphicon glyphicon-remove'></span></a> <h3 class='modal-title'>Pick a day</h3> </div><div class='modal-body'> <div class='row'> <img class='col-md-6' src='"+res.matches[i].imageUrlsBySize[90]+"'><div> <div><a href='/addtoplan/"+res.matches[i].id+"/monday'>Monday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/tuesday'>Tuesday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/wednesday'>Wednesday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/thursday'>Thursday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/friday'>Friday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/saturday'>Saturday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/sunday'>Sunday</a></div></div></div></div><div class='modal-footer'> <button id='closeadd' info='"+res.matches[i].id+"' type='button' class='btn btn-primary'>Cancel</button> </div></div></div></div>";
					
					tempStr+="<a id='favorite' class='text' style='top:27%; left: 90%;' href='/favorite/"+res.matches[i].id+"'>";
					tempStr+="<div><span class='star glyphicon glyphicon-star-empty'></span></div>";
					tempStr+="</a> ";
					tempStr+="<a class='text foodname' style='top:80%' href='/recipe/"+res.matches[i].id+"'>"+res.matches[i].recipeName+"</a>";
					tempStr+="</div>";
					tempStr+="</div>";
				}
				$("#suggestions").html(tempStr);
				var maxPages = res.totalMatchCount/20;
	        		    // init bootpag
	        		    var maxVis;
	        		    if (maxPages < 10) {
	        		    		maxVis = maxPages;
	        		    } else if (maxPages < 1){
	        		   		maxVis = 1;
	        		    } else {
	        		    		maxVis = 10;
	        		    }
	        		    
	        		    console.log(maxVis);
	        		    
	        	        $('#paginate_bot').bootpag({
	        	            total: Math.floor(maxPages),
	        	            maxVisible: maxVis
	        	        }).on("page", function(event, /* page number here */ num){
	        	        		var atResult = (num-1)*20;
	        	       		$.ajax({
	        	       			url: '${url}&maxResult=20&start='+atResult,
	        	       			method: 'get',
	        	       			success: function(response) {
	        	       				console.log(res);
		        	            		var matched = response.matches;
		        	            		var results = "<h2 style='padding-left: 5%; width: 87%'>Made for you:</h2><div id='container'></div>";
		        	            		for(var i = 0; i < matched.length; i++) {
		        	            			recipeLink = matched[i].id;
		        	            			results+="<div class='onimage'>";
											results+="<img class='image' src='" + response.matches[i].imageUrlsBySize[90]+ "' alt='match'>";
											results+="<div class='overlay'>";
											results+="<a class='text' style='top:10%; left: 90%;' data-toggle='modal' href='#myModal"+response.matches[i].id+"'>";
											results+="<div><span class='glyphicon glyphicon-plus'></span></div>";
											results+="</a>";
											results+="<div class='modal fade product_view' id='myModal"+response.matches[i].id+"'> <div class='modal-dialog'> <div class='modal-content'> <div class='modal-header'> <a href='#' data-dismiss='modal' class='class pull-right'><span class='glyphicon glyphicon-remove'></span></a> <h3 class='modal-title'>Pick a day</h3> </div><div class='modal-body'> <div class='row'> <img class='col-md-6' src='"+response.matches[i].imageUrlsBySize[90]+"'><div> <div><a href='/addtoplan/"+response.matches[i].id+"/monday'>Monday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/tuesday'>Tuesday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/wednesday'>Wednesday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/thursday'>Thursday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/friday'>Friday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/saturday'>Saturday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/sunday'>Sunday</a></div></div></div></div><div class='modal-footer'> <button id='closeadd' info='"+response.matches[i].id+"' type='button' class='btn btn-primary'>Cancel</button> </div></div></div></div>";
											
											results+="<a id='favorite' class='text' style='top:27%; left: 90%;' href='/favorite/"+response.matches[i].id+"'>";
											results+="<div><span class='star glyphicon glyphicon-star-empty'></span></div>";
											results+="</a> ";
											results+="<a class='text foodname' style='top:80%' href='/recipe/"+response.matches[i].id+"'>"+response.matches[i].recipeName+"</a>";
											results+="</div>";
											results+="</div>";
		        	            		}
		        	             	$("#suggestions").html(results); // some ajax content loading...
	        	       			}
	        	       		})
	        	        });
	        }
    		})
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

			$("#search").submit(function(e){
				e.preventDefault();
				$.ajax({
					url:'http://api.yummly.com/v1/api/recipes?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee&q='+$("#keyword").val()+'&maxResult=20',
					method:'get',
					success: function(res){
						if($("#keyword").val() != ""){
							var tempStr = '<h2 style="padding-left: 5%; width: 87%">'+$("#keyword").val()+':</h2>';
							for(var i = 0; i < res.matches.length; i++){
								tempStr+="<div class='onimage'>";
								tempStr+="<img class='image' src='" + res.matches[i].imageUrlsBySize[90]+ "' alt='match'>";
								tempStr+="<div class='overlay'>";
								tempStr+="<a class='text' style='top:10% left: 90%;' data-toggle='modal' href='#myModal"+res.matches[i].id+"'>";
								tempStr+="<div><span class='glyphicon glyphicon-plus'></span></div>";
								tempStr+="</a>";
								tempStr+="<div class='modal fade product_view' id='myModal"+res.matches[i].id+"'> <div class='modal-dialog'> <div class='modal-content'> <div class='modal-header'> <a href='#' data-dismiss='modal' class='class pull-right'><span class='glyphicon glyphicon-remove'></span></a> <h3 class='modal-title'>Pick a day</h3> </div><div class='modal-body'> <div class='row'> <img class='col-md-6' src='"+res.matches[i].imageUrlsBySize[90]+"'><div> <div><a href='/addtoplan/"+res.matches[i].id+"/monday'>Monday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/tuesday'>Tuesday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/wednesday'>Wednesday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/thursday'>Thursday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/friday'>Friday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/saturday'>Saturday</a></div><div><a href='/addtoplan/"+res.matches[i].id+"/sunday'>Sunday</a></div></div></div></div><div class='modal-footer'> <button id='closeadd' info='"+res.matches[i].id+"' type='button' class='btn btn-primary'>Cancel</button> </div></div></div></div>";
								
								tempStr+="<a id='favorite' class='text' style='top:27% left: 90%;' href='/favorite/"+res.matches[i].id+"'>";
								tempStr+="<div><span class='star glyphicon glyphicon-star-empty'></span></div>";
								tempStr+="</a> ";
								tempStr+="<a class='text foodname' style='top:80%' href='/recipe/"+res.matches[i].id+"'>"+res.matches[i].recipeName+"</a>";
								tempStr+="</div>";
								tempStr+="</div>";
							}
						}
						$("#suggestions").html(tempStr);

						var maxPages = res.totalMatchCount/20;
	        		    // init bootpag
	        		    var maxVis;
	        		    if (maxPages < 10) {
	        		    		maxVis = maxPages;
	        		    } else if (maxPages < 1){
	        		   		maxVis = 1;
	        		    } else {
	        		    		maxVis = 10;
	        		    }
	        		    
	        		    console.log(maxVis);
	        		    
	        	        $('#paginate_bot').bootpag({
	        	            total: Math.floor(maxPages),
	        	            maxVisible: maxVis
	        	        }).on("page", function(event, /* page number here */ num){
	        	        		var atResult = (num-1)*20;
	        	       		$.ajax({
	        	       			url: 'http://api.yummly.com/v1/api/recipes?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee&q='+$("#keyword").val()+'&maxResult=20&start='+atResult,
	        	       			method: 'get',
	        	       			success: function(response) {
	        	       				console.log(res);
		        	            		var matched = response.matches;
		        	            		var results = '<h2 style="padding-left: 5%; width: 87%">'+$("#keyword").val()+':</h2>';
		        	            		for(var i = 0; i < matched.length; i++) {
		        	            			recipeLink = matched[i].id;
		        	            			results+="<div class='onimage'>";
											results+="<img class='image' src='" + response.matches[i].imageUrlsBySize[90]+ "' alt='match'>";
											results+="<div class='overlay'>";
											results+="<a class='text' style='top:20%' data-toggle='modal' href='#myModal"+response.matches[i].id+"'>";
											results+="<div><span class='glyphicon glyphicon-plus'></span></div>";
											results+="</a>";
											results+="<div class='modal fade product_view' id='myModal"+response.matches[i].id+"'> <div class='modal-dialog'> <div class='modal-content'> <div class='modal-header'> <a href='#' data-dismiss='modal' class='class pull-right'><span class='glyphicon glyphicon-remove'></span></a> <h3 class='modal-title'>Pick a day</h3> </div><div class='modal-body'> <div class='row'> <img class='col-md-6' src='"+response.matches[i].imageUrlsBySize[90]+"'><div> <div><a href='/addtoplan/"+response.matches[i].id+"/monday'>Monday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/tuesday'>Tuesday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/wednesday'>Wednesday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/thursday'>Thursday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/friday'>Friday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/saturday'>Saturday</a></div><div><a href='/addtoplan/"+response.matches[i].id+"/sunday'>Sunday</a></div></div></div></div><div class='modal-footer'> <button id='closeadd' info='"+response.matches[i].id+"' type='button' class='btn btn-primary'>Cancel</button> </div></div></div></div>";
											
											results+="<a id='favorite' class='text' style='top:27%; left: 90%;' href='/favorite/"+response.matches[i].id+"'>";
											results+="<div><span class='star glyphicon glyphicon-star-empty'></span></div>";
											results+="</a> ";
											results+="<a class='text' style='top:80%' href='/recipe/"+response.matches[i].id+"'>"+response.matches[i].recipeName+"</a>";
											results+="</div>";
											results+="</div>";
		        	            		}
		        	             	$("#suggestions").html(results); // some ajax content loading...
	        	       			}
	        	       		})
	        	        });
	        		}
				})
			})
	</script>
</body>
</html>