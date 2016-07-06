class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :team_post_replies
  has_many :team_posts
  has_many :notice_replies
  
  has_many :teambuilds
  has_many :teams, through: :teambuilds
  
  has_many :feedbacks
  
  def ispermmitted
    if self.name != nil && self.phone_number != nil && self.university != nil && self.favor != nil && self.major != nil || self.admin == true
      return true
    else
      return false
    end
  end
end
