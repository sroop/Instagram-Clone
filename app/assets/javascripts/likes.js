$(document).ready(function() {

	$('.like-link').click(function(event) {
		$.post(this.href);
		return false;
	});
		

	var connection = new WebSocketRails('localhost:3000/websocket');
	channel = connection.subscribe('likes');

	channel.bind('new', function(response) {
		var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
		currentPost.find('h5.like-count').text(response.like_count);
		currentPost.toggleClass('liked');
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