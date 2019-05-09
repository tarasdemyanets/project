class Booking < ApplicationRecord
  belongs_to :item, class_name: 'Item'
  belongs_to :user, class_name: 'User'
  scope :validate_for_item, ->(user_id, item_id) do
    Booking.joins(:user, item: :owner).where(user: user_id, items: { id: item_id })
  end

  scope :validate_for_user, ->(renter_id, owner_id) do
    Booking.joins(:user, item: :owner).where(user: renter_id, items: { owner: owner_id })
  end
end
