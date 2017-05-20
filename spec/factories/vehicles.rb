FactoryGirl.define do
  factory :vehicle do
    license { SecureRandom.base64.first(6).upcase }
    category { Vehicle::CATEGORIES.sample }
    subcategory { Vehicle::SUBCATEGORIES_HASH[category].sample }
    age { Random.rand(99) }
    value_type { Vehicle::VALUE_TYPES_HASH[category] }
    value { Random.rand(3000) }
    user
  end
end
