class User < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :items, foreign_key: ' owner_id', class_name: 'Item'
  belongs_to :city
end
