$(document).ready(function() {

	$('.like-link').click(function(event) {
		

		$.post($(this).attr('href'), $(this).serialize(), function(response) {
			console.log(response);

		})

	return false;
	})
})