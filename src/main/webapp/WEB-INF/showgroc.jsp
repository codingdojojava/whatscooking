
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.tabcontent {
		    margin-left: 0px;
		    min-height: 480px;
    			padding: 50px;
    			background: linear-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0.7));
    			border-radius: 1%;
    			box-shadow:0 0 25px #fff;
	}
</style>
<body>
    <div id='temptab' class="row tabcontent"></div>
    <script>
        <c:forEach items="${shoppings}" var="favorite" varStatus="loop">
	   $.ajax({
	       url:"http://api.yummly.com/v1/api/recipe/${favorite.name}?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee",
	       method:'get',
	       success: function(res){
				console.log(res);
				var imgUrl = res.images[0]["hostedSmallUrl"];
	
				$("#temptab").append("<img style='margin-top: 20px;' class='col-md-2' src='"+imgUrl+"'><h3 class='col-md-7'>"+res.name+"</h3><p>Ingredients: </p><ul id='ingredientList-${loop.index}'></ul><form class='rmGroc' method='POST' action='/home/groceries/${favorite.id}/delete'><input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/><input class='links btn btn-danger' style='margin-left:50%;' type='submit' value='Remove Recipe' /></form>");
	       	
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
    </script>
</body>