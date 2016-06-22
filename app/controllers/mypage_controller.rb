class MypageController < ApplicationController
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
  
    def member

      @appliedteam = User.find(current_user.id).teams.all
<<<<<<< HEAD
      
    end
=======

  end
>>>>>>> 10a65095c7f21620781574f693d6d0c148eac1b6
end
