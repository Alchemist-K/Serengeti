class TeamPostReply < ActiveRecord::Base
    belongs_to :team_post
    belongs_to :user
end
