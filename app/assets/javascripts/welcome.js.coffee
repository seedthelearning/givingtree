# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#seed_amount').val('$')

$('#seed_amount').focus(->
  $('#seed_amount').val('') if $('#seed_amount').val() == '$'
)
$('#seed_amount').blur(->
  $('#seed_amount').val('$') if $('#seed_amount').val() == ''
)
