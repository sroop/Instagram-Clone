$(document).ready(function() {

	$('.hate-link').click(function(event) {

		$.post($(this).attr('href'), $(this).serialize(), function(response) {

			// var template = $('#ajax-render-hates').html();
			// var rendered = Mustache.render(template, response);
			var targetId = response.post_id;
			var currentPost = $('.post-parent-container[data-id=' + targetId + ']');
			// currentPost.find('ul.hate-list').prepend(rendered);
			currentPost.find('h5.hate-count').text(response.hate_count);

			currentPost.toggleClass('hated');

		}).error(function(resp){
			alert(resp.responseJSON.error)
		});
		
	return false;
	});


	$('.unhate-link').click(function(event) {

		$.ajax($(this).attr('href'), { type: 'delete', success: function(response) {
			var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
			currentPost.find('h5.hate-count').text(response.hate_count);

			currentPost.toggleClass('hated');

			$('.hate-list li[data-id="' + response.id + '"]').remove();

		}});

	return false;

	});


})