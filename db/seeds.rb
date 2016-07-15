# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#rails g model Product type:string title:string plot:string
#rails g model Purchase_option product:references price:float video_quality:string
#rails g model Chapter serial:references season:string chapter:string
#rails g model Ticket user:references purchase_option:references purchase_date:datetime expiration_date:datetime

5.times do
  User.where(email: Faker::Internet.email).create
end

5.times do
  film = Film.where(title: Faker::Book.title, plot: Faker::Hipster.sentence).create
  PurchaseOption.where(price: 2.99, video_quality: 'HD', product_id: film.id).create
  PurchaseOption.where(price: 2.98, video_quality: 'SD', product_id: film.id).create
end

5.times do
  serial = Serial.where(title: Faker::Book.title, plot: Faker::Hipster.sentence).create
  PurchaseOption.where(price: 2.99, video_quality: 'HD', product_id: serial.id).create
  PurchaseOption.where(price: 2.98, video_quality: 'SD', product_id: serial.id).create
  #still need to add the chapters of the season
  Chapter.where(season: 1, chapter: 1, serial_id: serial.id).create
  Chapter.where(season: 1, chapter: 2, serial_id: serial.id).create
  Chapter.where(season: 1, chapter: 3, serial_id: serial.id).create
end

