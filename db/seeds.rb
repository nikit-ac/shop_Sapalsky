# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'BHDFn4wegf4y8wbvsdh', password_confirmation: 'BHDFn4wegf4y8wbvsdh') if Rails.env.production?
Category.create!([
  {name: 'Ножи'},
  {name: 'Инструменты'},
  {name: 'Материалы'},
  {name: 'Услуги'}
])
100.times do
  Product.create!([{
    title: Faker::Device.model_name,
    description: Faker::Device.serial,
    price: rand(100) * 100,
    status: Product::ACTIVE,
    category_id: rand(3) + 1,
    tag_list: Faker::Device.platform + ', ' + Faker::Device.manufacturer
  }])
end
