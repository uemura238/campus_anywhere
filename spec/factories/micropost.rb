FactoryBot.define do
  factory :micropost do
    association :user
    univ { Faker::Lorem.characters(number: 5) }
    content { Faker::Lorem.characters(number: 10) }
  end

  factory :other_micropost do
    association :user
    univ { Faker::Lorem.characters(number: 5) }
    content { Faker::Lorem.characters(number: 10) }
  end
end
