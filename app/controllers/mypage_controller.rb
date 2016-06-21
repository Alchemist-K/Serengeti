class MypageController < ApplicationController
  def index
  end
  
<<<<<<< HEAD
=======
  
  def member

      @appliedteam = User.find(current_user.id).teams.all
      
  end
>>>>>>> 2c6ab63a339b5a0632f541da457d0688d85c019d
end
