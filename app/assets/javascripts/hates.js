$(document).ready(function() {

	$('.hate-link').click(function(event) {

		$.post($(this).attr('href'), $(this).serialize(), function(response) {

			var template = $('#ajax-render-hates').html();
			var rendered = Mustache.render(template, response);
			var targetId = response.post_id;
			var currentPost = $('.post-parent-container[data-id=' + targetId + ']');
			currentPost.find('ul[class="hate-list"]').prepend(rendered);
			currentPost.find('h5[class="hate-count"]').text(response.hate_count);
			console.log(response);
		})

		return false;

	})
})