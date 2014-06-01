$(document).ready(function() {

	$('.new_comment').on('submit', function(event) {
		event.preventDefault();
		$.post($(this).attr('action'), $(this).serialize(), function(response) {
			console.log(response);
		});
	})

})