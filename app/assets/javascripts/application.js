// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//



//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require ddSlick
//= require_tree .

$(document).ready(function(){
  //select-2
  $("#tags").select2({
      tags: true,
      tokenSeparators: [',', ' ']
  })

$("#search-2").keyup(function(){
  // Search results ajax call
search_bar_ajax_call();

      });

//last day filter

$("#button2").click(function(e) {
  if(document.getElementById('button5').classList.contains("filter_select")){
    var main = "Personal_Feeds"
  }
  else{
    var main = "All_Feeds"
  }
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: "/home/index",
        data: {
            main: main,
            filter: "last_day"
        },
        success: function(result) {

        },
        error: function(result) {
            alert('error');
        }
    });
});

// last week

$("#button1").click(function(e) {
  $('#button5').toggleClass("filter_select");
  $('#button1').toggleClass("filter_select");

    e.preventDefault();
    $.ajax({
        type: "GET",
        url: "/home/index",
        data: {
            main: "All_Feeds"
        },
        success: function(result) {

        },
        error: function(result) {
            alert('error');
        }
    });
});

$("#button5").click(function(e) {
  $('#button5').toggleClass("filter_select");
  $('#button1').toggleClass("filter_select");

    e.preventDefault();
    $.ajax({
        type: "GET",
        url: "/home/index",
        data: {
            main: "Personal_Feeds"
        },
        success: function(result) {

        },
        error: function(result) {
            alert('error');
        }
    });
});

$("#button3").click(function(e) {
  if(document.getElementById('button5').classList.contains("filter_select")){
    var main = "Personal_Feeds"
  }
  else{
    var main = "All_Feeds"
  }
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: "/home/index",
        data: {
          main: main,
            filter: "Last_Week"
        },
        success: function(result) {

        },
        error: function(result) {
            alert('error');
        }
    });
});


// radio button code


      $('#radioBtn a').on('click', function(){
    var sel = $(this).data('title');
    var tog = $(this).data('toggle');
    $('#'+tog).prop('value', sel);

    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');

    search_bar_ajax_call();


})

//close search

$('.closed').on('click', function(){
  $('#search-2').val('');
});

//search bar
$("#searchbar .search-label").on("click", function(e){
  e.preventDefault();
  $("#searchbar").toggleClass("collapsed");
  $('#states-2').toggle(6);

});

});

//Pagenation
$(function(){
    $(".pagination a").on("click", function() {
        $.get(this.href, null, null, "script");
        return false;
    });
});

//Sharing post

$(document).ready(function(){
 $("#submit_post").on("click", function(event) {
    $('#share').click();

$('#tag').val();

  });
});


function search_bar_ajax_call()
{

var data;

        if($('#search-2').val().length!=0)
        {
           data = {search_for : $('#search-2').val(), radio: $('#radioBtn a.active').data('title')}

        }
        else{
          data = {search_for : ',', radio: $('#radioBtn a.active').data('title')}
        }

          $.ajax({
            url:"/home/search",
            type: "POST",
            data: data,
            success: function(result){
              console.log(result);
            },
            error: function(error){
              console.log(error);
            }
          })
}
