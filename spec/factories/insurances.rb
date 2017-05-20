FactoryGirl.define do
  factory :insurance do
    vehicle

    before(:create) do |insurance|
      insurance.calculate_expiration
      insurance.rate_id = insurance.vehicle.rate_id
    end
  end
end
