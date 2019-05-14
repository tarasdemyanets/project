# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'
require 'json'

resource 'Items' do

  route '/items', 'Items collection' do
    parameter :page, 'Current page of items'

    get 'Listing items' do
      let!(:city_lviv) { create(:city) }
      let!(:user_taras) { create(:user, city: city_lviv) }
      let!(:item_keyboard) { create(:item, owner: user_taras) }
      let!(:item_mouse) { create(:item, name: 'Mouse', owner: user_taras) }
      let!(:item_car) { create(:item, name: 'Car', owner: user_taras) }

      context 'without page params' do
        example_request 'Get a list of all items' do
          expect(status).to eq(200)
        end
      end

      context 'with page param' do
        let(:page) { 3 }

        example 'get items from page 3' do
          do_request(page: page)
          expect(status).to eq(200)
          response = JSON.parse(response_body)
          expect(response[0]['name']).to eq(item_car.name)
        end
      end
    end
  end

  route '/items/:id', 'Get an item by id' do
    let!(:city_lviv) { create(:city) }
    let!(:user_taras) { create(:user, city: city_lviv) }
    let!(:item_mouse) { create(:item, owner: user_taras) }
    parameter :id, 'Item id', required: true

    get 'Find item' do
      context 'Valid param' do
        let(:id) { item_mouse.id }
        example_request 'Valid request' do
          expect(status).to eq(200)
        end
      end
    end
  end

  route '/items/:id', 'Delete an item by id' do
    parameter :id, 'Item id', required: true
    let!(:city_lviv) { create(:city) }
    let!(:user_taras) { create(:user, city: city_lviv) }
    let!(:item_mouse) { create(:item, owner: user_taras) }
    delete 'Deletes an item' do
      let!(:id) { item_mouse.id }
      example_request 'Delete item by id' do
        expect(status).to eq(200)
      end
    end

    put 'Edit an item' do
      attribute :name, 'Item`s name'
      let(:name) { 'Edited name' }
      let(:request) { { name: name } }
      let(:id) { item_mouse.id }
      example 'Edit an item by id' do
        do_request(request)
        expect(status).to eq(200)
      end
    end
  end

  route '/items', 'Create an item' do
    attribute :name, 'Item`s name'
    post 'Add an item' do
      let!(:name) { 'Notebook' }
      let(:request) { { name: name } }
      let!(:city_lviv) { create(:city) }
      let!(:user_taras) { create(:user, id: 6, city: city_lviv) }
      context 'With a name' do
        example 'Createin an item' do
          do_request(request)
          response = JSON.parse(response_body)
          item = Item.last
          expect(response['name']).to eq(item.name)
          expect(status).to eq(201)
        end
      end
    end
  end
end
