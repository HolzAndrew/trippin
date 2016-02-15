

// "use strict";

// $(document).ready(function(){

//   var location;
//   var loc_lat;
//   var loc_lng;
//   var trip_id = @

//   $(document).on('submit', "#location_form", function(e){
//     debugger
//     event.preventDefault();
//     loc_lat = $('#location_loc_lat').val();
//     loc_lng = $('#location_loc_lng').val();
//     var location = {
//                 address: loc_address,
//                 venue: venue_notes,
//                 loc_lng: loc_lng,
//                 loc_lat: loc_lat,
//                 trip_id: "7",
//                 user_id: "1",
//                 };
//     debugger
//     $.ajax({
//       type: "POST",
//       url: "/locations",
//       data: {
//         location: location_hash
//               },
//       },
//       success: function(data){ 
//         console.log("success-ish");
//       }
//     });//ajex
//   });
// }); // ready