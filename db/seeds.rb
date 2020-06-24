# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
Product.destroy_all
User.destroy_all



# user
gaspar= User.create!(name:'Foufou', address: '3 Avenue Asta la Vista', email: 'gaspar@gmail.com', password:"1234567", tel: "0669696969", zip_code: "59 000", city: 'Baby' )
sami= User.create!(name:'Evil to the end', address: '666 High Way to Hell', email: 'sami@gmail.com', password: "1234567", tel: '0666666666', zip_code: "6 666", city: 'Iwo')

#product

carrelage1= Product.new(product_type: "carrelage", price_per_square_meter: 23.88, description: "carrelage effet zellige", user: sami)
parquet1= Product.new(product_type: "parquet", price_per_square_meter: 60, description: "parquet contrecolle", user: sami)


#  carrelage = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTRug0E23EZSyvnwTQVY17_bF0GQhEKMmrObU373k6q3LTh6aj5xPDP7DmefPORa2zDlYdTqM_xMUc&usqp=CAc')
#  parquet = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSEQjKk61mtDGcVQc8sWAnYp13sMjrez2IH7RBlRDZGPldffmc8Xp9EHlmEvp4&usqp=CAc')

#  carrelage1.photo.attach(io: carrelage, filename: 'carrelage.png', content_type: 'image/png' )
#  parquet1.photo.attach(io: parquet, filename: 'parquet.png', content_type: 'image/png')

 carrelage1.save
 parquet1.save
#booking

booking1= Booking.new(user: gaspar, product: carrelage1, starts_at: "Fri, 03 Jul 2020 09:00:00 UTC +00:00", ends_at: "Fri, 17 Jul 2020 19:00:00 UTC +00:00" , floor_type: "parquet massif", surface_area: 40)
booking2= Booking.new(user: gaspar, product: parquet1, starts_at: "Mon, 07 Sep 2020 09:00:00 UTC +00:00", ends_at: 'Fri, 18 Sep 2020 19:00:00 UTC +00:00', floor_type: "carrelage", surface_area: 20)

# vieux_carrelage = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTRug0E23EZSyvnwTQVY17_bF0GQhEKMmrObU373k6q3LTh6aj5xPDP7DmefPORa2zDlYdTqM_xMUc&usqp=CAc')
# vieux_parquet = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSEQjKk61mtDGcVQc8sWAnYp13sMjrez2IH7RBlRDZGPldffmc8Xp9EHlmEvp4&usqp=CAc')

# booking1.photo.attach(io: vieux_carrelage, filename: 'view_parquet_massif.png', content_type: 'image/png' )
# booking2.photo.attach(io: vieux_parquet, filename: 'view_carrelage.png', content_type: 'image/png')

booking1.save
booking2.save