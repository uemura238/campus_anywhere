FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    status_message { Faker::Lorem.characters(number: 15) }
  end

  factory :other_user, class: 'User' do
    name { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    status_message { Faker::Lorem.characters(number: 15) }
  end

  trait :with_microposts do
    after(:create) { |user| create_list(:micropost, 5, user: user) }
  end
end
