$(document).ready(function() {

	$('.like-link').click(function(event) {
		

		$.post($(this).attr('href'), $(this).serialize(), function(response) {
			var template = $('#ajax-render-likes').html();
			var rendered = Mustache.render(template, response);
			$('.like-list').append(rendered);
		})

	return false;
	})
})