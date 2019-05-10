require 'rails_helper'
RSpec.describe Item, type: :model do
  it 'retruns name of item' do
    item = Item.new(name: 'Book')
    expect(item.name).to eq('Book')
  end

  it 'get reviews for user' do
    result = Item.from_city(1)
    expect(result).to eq(ActiveRec)
  end
end
