# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:city1) { create(:city) }
  let!(:category_hardware) { create(:category, name: 'Hardware') }
  let!(:default_category) { create(:category) }
  let!(:user1) { create(:user, city: city1) }
  let!(:item1) { create(:item, owner: user1, category: category_hardware) }

  it 'returns name of item' do
    expect(item1.name).to eq('Keyboard')
  end

  it 'get items from city' do
    expect(Item.from_city(city1.id)).to eq([item1])
  end

  describe 'filter by name' do
    it 'Start of word' do
      expect(Item.filter_by_name('Ke')).to eq([item1])
    end

    it 'End of word' do
      expect(Item.filter_by_name('board')).to eq([item1])
    end

    it 'Word of name' do
      expect(Item.filter_by_name('keyboard')).to eq([item1])
    end
  end

  describe 'Filter by categories' do
    it 'Valid category' do
      expect(Item.filter_by_category(category_hardware.id)).to eq([item1])
    end

    it 'No results' do
      expect(Item.filter_by_category(default_category.id)).to eq([])
    end
  end

  describe 'Filter by options' do
    let!(:filter_type) { create(:filter, name: 'Keyboard type') }
    let!(:mechanical_type) { create(:filter_value, name: 'Mechanical', filter: filter_type) }
    let!(:mechanical_type) { create(:filter_value, name: 'Membrane', filter: filter_type) }
    let!(:mechanical_kb) { create(:item_filter, filter_value: mechanical_type, item: item1) }

    it 'Filter' do
      expect(Item.filter_by_options(filter_type.id)).to eq([item1])
    end

    it 'no results' do
      expect(Item.filter_by_options(1)).to eq([])
    end
  end

  describe 'Filter by price' do
    it 'if price for rent less than user`s price' do
      days = 2
      price = 100
      expect(Item.filter_by_price(days, price)).to eq([item1])
    end

    it 'if price for rent bigger than user`s price' do
      days = 3
      price = 50
      expect(Item.filter_by_price(days, price)).to eq([])
    end
  end
end
