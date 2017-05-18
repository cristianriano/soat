// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// This will only include bootstrap to make lighter the home sections pages
//
//= require jquery
//= require jquery-ujs
//= require turbolinks
//= require bootstrap
//= require twitter/bootstrap
//= require_self
//= require common

// This function change the navbar color when scroll down and surpas a limit (70)
// It also add a transtiion when coloring the navbar to soft the change
$(document).ready(function(){
   var scroll_start = 0;
   var startchange = 70;
   $(document).scroll(function() {
     scroll_start = $(this).scrollTop();
     if(scroll_start > startchange) {
       $(".masthead").removeClass('notransition');
       $(".masthead").css({
         'background-color': 'rgba(3, 3, 3, 0.8)',
         'transition': 'background-color 200ms linear'
       });
     } else {
       $(".masthead").addClass('notransition');
       $('.masthead').css('background-color', 'transparent');
     }
   });
});
