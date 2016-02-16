"use strict";

$(document).ready(function(){

  var map;

  function moveMap(lat, lng) {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: lat, lng: lng},
      zoom: 13,
    });
  }

  var results;
  var loc_results
  var address;
  var loc_address;
  var place_id;
  var lat;
  var lng;
  var loc_lat;
  var loc_lng;
  var trip_date;
  var trip_name;
  var description;
  var address;
  var venue;
  var venue_notes;

  $(document).on('submit', ".trip_search", function(e) {
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json",
      data: {
        address: $('#trip_search_input').val(),
        key: ''
      } ,     
      success: function(data){
        console.log("Search is working?")
        results = data.results[0];
        address = results.formatted_address;
        place_id = results.place_id;
        lat = results.geometry.location.lat;
        lng = results.geometry.location.lng;
        moveMap(lat,lng);
        $('#trip_lat').val(lat);
        $('#trip_lng').val(lng);
        return address, place_id, lng, lat;
      }
    })
  }); 

});