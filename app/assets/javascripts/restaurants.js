// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready page:load',function() {
  $("#search-input").focus(function() {
    $(this).attr("placeholder", "");
  }).blur(function() {
    $(this).attr("placeholder", "Find a place to eat ...");
  });

  $('#current-location').on('click', function(ev) {
    ev.preventDefault();

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("Get a better browser, can't use geolocation!");
    };
  });
});


function geolocationSuccess(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;

  // Make ajax call if successful
  $('#location-error').hide();
  $.ajax({
      url: '/restaurants',
      type: 'GET',
      dataType: 'script',
      data: {
        latitude: latitude,
        longitude: longitude
      }
    });

};

function geolocationError() {
  var $locationError = $('<p>Unable to find your location</p>');
  $locaitonError.addClass('location-error');
  $('#current-location').after($locationError);
};