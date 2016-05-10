# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


item1=Item.create(name:"shirt", price:"1.00")
item2=Item.create(name:"pants", price:"5.00")
item3=Item.create(name:"blouse", price:"10.00")
item4=Item.create(name:"large items", price:"15.00")
item5=Item.create(name:"dryel", price:"20.00")

order1=Order.create(client_id: 1, merchant_id: 4, finalprice:"15.00")
order2=Order.create(client_id: 1, merchant_id: 4, finalprice:"25.00")
order3=Order.create(client_id: 1, merchant_id: 4, finalprice:"10.00")
order4=Order.create(client_id: 1, merchant_id: 4, finalprice:"12.00")
order5=Order.create(client_id: 1, merchant_id: 4, finalprice:"11.00")


client1=User.create(first_name: "kiki", last_name: "mama", phone: nil, zipcode: nil, email: "kiki@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "client", street: nil, city: nil, state: nil, lat: "25.7735031", lng:"-80.1917512")
client2=User.create(first_name: "pechy", last_name: "khan", phone: nil, zipcode: nil, email: "pechy@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "client", street: nil, city: nil, state: nil, lat: "25.773895", lng:"-80.2079481")

merchant1=User.create(first_name: "geo", last_name: "montero", phone: "305-999-9999", zipcode: 33130, email: "geo@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "123", city: "miami", state: "FL", lat:"25.7745031", lng:"-80.1917512")
merchant2=User.create(first_name: "michi", last_name: "muzyka", phone: "305-555-9999", zipcode: 33196, email: "michi@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "321", city: "miami", state: "FL", lat:"25.7724305", lng:"-80.2079481")
merchant3=User.create(first_name: "Dat", last_name: "Boi", phone: "305-999-9999", zipcode: 33130, email: "datboi@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "543", city: "miami", state: "FL", lat:"25.773895", lng:"-80.133472")
merchant4=User.create(first_name: "Dat", last_name: "Gurl", phone: "305-555-9999", zipcode: 33196, email: "datgurl@ironhack.com", password: "123abc", password_confirmation: "123abc", role: "merchant", street: "345", city: "miami", state: "FL", lat:"25.774895", lng:"-80.133472")


