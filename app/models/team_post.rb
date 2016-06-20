class TeamPost < ActiveRecord::Base
    has_many :team_post_replies
    belongs_to :user
end
