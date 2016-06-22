class Team < ActiveRecord::Base
  has_many :teambuilds
  has_many :members, through: :teambuilds
  
  serialize :tags, Array
  
  def self.default_scope
    where published: true
  end
end
