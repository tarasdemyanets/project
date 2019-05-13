# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Review, type: :model do
  let!(:city1) { create(:city) }
  let!(:user1) { create(:user, city: city1) }
  let!(:user2) { create(:user, city: city1, first_name: 'John', last_name: 'Doe') }
  let!(:user3) { create(:user, city: city1, first_name: 'Test', last_name: 'Test') }
  let!(:item1) { create(:item, owner: user1) }
  let!(:book1) { create(:booking, item: item1, user: user2) }
  let!(:review1) { create(:review, reviewable: item1, reviewer: user2) }
  let!(:review2) { build(:review, reviewable: item1, reviewer: user1) }
  let!(:review3) { build(:review, reviewable: user1, reviewer: user3) }

  describe 'validators for review' do
    it 'validate before review for item' do
      expect(review2).to_not be_valid
      expect(review2.errors[:base].join('')).to eq('You never booked this item')
    end
    it 'validate before review for user' do
      expect(review3).to_not be_valid
      expect(review3.errors[:base].join('')).to eq('You never booked items of this user')
    end
  end
  describe 'scope to get reviews for users item' do
    it 'get all reviews for user' do
      expect(Review.all_item(user1.id)).to eq([review1])
    end
  end
end
