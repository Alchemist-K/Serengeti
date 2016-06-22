class NoticeReply < ActiveRecord::Base
    belongs_to :user
    belongs_to :notice
    
    #시간 몇초전/몇시간전/몇일전/몇달전
    def get_time
        timediff = Time.now.to_i - self.created_at.to_i
        time_hour = timediff/3600
        if time_hour >= 24
            return (time_hour/24).to_s + "일 전"
        elsif time_hour >= 1
            return time_hour.to_s + "시간 전"
        elsif timediff > 60
            return (timediff/60).to_s + "분 전"
        else
            return timediff.to_s + "초 전"
        end
    end
end
