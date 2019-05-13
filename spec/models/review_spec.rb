require 'rails_helper'
RSpec.describe Review, type: :model do
  before(:all) do
    @city = create(:city)
    @user1 = create(:user, city: @city)
    @user2 = create(:user, city: @city, first_name: 'John', last_name: 'Doe')
    @user3 = create(:user, city: @city, first_name: 'Test', last_name: 'Test')
    @item = create(:item, owner: @user1)
    @book = create(:booking, item: @item, user: @user2)
    @review = create(:review, reviewable: @item, reviewer: @user2)
    @review2 = build(:review, reviewable: @item, reviewer: @user)
    @review3 = build(:review, reviewable: @user, reviewer: @user3)
  end
  describe 'validators for review' do
    it 'validate item' do
      expect(@review2).to_not be_valid
    end
    it 'validate before review for item' do
      expect(@review2.errors[:base].join('')).to eq('You never booked this item')
    end
    it 'validate before review for user' do
      expect(@review3).to_not be_valid
      expect(@review3.errors[:base].join('')).to eq('You never booked items of this user')
    end
  end
  describe 'scope to get reviews for users item' do
    it 'get all reviews for user' do
      expect(Review.all_item(@user1.id)).to eq([@review])
    end
  end
end
