$(document).ready(function() {

	$('.new_comment').on('submit', function(event) {
		event.preventDefault();

		$.post($(this).attr('action'), $(this).serialize(), function(response) {
			var template = $('#ajax-render-comments').html();
				var rendered = Mustache.render(template, response);
				$('.comment-list').append(rendered);
		});
	})
})