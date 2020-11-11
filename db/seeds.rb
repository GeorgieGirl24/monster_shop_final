# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#merchants
# megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
# brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
bike_shop = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
dog_shop = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)
metroid_shop = Merchant.create(name: "Hope's Metroid Shop", address: '125 XR42 St.', city: 'Denver', state: 'CO', zip: 80210)

#bike_shop items
tire = bike_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 100)

#dog_shop items
pull_toy = dog_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", active: true, inventory: 32)
dog_bone = dog_shop.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active:false, inventory: 21)

#metroid_shop items
# missiles = metroid_shop.items.create(name: "Missiles", description: "Access to new areas!", price: 10, image: "https://i.ibb.co/HVNNc7V/item-missile.gif", active: true, inventory: 32)
# power_bombs = metroid_shop.items.create(name: "Power Bombs", description: "No one is safe!", price: 200, image: "https://i.ibb.co/1rH5cp5/pbomb-n-02.gif", active: true, inventory: 21)
# varia_suit = metroid_shop.items.create(name: "Varia Suit", description: "Get you through acid!", price: 500, image: "https://i.ibb.co/K6sQT2b/MP-VS.jpg", active: true, inventory: 32)
# super_missiles = metroid_shop.items.create(name: "Super Missiles", description: "The boss puncher!", price: 100, image: "https://i.ibb.co/Kbgndr2/SM.jpg", active: true, inventory: 21)

#megan items
orge = megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 100 )
giant = megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 50)

#brian items
hippo = brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 50 )

#users
  #default
# jeffery = User.create!(name: "Jeffery",
#                       address: "123 lane",
#                       city: "Denver",
#                       state: "CO",
#                       zip: 80111,
#                       email: "jeffery@example.com",
#                       password_digest: "test")
# manny = User.create!(name: "Manny",
#                       address: "123 lane",
#                       city: "Denver",
#                       state: "CO",
#                       zip: 80111,
#                       email: "manny@example.com",
#                       password_digest: "test")
#   #merchant
# hope = User.create!(name: "Hope",
#                       address: "456 Space st",
#                       city: "Space",
#                       state: "CO",
#                       zip: 80111,
#                       email: "HOPE@example.com",
#                       password_digest: "test",
#                       role: 1,
#                       merchant_id: metroid_shop.id)
# elvie = User.create!(name: "Elvie",
#                       address: "456 Space st",
#                       city: "Space",
#                       state: "CO",
#                       zip: 80111,
#                       email: "elvie@example.com",
#                       password_digest: "test",
#                       role: 1,
#                       merchant_id: megan.id)
#   #admin
# # vip = User.create!(name: "VIP",
#                       address: "789 Main st",
#                       city: "Denver",
#                       state: "CO",
#                       zip: 80111,
#                       email: "vip@example.com",
#                       password_digest: "test",
#                       role: 2)
#
# # oders
# order_1 = hope.orders.create!(status: 'pending')
# order_2 = hope.orders.create!(status: 'pending')
# order_3 = hope.orders.create!(status: 'pending')
# order_4 = hope.orders.create!(status: 'pending')
#
# # order items
# order_item_1 = order_1.order_items.create!(item: orge, price: orge.price, quantity: 3, fulfilled: false)
# order_item_2 = order_2.order_items.create!(item: giant, price: giant.price, quantity: 4, fulfilled: false)
# order_item_3 = order_3.order_items.create!(item: hippo, price: hippo.price, quantity: 3, fulfilled: false)
# order_item_4 = order_4.order_items.create!(item: hippo, price: orge.price, quantity: 4, fulfilled: false)
# order_item_5 = order_1.order_items.create!(item: giant, price: giant.price, quantity: 3, fulfilled: true)
# order_item_6 = order_2.order_items.create!(item: orge, price: orge.price, quantity: 4, fulfilled: true)
#
# # discounts
# megan_discount_1 = megan.discounts.create!(description: 'Buy 5 items, get 5% off ', quantity: 5, percent: 5)
# megan_discount_2 = megan.discounts.create!(description: 'Buy 10 items, get 25% off ', quantity: 10, percent: 25)
# brian_discount_3 = brian.discounts.create!(description: 'Buy 10 items, get 45% off ', quantity: 10, percent: 45)
# brian_discount_4 = brian.discounts.create!(description: 'Buy 5 items, get 10% off ', quantity: 5, percent: 10)
# brian_discount_5 = brian.discounts.create!(description: 'Buy 6 items, get 30% off ', quantity: 6, percent: 30)
