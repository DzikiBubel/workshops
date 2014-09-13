# USERS
include ActionView::Helpers::NumberHelper

User.create!(firstname: "Admin",
             lastname: "Account",
             email: "admin@admin.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
User.create!(firstname: "User",
             lastname: "One",
             email: "user@one.com",
             password: "password",
             password_confirmation: "password",
             admin: false)
User.create!(firstname: "User",
             lastname: "Two",
             email: "user@two.com",
             password: "password",
             password_confirmation: "password",
             admin: false)
User.create!(firstname: "User",
             lastname: "Three",
             email: "user@three.com",
             password: "password",
             password_confirmation: "password",
             admin: false)
User.create!(firstname: "User",
             lastname: "Four",
             email: "user@four.com",
             password: "password",
             password_confirmation: "password",
             admin: false)
User.create!(firstname: "User",
             lastname: "Five",
             email: "user@five.com",
             password: "password",
             password_confirmation: "password",
             admin: false)
             
# CATEGORIES
Category.create!(name: "Cars")
Category.create!(name: "RTV/AGD")
Category.create!(name: "Games")
Category.create!(name: "Books")
Category.create!(name: "Electronics")
Category.create!(name: "Hobby")

# PRODUCTS
10.times do |n|
  categories = Category.all
  users = User.all
  r = Random.new
  price = number_with_precision(1 + r.rand(100) + r.rand(), precision: 2)
  categories.each { |category| category.products.create!(price: price, title: Faker::Lorem.word, description: Faker::Lorem.sentence, user: users.sample) }
end

# REVIEWS
products = Product.all
users = User.all
5.times do |n|
  r = Random.new
  products.each { |product| product.reviews.create!(rating: 1 + r.rand(5), content: Faker::Lorem.sentence(2), user: users.sample) }
end
