require 'rails_helper'
RSpec.describe Item, type: :model do
  before(:all) do
    @city = create(:city)
    @user1 = create(:user, city: @city)
    @item = create(:item, owner: @user1)
  end
  it 'retruns name of item' do
    expect(@item.name).to eq('Keyboard')
  end

  it 'get reviews for user' do
    expect(Item.from_city(@city.id)).to eq([@item])
  end
end
