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
    
    $("#planadd").click(function(e){
        e.preventDefault();
        
    });
</script>
