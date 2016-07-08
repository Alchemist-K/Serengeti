# kipping key "SECRET_KEY_BASE"
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@snu.ac.kr", password:"serengeti2016snu", password_confirmation:"serengeti2016snu", admin: true, name: "admin", university: "대학교", major: "likelion", phone_number: "010-123-1234", confirmed_at: "2016-06-23 05:07:09")
User.create(email: "admin2@snu.ac.kr", password:"serengeti2016snu2", password_confirmation:"serengeti2016snu2", admin: true, name: "admin2", university: "대학교", major: "likelion", phone_number: "010-123-1234", confirmed_at: "2016-06-23 05:07:09"))
User.create(email: "user1@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: false, name: 'aaa', confirmed_at: "2016-06-23 05:07:09")
