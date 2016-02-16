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
//= gmaps
//= require_tree .


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

  var address;
  var place_id;
  var lat;
  var lng;
  var trip_date;
  var trip_name;
  var description;

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
        console.log("is this working?")
        results = data.results[0];
        address = results.formatted_address;
        place_id = results.place_id;
        lat = results.geometry.location.lat;
        lng = results.geometry.location.lng;
        moveMap(lat,lng);
        return address, place_id, lng, lat;
      }
    })
  });

  $(document).on('submit', "#trip_form", function(e){
    event.preventDefault();
    trip_date = $('#trip_date').val();
    trip_name = $('#trip_name').val();
    description = $('#trip_description').val();
    // debugger
    $.ajax({
      type: "POST",
      url: "/trips",
      data: {
        trip: { trip_date: trip_date,
                name: trip_name,
                description: trip_description,
                lng: lng,
                lat: lat
              }
      },
      error: function () { alert('double check input!') },
      success: function(data){
        // debugger
        // var add_trip = $('<div />').append(data).find('div.trip_list').html();
        // $('div.trip_list').html(add_trip);
      }
    })
  });

}); // ready




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

