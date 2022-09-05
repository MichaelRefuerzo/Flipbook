# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.new(:email => "qmrefuerzo@tip.edu.ph", :password => "1412314", :role => "admin", :first_name => "Michael", :last_name => "Refuerzo", :approved => true, :confirmed => true, :employee_id => "
8282828")
