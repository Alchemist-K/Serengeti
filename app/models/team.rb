class Team < ActiveRecord::Base
  has_many :teambuilds
  has_many :users, through: :teambuilds
end
