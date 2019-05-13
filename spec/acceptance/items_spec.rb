require 'rails_helper'
require 'rspec_api_documentation/dsl'
resource 'Items' do
  get '/items' do
    let!(:city_lviv) { create(:city) }
    let!(:user_taras) { create(:user, city: city_lviv) }
    let!(:item_mouse) { create(:item, owner: user_taras) }
    example 'Listing items' do
      do_request
      expect(status).to eq(200)
    end
  end
  get '/items/:id' do
    let!(:city_lviv) { create(:city) }
    let!(:user_taras) { create(:user, city: city_lviv) }
    let!(:item_mouse) { create(:item, owner: user_taras) }
    context 'Find item' do
      let(:id) { item_mouse.id }
      example_request 'Valid request' do
        expect(status).to eq(200)
      end
    end
  end
  delete '/items/:id' do
    let!(:city_lviv) { create(:city) }
    let!(:user_taras) { create(:user, city: city_lviv) }
    let!(:item_mouse) { create(:item, owner: user_taras) }
    let!(:id) { item_mouse.id }
    example 'delete item' do
      do_request
      expect(status).to eq(200)
    end
  end
end
