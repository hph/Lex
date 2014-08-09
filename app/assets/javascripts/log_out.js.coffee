($ '#log-out').on 'click', (event) ->
  $.ajax
    url: $(event.target).data 'href'
    type: 'DELETE'
    success: -> window.location = '/'
