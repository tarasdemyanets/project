# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'Keyboard' }
    owner
  end
  trait :owner do
    association :owner, factory: :user
  end
end
