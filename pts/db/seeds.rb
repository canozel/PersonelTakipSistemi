# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "admin")
Role.create(name: "manager")
Role.create(name: "staff")
Role.create(name: "accountant")


User.create(email: "can.ozel@bil.omu.edu.tr", password: "12345678")
User.create(email: "slhcnzl@gmail.com", password: "12345678")

Profile.create( user_id: 1, first_name: "Salih Can", last_name: "ÖZEL", date_of_birth: "14.04.1994",
                score: "10", gender: "Erkek", phone: "5434774173")

Customer.create(first_name: "Yasin", last_name: "Erdem", location: "(40.613952441166596, 34.95849609375)",
                adress: "", phone: "5432134673")


Mission.create(user_id: 1, customer_id: 1, description: "ev ilaçlama", state: true)
