class HomeController < ApplicationController
  def index
  end

  def get_userinform
    @user = User.find(params[:user_id])
  end

  def get_userinformwithphone
    @user_id = User.find(params[:user_id]).id
  end
end
