class MypageController < ApplicationController
  def index
  end
  
  
  def member
    @appliedteam = Teambuild.find(params[:current_user_id])
  end
end
