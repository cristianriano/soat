FactoryGirl.define do
  factory :user do
    name { Fake::Name.first_name }
    lastname { Fake::Name.last_name }
    # At least 6 digits
    sequence(:document, 100000) {|n| n.to_s}
    document_type { User::DOCUMENT_TYPES.sample }
    email { Faker::Internet.safe_email("#{name}.#{lastname}") }
    password { 'password' }
    password_confirmation { 'password' }

    trait :with_phone do
      phone { Faker::PhoneNumber.phone_number }
    end

    trait :admin do
      admin true
    end

    factory :admin_user,      traits: [:admin]
    factory :user_with_phone, traits: [:with_phone]
  end
end
