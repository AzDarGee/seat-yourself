var map;

function initializeMap() {
    var mapOptions = {
        zoom: 14 ,
        center: new google.maps.LatLng(latitude, longitude),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map($('#map-canvas')[0], mapOptions);

    if (showMarker === true) {
        var myMarker = new google.maps.Marker({
            position: new google.maps.LatLng(latitude, longitude),
            map: map
        });
    };

};

function addMarkers(coords) {
    var image = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png";

    coords.forEach (function(coords) {
        var myMarker = new google.maps.Marker({
            position: new google.maps.LatLng(coords.latitude, coords.longitude),
            map: map,
            icon: image
        });
    });

};

$(document).on('ready page:load', function() {
    if ($('#map-canvas').length > 0) initializeMap();
    if (coords.length > 0) addMarkers(coords);
});
