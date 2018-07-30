#= require jquery3
#= require popper
#= require bootstrap-sprockets
#= require moment
#= require tempusdominus-bootstrap-4.js
#= require_tree ./modules
#= require_tree .

$(document).ready ->
  $('#my_object_end_date').datetimepicker({
    format: "YYYY-MM-DD HH:mm Z"
  });