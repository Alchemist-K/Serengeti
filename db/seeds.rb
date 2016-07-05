# kipping key "SECRET_KEY_BASE"
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: true, name: 'admin', confirmed_at: "2016-06-23 05:07:09")
