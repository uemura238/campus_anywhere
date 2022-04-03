# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    trait :with_dependents do
      user
      micropost
    end
  end
end
