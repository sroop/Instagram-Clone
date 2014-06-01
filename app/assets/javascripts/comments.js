$(document).ready(function() {

	$('.new_comment').on('submit', function(event) {
		event.preventDefault();

		$.post($(this).attr('action'), $(this).serialize(), function(response) {
			var template = $('#ajax-render-comments').html();
				var rendered = Mustache.render(template, response);
				var targetId = response.post_id;
				var currentPost = $('.post-parent-container[data-id=' + targetId + ']');
				currentPost.find('ul[class="comment-list"]').prepend(rendered);
				// $('.comment-list').append(rendered);
		});
	})
})