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

})//ready