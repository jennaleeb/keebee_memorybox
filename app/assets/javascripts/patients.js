
$(document).ready(function(){

	$('body').on('click', '.delete-image', function() {
	  $(this).parent(".photo-tile").fadeOut(200);
	})

	$('body').on('change', '.upload', function() {
	  $(this).parents('form').submit();
	  debugger;
	});


});
  

