# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'user@gmail.com', name: 'User', password: "password", address: "1 street address", avatar: "avatar/path")
AdminUser.create!(  email: 'admin@example.com',
                    password: 'password',
                    password_confirmation: 'password' ,
                    is_approved: 1,
                    role: 'admin'
                    ) if Rails.env.development?
State.create!(      name: 'Pending')
State.create!(      name: 'Confirmed')
State.create!(      name: 'Delivered')
AdminUser.create!(  email: 'seller@example.com',
                    password: 'password',
                    password_confirmation: 'password' ,
                    is_approved: 1,
                    role: 'seller')
Store.create!(      name: 'lc Wikiki',
                    summary: 'Shop',
                    admin_user_id: 2)
Brand.create!(      title: 'Nike')
Category.create!(   title: 'shirts')
Product.create!(    title: 'Blue Shirt',
                    description: "Shirt",
                    price: 100,
                    in_stock: 10,
                    category_id: 1,
                    brand_id: 1,
                    store_id: 1,
                    product_images: ["my-404-error.png"])
Product.create!(    title: 'Red Shirt',
                    description: "Shirt",
                    price: 120,
                    in_stock: 12,
                    category_id: 1,
                    brand_id: 1,
                    store_id: 1,
                    product_images: ["my-404-error.png"])
Product.create!(    title: 'Black Shirt',
                    description: "Shirt",
                    price: 150,
                    in_stock: 15,
                    category_id: 1,
                    brand_id: 1,
                    store_id: 1,
                    product_images: ["my-404-error.png"])
Cart.create!(product_id:1, user_id:1, quantity:3)
Cart.create!(product_id:2, user_id:1, quantity:4)
Cart.create!(product_id:3, user_id:1, quantity:5)