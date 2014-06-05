$(document).ready(function() {

	$('.like-link').click(function(event) {
		$.post($(this).attr('href'), $(this).serialize(), function(response) {
			// var template = $('#ajax-render-likes').html();
			// var rendered = Mustache.render(template, response);
			var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
			// currentPost.find('ul.like-list').prepend(rendered);
			currentPost.find('h5.like-count').text(response.like_count);

			currentPost.toggleClass('liked');

		}).error(function(resp){
			alert(resp.responseJSON.error)
		});
	return false;
	});


	$('.unlike-link').click(function(event) {

		$.ajax($(this).attr('href'), {type: 'delete', success: function(response) {
			var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
			currentPost.find('h5.like-count').text(response.like_count);

			currentPost.toggleClass('liked');

			$('.like-list li[data-id="'+ response.id + '"]').remove();

		}});
	return false;
	});


})