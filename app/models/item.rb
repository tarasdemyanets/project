class Item < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :owner, class_name: 'User'
end
