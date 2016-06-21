class TeambuildingCreateController < ApplicationController
  before_action :authenticate_user!
  
  def apply
    new_member = Teambuild.new(user_id: current_user.id, team_id: params[:team_id])
    new_member.save
    
    redirect_to "/teamlist"
  end
  
  def create
    
  end
  
  def create_process
    new_team = Team.new(
                  name: params[:team_name],
                  abstract: params[:team_abstract],
                  content: params[:team_content],
                  number: params[:team_number],
                  picture: params[:team_picture]
                )
    new_team.save
    
    redirect_to "/teambuilding_list/index"
  end
  
  def delete
    delete_team = Team.find(params[:id].to_i)
    delete_team.published = false
    delete_team.save
    
    redirect_to "/teambuilding_list/index"
  end
  
  def update
    
  end
end
