class TeambuildingCreateController < ApplicationController
  def apply
    new_member = Teambuild.new(user_id: current_user.id, team_id: params[:team_id])
    new_member.save
    
    redirect_to "/teamlist"
  end
end
