
search_vehicle_by_license = (event) ->
  element = $(event.target)
  if(element.val().size() > 4)
    elemnent.parents('form:first').submit()
