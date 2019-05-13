# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Taras' }
    last_name { 'Demianets' }
    city
  end
end
