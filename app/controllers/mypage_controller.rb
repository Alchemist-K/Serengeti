class MypageController < ApplicationController
  def index
  end
  
  
  def member

      @appliedteam = User.find(current_user.id).teams.all
      
  end

end
