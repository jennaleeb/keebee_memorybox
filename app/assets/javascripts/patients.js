
$(document).ready(function(){

	// Delete user photos
	$('body').on('click', '.delete-image', function() {
	  $(this).parent(".photo-tile").fadeOut(200);
	})

	// Upload images asynch
	$('body').on('change', '.upload', function() {
	  $(this).parents('form').submit();
	});

	$('body').on('click', '.patient-submit', function() {
		alert('All done!');
	  $(this).parents('form').submit();

	});


});
  

