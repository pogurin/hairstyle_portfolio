window.myMap = {};

var map;
var bounds = new google.maps.LatLngBounds();

myMap.init = function() {
  var coords = $('#map-canvas').data('coords');


	var options = {
		zoom: 14,
		center: new google.maps.LatLng('43.6476863', '-79.3885854'),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}

	map = new google.maps.Map($('#map-canvas')[0], options);

	if (coords) {
    var _this = this;
    coords.forEach(function(coord) {
      _this.addMarker(coord.latitude, coord.longitude, coord.image, coord.note);
    });
    map.fitBounds(bounds);
  }

};

var infoWindow = new google.maps.InfoWindow({
	content: ''
});

myMap.addMarker = function(latitude, longitude, image, note) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(latitude, longitude),
    map: map,
    note: note,
		icon: image,
    clickable: true
  });
  bounds.extend(marker.position);

  google.maps.event.addListener(marker, 'mouseover', function() {
    infoWindow.content = this.note;
    infoWindow.open(this.map, this);
  });

  google.maps.event.addListener(map, 'click', function() {
    infoWindow.close();
  });

map.setOptions({styles: styles});
}

var styles = [
  {
    stylers: [
      { hue: "#00ffe6" },
      { saturation: -50 }
    ]
  },{
    featureType: "road.arterial",
    elementType: "geometry",
    stylers: [
      { lightness: 100 },
      { visibility: "simplified" }
    ]
  },{
    featureType: "road",
    elementType: "labels",
    stylers: [
      { visibility: "off" }
    ]
  }
];

$(document).on('ready page:load', function() {
	if ($('#map-canvas').length) {
		myMap.init();
	}
});
