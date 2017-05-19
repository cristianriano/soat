object @insurance
attributes :id, :starts_at, :ends_at

node(:bought_at) {|insurance| insurance.bought_at}

child :vehicle do
  extends "api/v1/vehicles/show"
end
