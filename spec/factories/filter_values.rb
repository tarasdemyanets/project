FactoryBot.define do
  factory :filter_value do
    name { "MyString" }
    association :filter, factory: :filter
  end
end
