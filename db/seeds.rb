# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Product.destroy_all
User.destroy_all



# user
gaspar= User.create!(name:'Foufou', address: '3 Avenue Asta la Vista', email: 'gaspar@gmail.com', password:"1234567", tel: "0669696969", zip_code: "59 000", city: 'Baby' )
sami= User.create!(name:'Evil to the end', address: '666 High Way to Hell', email: 'sami@gmail.com', password: "1234567", tel: '0666666666', zip_code: "6 666", city: 'Iwo')

#product

carrelage1= Product.create!(product_type: "carrelage", price: 23.88, name: "carrelage effet zellige", user: sami)
parquet1= Product.create!(product_type: "parquet", price: 60, name: "parquet contrecolle", user: sami)


# carrelage = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTRug0E23EZSyvnwTQVY17_bF0GQhEKMmrObU373k6q3LTh6aj5xPDP7DmefPORa2zDlYdTqM_xMUc&usqp=CAc')
# parquet = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSEQjKk61mtDGcVQc8sWAnYp13sMjrez2IH7RBlRDZGPldffmc8Xp9EHlmEvp4&usqp=CAc')

# carrelage1.photo.attach(io: carrelage, filename: 'parquet.png', content_type: 'image/png' )
# parquet1.photo.attach(io: parquet, filename: 'parquet.png', content_type: 'image/png')


#booking

booking1= Booking.create!(user: gaspar, product: carrelage1, date: "Fri, 03 Jul 2020 14:59:00 UTC +00:00", product_type: "parquet", surface: 40)
booking2= Booking.create!(user: gaspar, product: parquet1, date: "Mon, 10 Dec 2020 09:00:00 UTC +00:00", product_type: "parquet", surface: 20)