class HomeController < ApplicationController
  def index
  end
  
  def get_userinform
    @user = User.find(params[:user_id])
  end
end
