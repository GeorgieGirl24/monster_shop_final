require 'rails_helper'

RSpec.describe Cart do
  describe 'Instance Methods' do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @metroid_shop = Merchant.create(name: "Hope's Metroid Shop", address: '125 XR42 St.', city: 'Denver', state: 'CO', zip: 80210)

      @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100)
      @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 2 )
      @hippo = @brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 12 )
      @rock = @metroid_shop.items.create!(name: 'Rocks', description: "I'm a Rock!", price: 35, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 10 )

      @discount = @brian.discounts.create!(description: 'Buy 5 items, get 5% off', quantity: 5, percent: 5)
      @discount_1 = @brian.discounts.create!(description: 'Buy 10 items, get 35% off', quantity: 10, percent: 35)
      @discount_2 = @brian.discounts.create!(description: 'Buy 15 items, get 75% off', quantity: 15, percent: 75)
      @discount_4 = @megan.discounts.create!(description: 'Buy 5 items, get 50% off', quantity: 5, percent: 50)

      @cart_1 = Cart.new({
        @ogre.id.to_s => 1,
        @giant.id.to_s => 2
        })
      @cart_2 = Cart.new({
        @hippo.id.to_s => 3
        })
      @cart_3 = Cart.new({
        @hippo.id.to_s => 6
        })
      @cart_4 = Cart.new({
        @rock.id.to_s => 3
        })
      @cart_5 = Cart.new({
        @ogre.id.to_s => 7,
        @hippo.id.to_s => 6
        })
      @saved_discounts = 0.0
      @sub_total = @cart_3.contents[@hippo.id.to_s] * @hippo.price
      @new_total = 0.0
    end

    it '.contents' do
      expect(@cart_1.contents).to eq({
        @ogre.id.to_s => 1,
        @giant.id.to_s => 2
        })
    end

    it '.add_item()' do
      @cart_1.add_item(@hippo.id.to_s)

      expect(@cart_1.contents).to eq({
        @ogre.id.to_s => 1,
        @giant.id.to_s => 2,
        @hippo.id.to_s => 1
        })
    end

    it '.count' do
      expect(@cart_1.count).to eq(3)
    end

    it '.items' do
      expect(@cart_1.items).to eq([@ogre, @giant])
    end

    it '.grand_total' do
      expect(@cart_3.contents).to eq({
        @hippo.id.to_s => 6
        })
      expect(@cart_3.grand_total).to eq(285.0)
      @cart_3.add_item(@hippo.id.to_s)
      @cart_3.add_item(@hippo.id.to_s)
      @cart_3.add_item(@hippo.id.to_s)
      @cart_3.add_item(@hippo.id.to_s)
      expect(@cart_3.grand_total).to eq(325)
    end

    it '.count_of()' do
      expect(@cart_1.count_of(@ogre.id)).to eq(1)
      expect(@cart_1.count_of(@giant.id)).to eq(2)
    end

    it '.subtotal_of()' do
      expect(@cart_1.subtotal_of(@ogre.id)).to eq(20)
      expect(@cart_1.subtotal_of(@giant.id)).to eq(100)
    end

    it '.limit_reached?()' do
      expect(@cart_1.limit_reached?(@ogre.id)).to eq(false)
      expect(@cart_1.limit_reached?(@giant.id)).to eq(true)
    end

    it '.less_item()' do
      @cart_1.less_item(@giant.id.to_s)

      expect(@cart_1.count_of(@giant.id)).to eq(1)
    end

    it '.discounted_price' do
      expect(@cart_5.discounted_price(@ogre)).to eq(10)
      expect(@cart_4.discounted_price(@rock)).to eq(35)
    end

    it '.applied_discount()' do
      expect(@cart_5.applied_discount(@ogre)).to eq(50)
    end
  end
end
