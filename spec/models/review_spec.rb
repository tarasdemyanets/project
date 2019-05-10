require 'rails_helper'
RSpec.describe Review, type: :model do
  before(:all) do
    @city = City.new(name: 'Lviv')
    @city.save!
    @renter = User.new(id: 1, first_name: 'John', last_name: 'Doe', city_id: 1)
    @renter.save!
    @seller = User.new(first_name: 'Seller', last_name: 'Seller last name', city_id: 1)
    @seller.save!
    @item = Item.new(name: 'Mouse', owner: @seller)
    @item.save!
    @booking = Booking.create(item: @item, user: @renter, start_time: Time.now, end_time: Time.now)
    @booking.save!
    @review = Review.create(review_text: 'good', reviewer: @renter, reviewable:@item)
    @review.save!
  end
  it 'validate item' do
    review = Review.create(review_text: 'Good item')
    expect(review).to_not be_valid
  end
  it 'validate before review for item' do
    review = Review.create(review_text: 'Good item', reviewable_id:2, reviewable_type: 'Item', reviewer_id: 4)
    expect(review.errors[:base].join('')).to eq('You never booked this item')
  end
  it 'validate before review for user' do
    review = Review.create(review_text: 'Good item', reviewable_id:2, reviewable_type: 'User', reviewer_id: 4)
    expect(review.errors[:base].join('')).to eq('You never booked items of this user')
  end
  it 'get all item reviews for user' do
    expect(Review.all_item(@seller.id)).to eq(@review)
  end
end
