# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "admin@gmail.com", password: "123456", is_admin: true)
user_twp = User.create(email: "miguel@gmail.com", password: "123456", is_admin: false)

product_one = Product.create(name: "Product One", price: "100 Lps", available: true, featured: true)
product_two = Product.create(name: "Product two", price: "100 Lps", available: true, featured: true)
product_three = Product.create(name: "Product three", price: "100 Lps", available: true, featured: true)
product_four = Product.create(name: "Product four", price: "100 Lps", available: true, featured: true)

