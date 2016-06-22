class Notice < ActiveRecord::Base
    has_many :notice_replies
end
