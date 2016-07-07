class MypageController < ApplicationController
    before_action :authenticate_user!
    before_action :ispermitted, except: [:myinfo]

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
        user = current_user
        if user.name == nil || user.phone_number == nil || user.university == nil || user.major == nil || user.name == "" || user.phone_number == "" || user.university == "" || user.major == "" || user.admin == false
          @authorize = false
        else
          @authorize = true
        end
    end

    def feedback

      f = Feedback.new
	    f.username = current_user.name
		  f.feedback = params[:feedback]
		  f.save

      redirect_to :back

    end
end
