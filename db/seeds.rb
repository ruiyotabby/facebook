# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'user1', email: 'user1@mail', password: '123456')
User.create(name: 'user2', email: 'user2@mail', password: '123456')
User.create(name: 'user3', email: 'user3@mail', password: '123456')

User.first.posts.create(body: 'NOthing on my mind')
User.second.posts.create(body: 'Fuck Tech')
