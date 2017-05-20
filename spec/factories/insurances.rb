FactoryGirl.define do
  factory :insurance do
    vehicle
    rate_id { vehicle.rate_id }

    before(:create) do |insurance|
      insurance.calculate_expiration
    end
  end
end
