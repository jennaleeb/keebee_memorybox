$(document).ready(function(){

	// When page refreshes...
	$(window).bind('beforeunload',function(){

	     //...find the radio button that is checked
	    var radio_active = $("[type=radio]:checked");
	    debugger;
		console.log(radio_active)
		// localStorage.setItem("step_num", pane_active.data("step"))
	});


});