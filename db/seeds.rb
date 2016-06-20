# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "user1@snu.ac.kr", password:"12341234", password_confirmation:"12341234")
User.create(email: "user2@snu.ac.kr", password:"12341234", password_confirmation:"12341234")
User.create(email: "user3@snu.ac.kr", password:"12341234", password_confirmation:"12341234")
User.create(email: "user4@snu.ac.kr", password:"12341234", password_confirmation:"12341234")
User.create(email: "user5@snu.ac.kr", password:"12341234", password_confirmation:"12341234")

Team.create(name: 'team1', abstract: '멋진 팀입니다.', content: '정말정말 멋진1 팀입니다.', number: 5, picture: '1.png', leader: 1)
Team.create(name: 'team2', abstract: '예쁜 팀입니다.', content: '정말정말 멋진2 팀입니다.', number: 4, picture: '2.png', leader: 2)
Team.create(name: 'team3', abstract: '화려한 팀입니다.', content: '정말정말 멋진3 팀입니다.', number: 7, picture: '3.png', leader: 3)
Team.create(name: 'team4', abstract: '큰 팀입니다.', content: '정말정말 멋진4 팀입니다.', number: 5, picture: '4.png', leader: 4)
Team.create(name: 'team5', abstract: '작은 팀입니다.', content: '정말정말 멋진5 팀입니다.', number: 5, picture: '5.png', leader: 5)
Team.create(name: 'team6', abstract: '뚱뚱한 팀입니다.', content: '정말정말 멋진6 팀입니다.', number: 6, picture: '6.png', leader: 1)
Team.create(name: 'team7', abstract: '날씬한 팀입니다.', content: '정말정말 멋진7 팀입니다.', number: 5, picture: '7.png', leader: 2)
Team.create(name: 'team8', abstract: '조용한 팀입니다.', content: '정말정말 멋진8 팀입니다.', number: 5, picture: '8.png', leader: 4)
Team.create(name: 'team9', abstract: '멋진 팀입니다.', content: '정말정말 멋진9 팀입니다.', number: 5, picture: '9.png', leader: 3)
