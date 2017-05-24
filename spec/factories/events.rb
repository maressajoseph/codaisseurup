FactoryGirl.define do
  factory :event do
    name              { Faker::Lorem.sentence(1) }
    description       { Faker::Lorem.sentence(40) }
    starts_at         DateTime.now
    ends_at           DateTime.now
    includes_drinks   true
    includes_food     true
    capacity          { Faker::Commerce.capacity }
    price             { Faker::Commerce.price }
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
