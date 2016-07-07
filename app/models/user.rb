class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :team_post_replies
  has_many :team_posts
  has_many :notice_replies

  has_many :teambuilds
  has_many :teams, -> {where(teambuilds: {status: 1}).order(:created_at)}, through: :teambuilds

  has_many :feedbacks
end
