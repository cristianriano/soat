FactoryGirl.define do
  factory :rate do
    sequence(:code, 150) {|n| n.to_s}
    sequence(:category) {|n| "category_#{n}"}
    sequence(:subcategory) {|n| "subcategory_#{n}"}
    min_age { Random.rand(9) }
    max_age { Random.rand(20) + 10 }
    bonus { Random.rand(1000) + 1}

    before(:create) do |rate|
      rate.calculate_total
    end
  end
end
