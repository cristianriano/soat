# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coverage = Coverage.instance
coverage.death = 750
coverage.medical = 800
coverage.inability = 180
coverage.transport = 10
coverage.currency = "SMLDV"
coverage.save
