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

$(document).on('ready page:load', function() {
    if ($('#map-canvas').length > 0) initializeMap();
});
