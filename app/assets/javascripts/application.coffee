#= require jquery3
#= require popper
#= require bootstrap-sprockets
#= require moment
#= require tempusdominus-bootstrap-4.js
#= require_tree ./modules
#= require_tree .

$(document).ready ->
  $('.form_datetime').datetimepicker({
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    format: 'mm-dd-yyyy hh:ii'
  });