class Team < ActiveRecord::Base
  has_many :teambuilds
  has_many :members, through: :teambuilds
end
