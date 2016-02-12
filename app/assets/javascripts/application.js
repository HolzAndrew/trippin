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




$(document).ready(function(){
    function getResults(e) {
    e.preventDefault();

    $.ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json",
      data: {
        address: $('.pure-input-rounded').val(),
        key: 'AIzaSyCcIN85clPAZA5_m21QDUD27goF_wJo3g4'
      } ,     
      success: function(data){
        console.log("is this working?")
        var results = data.results[0];
        var address = results.formatted_address;
        var place_id = results.place_id;
        //debugger;
        var lat = results.geometry.location.lat;
        var lng = results.geometry.location.lng;
        moveMap(lat,lng);
        return address, place_id, lng, lat;
      }
    })

}


// var sendData = function(){

//   $.ajax({
//     type: "POST",
//     dataType: "json",
//     url: "/trips/create",
//     // data: {trip:{
//     //   address: a,
//     //   place_id: b,
//     //   lng: c,
//     //   lat: d
//     // }},

//     success: function(post){
//       debugger;
//     }
//   })
// };

var map;
function moveMap(lat, lng) {

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lat, lng: lng},
    zoom: 13,
  });
}


    // $(".pure-form").on('submit', getResults );
    $(document).on('submit', ".pure-form", getResults );
     $(document).on('submit', ".create_trip", sendData );

}); // ready



