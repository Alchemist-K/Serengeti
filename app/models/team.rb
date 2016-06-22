class Team < ActiveRecord::Base
  has_many :teambuilds
  has_many :members, through: :teambuilds
  
  # DB 내 Array 저장
  serialize :tags, Array
  serialize :customTags, Array
  
  def self.default_scope
    where published: true
  end

end
