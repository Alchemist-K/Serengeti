class Teambuild < ActiveRecord::Base
  belongs_to :member, class_name: :User, foreign_key: :user_id
  belongs_to :team
  
  def self.findWaitingTeambuild(id)
        arr = Teambuild.where(team_id: id)
        result = arr.select do |e|
            e.status == 0
        end
        return result
  end
  
end
