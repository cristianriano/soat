FactoryGirl.define do
  factory :vehicle do
    license { SecureRandom.base64.first(6) }
    category { Vehicle::CATEGORIES.sample }
    subcategory { Vehicle::SUBCATEGORIES_HASH[category].sample }
    age { Random.rand(100) }
    value_type { Vehicle::VALUE_TYPES_HASH[category].sample }
    value { Random.rand(3000) }
    user
    rate_id { Rate.all.sample.id }
  end
end
