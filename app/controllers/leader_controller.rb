class LeaderController < ApplicationController
    def index
        @myTeam = findMyTeam
    end
    
    def findMyTeam
        return Team.where(leader: current_user.id)
    end
    
    def accept
        teambuild = Teambuild.find(params[:request_id])
        teambuild.status = 1
        teambuild.save
        redirect_to :back
    end
    
    def deny
        teambuild = Teambuild.find(params[:request_id])
        teambuild.status = -1
        teambuild.save
        redirect_to :back
    end
    
end