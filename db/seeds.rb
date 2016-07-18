# This file contains all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

5.times do
  User.where(email: Faker::Internet.email).create
end

5.times do
  film = Film.where(title: Faker::Book.title, plot: Faker::Hipster.sentence).create
  PurchaseOption.where(price: 2.99, video_quality: 'HD', product_id: film.id).create
  PurchaseOption.where(price: 2.98, video_quality: 'SD', product_id: film.id).create
  film.created_at = (rand*10).days.ago
  film.save
end

5.times do
  serial = Serial.where(title: Faker::Book.title, plot: Faker::Hipster.sentence).create
  # Add three chapters per season and serial
  Chapter.where(season: 1, chapter: 1, serial_id: serial.id).create
  Chapter.where(season: 1, chapter: 2, serial_id: serial.id).create
  Chapter.where(season: 1, chapter: 3, serial_id: serial.id).create
  PurchaseOption.where(price: 2.99, video_quality: 'HD', product_id: serial.id).create
  PurchaseOption.where(price: 2.98, video_quality: 'SD', product_id: serial.id).create
  serial.created_at = (rand*10).days.ago
  serial.save
end

