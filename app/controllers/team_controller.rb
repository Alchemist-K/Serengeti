class TeamsController < ApplicationController
  def index
    @teams = Team.alm
  end
  def show
    @team = Team.find(params[:id])
  end
  def new
    @team = Team.new
  end
  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to '/'
  end
  def edit
    @team = Team.find(params[:id])
  end
  def update
    @team = Team.find(params[:id]).update(team_params)
  end
  def destory
    Team.find(params[:id]).destory
    redirect_to '/'
  end
  private
  def team_params
    params.require(:team).permit(:name)
  end
end
