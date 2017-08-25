
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
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
    <div id='temptab'>

                    <div id="main_area">
                        <!-- Slider -->
                        <div class="row">
                            <div class="col-sm-6" id="slider-thumbs">
                                <!-- Bottom switcher of slider -->
                                <ul class="hide-bullets" id="favthumblist2">
                                
                  
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <div class="col-xs-12" id="slider">
                                    <!-- Top part of the slider -->
                                    <div class="row">
                                        <div class="col-sm-12" id="carousel-bounding-box">
                                            <div class="carousel slide" id="myCarousel">
                                                <!-- Carousel items -->
                                                <div class="carousel-inner" id="favlargelist2">
                
                                                    
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
    <script>
       
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
				$("#favthumblist2").append("<li class='col-sm-3'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+imgUrl+"'></a><p style='text-align:center;'><a class='rmFav' style='display:inline-block;' href='/home/favorites/"+res.id+"/delete'><span class='glyphicon glyphicon-star' style='color:rgb(204,204,0); font-size: 20px;'></span></a> <div style='display: inline-block; width: 80px;'><a href='/recipe/"+res.id+"'>"+res.name+"</a></div></p></li>");
				$("#favlargelist2").append("<div class='active item' data-slide-number='${loop.index}'><img src='"+bigimgUrl+"'></div>");
	 			$("#slide-content2").append("<div id='slide-content-${loop.index}'><a href='/recipe/"+res.id+"'>"+res.name+"</a></div>");
				</c:when>
				<c:otherwise>
				$("#favthumblist2").append("<li class='col-sm-3'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+imgUrl+"'></a><p style='text-align:center;'><a class='rmFav' style='display:inline-block;' href='/home/favorites/"+res.id+"/delete'><span class='glyphicon glyphicon-star' style='color:rgb(204,204,0); font-size: 20px;'></span></a> <div style='display: inline-block; width: 80px;'><a href='/recipe/"+res.id+"'>"+res.name+"</a></div></p></li>");
				$("#favlargelist2").append("<div class='item' data-slide-number='${loop.index}'><img src='"+bigimgUrl+"'></div>");
	 			$("#slide-content2").append("<div id='slide-content-${loop.index}'><a href='#'>"+res.name+"</a></div>");
				</c:otherwise>
			</c:choose>
				
				
				
//				$(".hide-bullets").append("<li class='col-sm-2'><a class='thumbnail' id='carousel-selector-${loop.index}'><img src='"+res.images[0]["hostedLargeUrl"]+"'></a></li>"); 
				
	       }
		})
   
	</c:forEach>

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
$(document).on('slid.bs.carousel', '#myCarousel', function(e){
    var id = $('.item.active').data('slide-number');
       $('#carousel-text').html($('#slide-content-'+id).html());
})
// $('#myCarousel').on('slid.bs.carousel', function (e) {
//         var id = $('.item.active').data('slide-number');
//        $('#carousel-text').html($('#slide-content-'+id).html());
// });
    </script>
</body>