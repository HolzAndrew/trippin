"use strict";

$(document).ready(function(){

	$(document).on('click', '#signup a', function(e){
	  e.preventDefault()
	  $(this).tab('show')
	})

	$(document).on('click', '#login a', function(e){
	  e.preventDefault()
	  $(this).tab('show')
	})

	// $(document).on('click', 'button.signup', function(e){
	// 	event.preventDefault();
	// 	// debugger
	// 	$.ajax({
	// 		url:"/signup",
	// 		type: "POST",
	// 		data: {
	// 			user: {  name: $('#user_name').val(),  
	// 							email: $('#user_email').val(),
	// 							image_url: $('#user_image_url').val(),
	// 							password: $('#user_password').val()
	// 						}
	// 		},
	// 		error: function () {alert('double check input!')},
	// 		success: function (data) { 
	// 			debugger
	// 			$('div.user_signup').hide();
	// 			var result = $('<div />').append(data).find('div.user_status').html();
	//       $('div.user_status').html(result);
	//       document.location.replace("/trips");
	// 		}
	// 	})
	// })//

	// $(document).on('click', 'button.login', function(e){
	// 	event.preventDefault();
	// 	// debugger
	// 	$.ajax({
	// 		url:"/login",
	// 		type: "POST",
	// 		data: {
	// 			email: $('#email').val(),
	// 			password: $('#password').val()
	// 		},
	// 		error: function () { alert('double check input!') },
	// 		success: function (data) { 
	// 			// debugger
	// 			$('div.user_signup').hide();
	// 			var result = $('<div />').append(data).find('div.user_status').html();
	//       $('div.user_status').html(result);
	//       document.location.replace("/trips");
	// 		}
	// 	})
	// })//

})//ready