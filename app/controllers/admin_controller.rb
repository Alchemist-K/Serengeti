class AdminController < ApplicationController
 before_action :require_admin, only: [:index, :feedback, :tean, :teambuild]
  def index
    @alluser = User.all
  end

  def destroy
    @userone = User.find(params[:id])
    @userone.destroy
    redirect_to "/admin/index"
  end

  def feedback
    @feedback = Feedback.all
  end

  def team
    @allteam = Team.all
  end

  def teambuild
    @allteambuild = Teambuild.all
  end

  def require_admin
    if user_signed_in? == false
      flash[:error] = "관리자 권한이 필요합니다."
      redirect_to "/home/index"
    elsif
      unless current_user.admin?
        flash[:error] = "관리자 권한이 필요합니다."
        redirect_to "/home/index"
      end
    end
  end
end
