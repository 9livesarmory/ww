# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


item1=Item.create(name:"shirt", price:"1.00")
item2=Item.create(name:"pants", price:"3.00")
item3=Item.create(name:"onepiece", price:"5.00")
item4=Item.create(name:"large items", price:"15.00")
item5=Item.create(name:"dryel", price:"20.00")

order1=Order.create(client_id: 1, merchant_id: 4, finalprice:"15.00")
order2=Order.create(client_id: 2, merchant_id: 4, finalprice:"25.00")
order3=Order.create(client_id: 1, merchant_id: 4, finalprice:"10.00")
order4=Order.create(client_id: 2, merchant_id: 4, finalprice:"12.00")
order5=Order.create(client_id: 2, merchant_id: 4, finalprice:"11.00")
order6=Order.create(client_id: 1, merchant_id: 3, finalprice:"15.00")
order7=Order.create(client_id: 1, merchant_id: 3, finalprice:"25.00")
order8=Order.create(client_id: 1, merchant_id: 3, finalprice:"10.00")
order9=Order.create(client_id: 2, merchant_id: 3, finalprice:"12.00")



client1=User.create(first_name: "Kiki", last_name: "Mama", phone: nil, zipcode: nil, email: "kiki@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "client", street: nil, city: nil, state: nil, lat: "25.7735031", lng:"-80.1917512")
client2=User.create(first_name: "Stan", last_name: "Lee", phone: nil, zipcode: nil, email: "stan@stanlee.com", password: "123abc", password_confirmation: "123abc", role: "client", street: nil, city: nil, state: nil, lat: "25.773895", lng:"-80.2079481")

merchant1=User.create(first_name: "Benjamin", last_name: "Chappell", phone: "305-999-9999", zipcode: 33130, email: "ben@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "123", city: "miami", state: "FL", lat:"25.7745031", lng:"-80.1917512", profile_image:"catpov.jpg")
merchant2=User.create(first_name: "Michelle", last_name: "Muz", phone: "305-555-9999", zipcode: 33196, email: "michi@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "321", city: "miami", state: "FL", lat:"25.7724305", lng:"-80.2079481", profile_image:"catmoustache.jpg")
merchant3=User.create(first_name: "Kyle", last_name: "Serson", phone: "305-999-9999", zipcode: 33130, email: "kyle@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "543", city: "miami", state: "FL", lat:"25.773895", lng:"-80.133472", profile_image:"grumpycat.jpg")
merchant4=User.create(first_name: "Andrew", last_name: "Albers", phone: "305-555-9999", zipcode: 33196, email: "andrew@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "345", city: "miami", state: "FL", lat:"25.774895", lng:"-80.133472", profile_image:"sciencecat.jpeg")


