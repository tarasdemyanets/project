# frozen_string_literal: true

# Validator class for reviews
class ReviewValidator < ActiveModel::Validator
  def validate(record)
    if record.reviewable_type == 'Item'
      result = Booking.joins(:user, item: :owner).where(user: record.reviewer, items: { id: record.reviewable_id })
      record.errors[:base] << 'You never booked this item' if result.empty?
    else
      result = Booking.joins(:item).where(user: record.reviewer, items: { owner: record.reviewable_id })
      record.errors[:base] << 'You never booked items of this user' if result.empty?
    end
  end
end

class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User'
  validates_with ReviewValidator
  scope :for_user_items, ->(user_id) do
    joins('INNER JOIN items on items.id=reviews.reviewable_id').where(reviewable_type: 'Item', items: { owner_id: user_id })
  end
end
