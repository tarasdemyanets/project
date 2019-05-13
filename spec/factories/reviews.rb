# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    review_text { 'Not bad' }
    for_item
    reviewer
  end
  trait :reviewer do
    association :reviewer, factory: :user
  end
  trait :for_user do
    association :reviewable, factory: :user
  end
  trait :for_item do
    association :reviewable, factory: :item
  end
end
