# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@example.com", password: "example1", roles: [:company_admin])
editor = User.create(email: "editor@example.com", password: "example1", roles: [:editor])
User.create(email: "user@example.com", password: "example1")

editor.posts.create(title: "Petergate is easy to use.", description: "You can use it to easily add roles to your projects.")
editor.posts.create(title: "Petergate supports multiple and singular roles.", description: "This allows you to give a single user access to multiple sections of your app or restrict them to just a single role.")
