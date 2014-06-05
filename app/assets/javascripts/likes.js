$(document).ready(function() {

	var connection = new WebSocketRails(window.location.host + '/websocket');
	var likesChannel = connection.subscribe('likes');

	$('.like-link').click(function(event) {
		$.post(this.href);
		return false;
	});

	$('.unlike-link').click(function(event) {
		$.ajax(this.href, {type: 'delete'});
		return false;
	});

	likesChannel.bind('new-like', function(response) {
		var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
		currentPost.find('h5.like-count').text(response.like_count);
		currentPost.toggleClass('liked');
	});

	likesChannel.bind('deleted-like', function(response) {
		var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
		currentPost.find('h5.like-count').text(response.like_count);
		$('.like-list li[data-id="'+ response.id + '"]').remove();
		currentPost.toggleClass('liked');
	});	
})