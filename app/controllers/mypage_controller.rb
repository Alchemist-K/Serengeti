class MypageController < ApplicationController
    before_action :authenticate_user!
    
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
    
    def feedback
        
        f = Feedback.new
		f.username = current_user.name
		f.feedback = params[:feedback]
		f.save
		
        redirect_to :back
    
    end
end
