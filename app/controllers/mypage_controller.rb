class MypageController < ApplicationController
    def index
        @myTeam = findMyTeam.all.paginate(:page => params[:page], per_page:3)
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
  
    def member

      @appliedteam = User.find(current_user.id).teams.all
      
    end
    
    def myinfo
        @myinfo = User.where(email: current_user.email).all
    end
end
