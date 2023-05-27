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

3.times do
  sci_fi_terms = ["alien", "spaceship", "galaxy", "nebula", "extraterrestrial", "black hole", "time travel", "quantum", "teleportation", "cybernetic", "dystopian", "android", "multiverse", "hyperspace", "singularity"]

  user = User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456",
  )

  15.times do
    sci_fi_term = sci_fi_terms.sample
    user.articles.create!(
      title: "#{sci_fi_term.capitalize} #{Faker::Verb.base}",
      content: "#{Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false)} #{sci_fi_term} #{Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false)}",
      is_public: true,
      published_at: random_date = Faker::Date.between(from: 1.year.ago, to: Date.today),
      readings: Faker::Number.between(from: 1, to: 100),
    )
  end
end
puts "Finished!"