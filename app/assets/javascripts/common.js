
search_vehicle_by_license = function(event){
  element = $(event.target);
  $("#vehicle_license_hidden").val(element.val());
  $("form#search_vehicle_form").submit();
};

set_options_by_category = function(event){
  element = $(event.target);
  category = element.val();
  // Set subcategories
  options = gon.subcategories_hash[category];
  set_options_for_select('vehicle_subcategory', options);
  // Set value type
  label = $("div.vehicle_value label")
  value_type = gon.value_types_hash[category];
  label.html(value_type);
};

// Grab a select tag and fill the options by the ones provided
set_options_for_select = function(select_id, options){
  element = $('#'+select_id);
  element.empty();
  $.each(options, function(index){
    element.append('<option value="'+index+'">'+options[index]+'</option>');
  });
  // Select the first one
  // element.val(options[0]);
}
