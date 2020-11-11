require 'rails_helper'
RSpec.describe ApplicationRecord, type: :model do
  describe 'instance methods' do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
    end

    it '.full_address' do
      expect(@megan.full_address).to eq("#{@megan.address}, #{@megan.city}, #{@megan.state}, #{@megan.zip}")
    end
  end
end
