class Item < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_and_belongs_to_many :filter_values
  belongs_to :owner, class_name: 'User'
  belongs_to :category
  scope :from_city, ->(city) do
    joins(:owner).where(users: { city_id: city })
  end
end
