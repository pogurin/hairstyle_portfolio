window.myMap = {};

myMap.init = function() {
  var coords = $('#map-canvas').data('coords');
  console.log(coords)

	var options = {
		zoom: 14,
		center: new google.maps.LatLng('43.6476863', '-79.3885854'),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}

	this.canvas = new google.maps.Map($('#map-canvas')[0], options);

	if (coords) {
    var _this = this;
    coords.forEach(function(coord) {
      _this.addMarker(coord.latitude, coord.longitude, coord.image);
    });
  }
};


myMap.addMarker = function(latitude, longitude, image) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(latitude, longitude),
    map: this.canvas,
    icon: image
  });
}

$(document).on('ready page:load', function() {
	if ($('#map-canvas').length) {
		myMap.init();
	}
});