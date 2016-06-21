class TeambuildingCreateController < ApplicationController
  before_action :authenticate_user!
  
  def apply
    new_member = Teambuild.new(user_id: current_user.id, team_id: params[:id], status: 0)
    new_member.save
    
    redirect_to :back
  end
  
  def create
    
  end
  
  def create_process
    new_team = Team.new(
                  name: params[:name],
                  abstract: params[:abstract],
                  content: params[:content],
                  number: params[:number],
                  picture: params[:picture],
                  leader: current_user.id
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
    update_id = params[:id].to_i
    
    @update_team = Team.find(update_id)
  end
  
  def update_process
    update_id = params[:id].to_i
    
    update_team = Team.find(update_id)
    update_team.name = params[:name]
    update_team.abstract = params[:abstract]
    update_team.content = params[:content]
    update_team.number = params[:number]
    
    update_team.save
    
    redirect_to "/teambuilding_choose/#{update_id}"
  end
end
