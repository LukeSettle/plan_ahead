window.initMap = ->
  return unless $('#map').length > 0
  directionsDisplay = new google.maps.DirectionsRenderer();
  chicago = new google.maps.LatLng(41.850033, -87.6500523);
  mapOptions =
    zoom:7,
    center: chicago

  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  directionsDisplay.setMap(map);
  directions = $('#travel_event').data('directions')
  directionsDisplay.setDirections(directions)

$ ->
  $('#create-travel-event').on 'click', (event) ->
    event.preventDefault()
    form = $('#new_travel_event')
    request =
      origin: $('#travel_event_origin').val()
      destination: $('#travel_event_destination').val()
      travelMode: $('#travel_event_mode_of_transportation').val() || 'DRIVING'

    directionsService = new google.maps.DirectionsService();
    directionsService.route request, (result, status) ->
      if status == 'OK'
        $('#travel_event_data').val(JSON.stringify(result))
        form.submit()
      else
        console.log 'error'



