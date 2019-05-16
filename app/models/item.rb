class Item < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :owner, class_name: 'User'
  belongs_to :category
  has_many :item_filters
  has_many :filter_values, through: :item_filters
  scope :from_city, ->(city) do
    joins(:owner).where(users: { city_id: city })
  end

  scope :filter_by_category, ->(category_id) do
    where(category: category_id)
  end

  scope :filter_by_name, ->(name) do
    where("name like '#{name}%' or name like '%#{name}%' or name ILIKE name")
  end

  scope :filter_by_options, ->(option_id) do
    joins(:filter_values).where(filter_values: { filter_id: option_id })
  end
end
