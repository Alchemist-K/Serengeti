# kipping key "SECRET_KEY_BASE"
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: true, name: "admin", university: "SNU", major: "likelion", phone_number: "010-123-1234", confirmed_at: "2016-06-23 05:07:09")
User.create(email: "user1@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: false, name: 'aaa', confirmed_at: "2016-06-23 05:07:09")
User.create(email: "user2@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: false, name: 'bbb', confirmed_at: "2016-06-23 05:07:09")
User.create(email: "user3@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: false, name: 'ccc', confirmed_at: "2016-06-23 05:07:09")
User.create(email: "user4@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: false, name: 'ddd', confirmed_at: "2016-06-23 05:07:09")
User.create(email: "user5@snu.ac.kr", password:"12341234", password_confirmation:"12341234", admin: false, name: 'eee', confirmed_at: "2016-06-23 05:07:09")