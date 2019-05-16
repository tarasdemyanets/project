FactoryBot.define do
  factory :item_filter do
    association :filter_value, factory: :filter_value
    association :item, factory: :item
  end
end
