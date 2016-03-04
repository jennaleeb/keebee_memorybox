
$(document).ready(function(){

	$(".tag_button").removeClass("disabled")

	$(".new_tag").submit(function( event ) {
		event.preventDefault();

	  	var action = $(this).attr('action');
	  	var method = $(this).attr('method');

	  	var photo_id = $(this).find("#tag_photo_id").val(); // id vs class here?
	  	var tag_name = $(this).find('.tag-name').val();

	  	if (tag_name != '') {

	  		$.ajax({
	  			method: method,
	  			url: action,
	  			data: { tag: {name: tag_name, photo_id: photo_id} },
	  			
	  			// this line makes the response format JavaScript and not html.
	  			dataType: 'script'
	  			
	  		});

	  	}

	  	

	});
});