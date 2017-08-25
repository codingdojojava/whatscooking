<style>
    .daycircle{
		border-radius: 50%;
	}
	#week{
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
    .day{
        border: none;
    }
</style>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Monday">Monday</a></p>
    </div>
        <div id="monimgs">
            
        </div>
</div>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Tuesday">Tuesday</a></p>
    </div>
        <div id="tueimgs">
            
        </div>
</div>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Wednesday">Wednesday</a></p>
    </div>
        <div id="wedimgs">
            
        </div>
</div>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Thursday">Thursday</a></p>
    </div>
        <div id="thurimgs">
            
        </div>
</div>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Friday">Friday</a></p>
    </div>
        <div id="friimgs">
            
        </div>
</div>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Saturday">Saturday</a></p>
    </div>
        <div id="satimgs">
            
        </div>
</div>
<div class="day onimage" style='width:150px; height: 150px;'>
    <div class='overlay2'>
        <p class='text'><a href="/week/Sunday">Sunday</a></p>
    </div>
        <div id="sunimgs">
            
        </div>
</div>
<script>
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
</script>