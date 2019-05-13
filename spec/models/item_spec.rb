# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Item, type: :model do
  let!(:city1) { create(:city) }
  let!(:user1) { create(:user, city: city1) }
  let!(:item1) { create(:item, owner: user1) }
  it 'retruns name of item' do
    expect(item1.name).to eq('Keyboard')
  end

  it 'get reviews for user' do
    expect(Item.from_city(city1.id)).to eq([item1])
  end
end
