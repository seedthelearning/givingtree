# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

seed_field = $('#seed_amount_dollars')
seed_field.val('$')

seed_field.focus(->
  seed_field.val('') if seed_field.val() == '$'
)
seed_field.blur(->
  seed_field.val('$') if seed_field.val() == ''
)
