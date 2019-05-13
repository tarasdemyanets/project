# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    start_time { Time.now }
    end_time { Time.now }
    user
    item
  end
end
