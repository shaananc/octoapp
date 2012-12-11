// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.js
//= require_tree .


// $.fn.serializeObject = function() {
  // var values = {}
  // $("form input, form select, form textarea").each( function(){
    // values[this.name] = $(this).val();
  // });
//   
  // return values;
// }
// 
// $(function(){
//   
  // $(".ajaxform").submit(function(e){
     // e.preventDefault(); //This prevents the form from submitting normally
     // var user_info = $(this).serializeObject();
     // console.log("About to post to /users: " + JSON.stringify(user_info));
     // $.ajax({
       // type: "POST",
       // url: "/people",
       // data: user_info,
       // success: function(json){
         // console.log("The Devise Response: " + JSON.stringify(json));
         // //alert("The Devise Response: " + JSON.stringify(json));
       // },
       // dataType: "json"
     // });
  // });
//   
// });