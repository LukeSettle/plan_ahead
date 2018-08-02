$ ->
  $('#event-kind').on 'change', ->
    $('form').submit()
    console.log 'form submitted'