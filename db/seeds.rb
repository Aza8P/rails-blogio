# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Cleaning database..."
Article.destroy_all

puts "Creating articles..."

30.times do
  article = Article.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 5),
    is_public: true,
    published_at: Date.today,
    user_id: User.first.id
  )
  puts "Article with id: #{article.id} was created"
end
  
puts "Finished!"