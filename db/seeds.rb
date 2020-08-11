# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'net/http'
require 'open-uri'
require 'json'
require 'faker'
Store.destroy_all
Plant.destroy_all
User.destroy_all
Purchase.destroy_all
response = RestClient.get("https://trefle.io/api/v1/plants?token=7PqBmTtuJgVNe4Lh-9X0LI16lhB5P9s1MDvpquFNYOE&filter[common_name]")
data = JSON.load(response)


store= Store.create!(
    name: "Cactus Nursery"
)
data["data"].each do |plant|
    Plant.create!(
        name: plant["common_name"],
        price: Faker::Number.decimal(l_digits: 2),
        img_url: plant["image_url"],
        store: store
    )
end

5.times do

    User.create!(
        name: Faker::Name.name,
        balance:Faker::Number.number(digits:2)
    )

end

Purchase.create!(
    user: User.first,
    plant: Plant.first
)