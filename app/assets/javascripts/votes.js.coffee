# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
submit_vote = (form_id, text_id, value) ->
  alert hallo
  $(text_id).val(value)
  $(form_id).submit()

# say = (something) ->
#   alert something
