class Item < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :owner, class_name: 'User'

  scope :from_city, ->(city) do
    joins(:owner).where(users: { city_id: city })
  end
  scope :reviews_for_user, ->(user_id) do
    joins(:reviews).where(owner:user_id).includes(:reviews)
  end
end
