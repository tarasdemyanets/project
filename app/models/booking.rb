class Booking < ApplicationRecord
  belongs_to :item, class_name: 'Item'
  belongs_to :user, class_name: 'User'
end
