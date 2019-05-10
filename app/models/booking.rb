class Booking < ApplicationRecord
  belongs_to :item, class_name: 'Item'
  belongs_to :user, class_name: 'User'
  scope :validate_for_item, ->(user_id, item_id) do
  end
end
