var Map = {};

function initializeMap() {
    // initialize with map options
    Map.options = {
        zoom: 14 ,
        center: new google.maps.LatLng(latitude, longitude),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    Map.canvas = new google.maps.Map($('#map-canvas')[0], mapOptions);

    if (Map.showMarkers) {
        var myMarker = new google.maps.Marker({
            position: new google.maps.LatLng(Map.latitude, Map.longitude),
            map: Map.canvas
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
