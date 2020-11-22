# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ name: 'Fashion', priority: '2' }, { name: 'Business', priority: '1' }, { name: 'Worklife', priority: '1' }, { name: 'Cosmetics', priority: '3' }])

puts 'Success: Default categories data loaded'
