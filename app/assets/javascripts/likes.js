$(document).ready(function() {

	$('.like-link').click(function(event) {
		

		$.post($(this).attr('href'), $(this).serialize(), function(response) {
			var template = $('#ajax-render-likes').html();
			var rendered = Mustache.render(template, response);
			var targetId = response.post_id;
			var currentPost = $('.post-parent-container[data-id=' + targetId + ']');
			currentPost.find('ul[class="like-list"]').prepend(rendered);
			// $('.like-list').append(rendered);
		})

	return false;
	})
})