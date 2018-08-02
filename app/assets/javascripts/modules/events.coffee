window.initMap = ->
  directionsService = new google.maps.DirectionsService();
  directionsDisplay = new google.maps.DirectionsRenderer();
  chicago = new google.maps.LatLng(41.850033, -87.6500523);
  mapOptions =
    zoom:7,
    center: chicago

  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  directionsDisplay.setMap(map);
  directions = $('.travel_event').data('directions')


  northeast = directions.routes[0].bounds.northeast
  southwest = directions.routes[0].bounds.southwest
  directions.routes[0].bounds = { b: { b: northeast.lat, f: northeast.lng }, f: { b: southwest.lat, f: southwest.lng } }
  console.log directions
  request = {
    origin: 'London',
    destination: 'Paris',
    travelMode: 'DRIVING'
  };

  directionsService.route request, (result, status) ->
    console.log result
  directionsDisplay.setDirections(directions);

$ ->
  $('#parent_event_kind').on 'change', ->
    $('#new_parent_event').submit()
    console.log 'form submitted'




