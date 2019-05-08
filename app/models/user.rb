class User < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :items, as: :owner
  belongs_to :city
end
