class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def ispermitted
    user = current_user
    if user.name != nil && user.phone_number != nil && user.university != nil && user.favor != nil && user.major != nil || user.admin == true
      @authorize = true
      return @authorize
    else
      redirect_to "/mypage/myinfo"
    end
  end
end