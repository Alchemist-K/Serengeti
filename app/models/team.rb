class Team < ActiveRecord::Base
  has_many :teambuilds
  has_many :members, -> {where(teambuilds: {status: 1}).order(:created_at)}, through: :teambuilds, class_name: :User

  # DB 내 Array 저장
  serialize :tags, Array
  serialize :customTags, Array

=begin
  searchable do
    #text :name, default_boost: 2
    text :content
  end
=end

  def self.default_scope
    where published: true
  end

end
