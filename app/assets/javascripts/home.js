$(document).ready(function(){
$("#search-2").keyup(function(){
        Data = {search_for : $("#search-2").val(), radio: $('input[name=search_for]:checked').val()}
        $.ajax({
          url:"/home/search",
          type: "POST",
          data: Data,
          success: function(result){
            console.log(result);
          },
          error: function(error){
            console.log('Error ${error}');
          }
        })
    });
});
