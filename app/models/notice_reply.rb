class NoticeReply < ActiveRecord::Base
    belongs_to :user
    belongs_to :notice
end
