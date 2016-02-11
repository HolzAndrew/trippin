// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

"use strict";

(function(){
  $('#trip_search').click(function(){
    console.log('click noticed')

    $.ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + $('.pure-input-rounded').val(),
      success: function(data){
  
        var results = data.results;
        var address = results.formatted_address;
        var place_id = results.place_id;
        var lng = results.geometry.location.lng;
        var lat = results.geometry.location.lat;
    

        $('#forecast').text("It is "+temp+" degrees f in "+city);
        $('.date').text(date);

      


    }

  })

    })

}) ();