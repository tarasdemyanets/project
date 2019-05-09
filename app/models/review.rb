class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User'
  scope :all_item, ->(user_id) do
    includes(:reviewable).where(reviewable_type: 'Item')
  end
end
