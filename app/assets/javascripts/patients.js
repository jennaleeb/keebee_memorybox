
$(document).ready(function(){

	// When page refreshes...
	$(window).bind('beforeunload',function(){
	     //...find the pane with class 'active' and store it
	    var pane_active = $(".active");
		localStorage.setItem("step_num", pane_active.data("step"))
	});


	// Force all tabs to be 'complete'
	$('.steps li').addClass("complete");

	if (localStorage.getItem("step_num") === null) {
	    alert("Local Storage not working");

	} else {
		
		// remove the default 'active' from page 1
	   $('.active').removeClass('active');

	   // set the div with the data step num from local storage to 'active'
	   var num = localStorage.getItem("step_num");
	   $('.step-pane[data-step="' + num + '"]').addClass('active');
	   $('.steps li[data-step="' + num + '"]').addClass('active');
	}


	// Delete user photos
	$('body').on('click', '.delete-image', function() {
	  $(this).parent(".photo-tile").fadeOut(200);
	})

	// Upload images asynch
	$('body').on('change', '.upload', function() {
	  $(this).parents('#form-in-wizard').submit();
	});

	$('body').on('click', '.patient-submit', function() {
		alert('All done!');
	  $(this).parents('form').submit();

	});


});
  

