$(document).ready(function() {

	$('.like-link').click(function(event) {
		$.post($(this).attr('href'), $(this).serialize(), function(response) {
			var template = $('#ajax-render-likes').html();
			var rendered = Mustache.render(template, response);
			var targetId = response.post_id;
			var currentPost = $('.post-parent-container[data-id=' + targetId + ']');
			currentPost.find('ul[class="like-list"]').prepend(rendered);
			currentPost.find('h5[class="like-count"]').text(response.like_count);



			currentPost.toggleClass('liked');
			// currentPost.find('.like-link').replaceWith('.unlike-link');
			// $('.like-list').append(rendered);
		}).error(function(resp){
			alert(resp.responseJSON.error)
		});
	return false;
	});


	$('.unlike-link').click(function(event) {
		$.ajax($(this).attr('href'), {type: 'delete', success: function(response) {
			console.log(response)
			var template = $('#ajax-render-likes').html();
			var rendered = Mustache.render(template, response);
			var targetId = response.post_id;
			var currentPost = $('.post-parent-container[data-id=' + targetId + ']');
			currentPost.find('ul[class="like-list"]').html(rendered);
			currentPost.find('ul[class="like-list"]').html(null);
			currentPost.find('h5[class="like-count"]').text(response.like_count);

			currentPost.toggleClass('liked');
		}});
	return false;
	});


})