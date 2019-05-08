class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User'
  scope :all_item, ->(user_id) do
    joins(:reviewer).where(users: { id: user_id }, reviewable_type: 'Item')
  end
end
