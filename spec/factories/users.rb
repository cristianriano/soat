FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    # At least 6 digits
    sequence(:document, 123456) {|n| n.to_s}
    document_type { User::DOCUMENT_TYPES.sample }
    email { Faker::Internet.safe_email("#{name}.#{lastname}") }
    password { 'password' }
    password_confirmation { 'password' }

    trait :with_phone do
      phone { Faker::PhoneNumber.phone_number }
    end

    trait :confirmed do
      confirmed_at { DateTime.now - 1.hour }
    end

    trait :admin do
      confirmed
      admin true
    end

    factory :admin,      traits: [:admin]
    factory :confirmed_user, traits: [:confirmed]
    factory :user_with_phone, traits: [:with_phone]
  end
end
