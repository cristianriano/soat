object @vehicle
attributes :id, :license, :category, :subcategory, :age, :value_type, :value

node(:insuranced){|vehicle| vehicle.insuranced?}

child :user do
  extends "api/v1/users/show"
end
