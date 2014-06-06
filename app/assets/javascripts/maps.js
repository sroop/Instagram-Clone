$(document).ready(function(){

  var postId = $('#map').data('post-id');

// below get request takes all the data from the show.json.jbuilder for the actual post...
  if(postId) {
    $.get('/posts/' + postId + '.json', function(post){

      map = new GMaps({
        div: '#map',
        lat: 0,
        lng: 0
      });

      GMaps.geocode({
        address: post.address,
          callback: function(results, status) {
            if (status == 'OK') {
                var latlng = results[0].geometry.location;
                map.setCenter(latlng.lat(), latlng.lng());
                  map.addMarker({
                    lat: latlng.lat(),
                    lng: latlng.lng()
                  });
            }
          }
      });
    });
  }
});