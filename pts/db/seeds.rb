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