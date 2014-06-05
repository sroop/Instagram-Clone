$(document).ready(function() {

	var connection2 = new WebSocketRails(window.location.host + '/websocket');
	var hatesChannel = connection2.subscribe('hates');

	$('.hate-link').click(function(event) {
		$.post(this.href);
		return false;
	});

	$('.unhate-link').click(function(event) {
		$.ajax(this.href, { type: 'delete' });
		return false;
	});

	hatesChannel.bind('new-hate', function(response) {
		var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
		currentPost.find('h5.hate-count').text('💩' + response.hate_count);
		currentPost.toggleClass('hated');
	})

	hatesChannel.bind('deleted-hate', function(response) {
		var currentPost = $('.post-parent-container[data-id=' + response.post_id + ']');
		currentPost.find('h5.hate-count').text('💩' + response.hate_count);
		$('.hate-list li[data-id="' + response.id + '"]').remove();
		currentPost.toggleClass('hated');
	})

});