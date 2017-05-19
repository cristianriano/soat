
search_vehicle_by_license = function(event){
  element = $(event.target);
  $("#vehicle_license_hidden").val(element.val());
  $("form#search_vehicle_form").submit();
};
