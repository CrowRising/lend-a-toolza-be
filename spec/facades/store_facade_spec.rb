require 'rails_helper'

RSpec.describe StoreFacade, :vcr do
  describe 'instance methods' do
    it '#store_details' do 
      stores = StoreFacade.new("80202", 25).stores
      expect(stores).to be_an Array
      expect(stores.first.name).to eq("Ace Hardware")
      expect(stores.first.formatted_address).to eq("1040 15th St, Denver, CO 80202, United States")
      expect(stores.last.name).to eq("Chamber's Place Ace Hardware")
      expect(stores.last.formatted_address).to eq("4830 Chambers Rd, Denver, CO 80239, United States")
    end
  end
end