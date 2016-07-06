class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def ispermitted
    user = current_user
    if user.name == nil || user.phone_number == nil || user.university == nil || user.major == nil || user.name == "" || user.phone_number == "" || user.university == "" || user.major == ""
      redirect_to "/mypage/myinfo"
    else
      return true
    end
  end
end