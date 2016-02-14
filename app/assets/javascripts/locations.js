// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

"use strict";

$(document).ready(function(){

$(document).on('submit', ".location_search", function(e) {
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json",
      data: {

        address: $('#location_search_input').val(),
        key: ''

      } ,     
      success: function(data){
        console.log("is this working?")
        debugger
        loc_results = data.results[0];
        loc_address = loc_results.formatted_address;
        //place_id = results.place_id;
        loc_lat = loc_results.geometry.location.lat;
        loc_lng = loc_results.geometry.location.lng;
        moveMap_loc(loc_lat,loc_lng);
        return loc_address, loc_lng, loc_lat;

      }
    })
  });

    function moveMap_loc(loc_lat, loc_lng) {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: loc_lat, lng: loc_lng},
          zoom: 17,
        });//map
      }//moveMap_loc

    function make_marker (loc_lat,loc_lng){
    var myLocLatLng = {lat: loc_lat, lng: loc_lng};
    var marker = new google.maps.Marker({
          position: myLocLatLng,
          map: map,
          title: 'Hello World!'
        });//var marker
    }//make_marker


  $(document).on('submit', "#location_form", function(e){
    debugger
    event.preventDefault();
    //address = $('#location_address').val();
    venue_notes = $('#location_notes').val();
    var location_hash= {
                address: loc_address,
                venue: venue_notes,
                loc_lng: loc_lng,
                loc_lat: loc_lat,
                trip_id: "7",
                user_id: "1",
                };
    debugger
    $.ajax({
      type: "POST",
      url: "/locations",
      data: {
        location: location_hash
              },
      },
    
      error: function () { alert('double check input!') },
      success: function(data){ console.log("success-ish")
          debugger
          make_marker(loc_lat,loc_lng)
        // debugger
        // var add_trip = $('<div />').append(data).find('div.trip_list').html();
        // $('div.trip_list').html(add_trip);
      }
    })
  });

}); // ready
