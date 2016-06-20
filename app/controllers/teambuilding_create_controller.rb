class TeambuildingCreateController < ApplicationController
  def apply
    new_member = Teambuild.new(user_id: current_user.id, team_id: params[:team_id])
    new_member.save
    
    redirect_to "/teamlist"
  end
  
  def create
    new_team = Team.new(
                  name: params[:team_name],
                  abstract: params[:team_abstract],
                  content: params[:team_content],
                  number: params[:team_number],
                  picture: params[:team_picture]
                )
    new_team.save
    
    redirect_to "/teamlist"
  end
end
