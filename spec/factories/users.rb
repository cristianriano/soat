FactoryGirl.define do
  factory :user do
    # email { Faker::Internet.safe_email("#{Faker::Name.first_name}.#{Faker::Name.last_name}") }
    # password { 'password' }
    # password_confirmation { 'password' }
    #
    # trait :admin do
    #   admin true
    #
    #   after(:create) do |admin|
    #     create(:admin_setting, user: admin)
    #   end
    # end
    #
    # factory :admin_user,    traits: [:admin]
  end
end
