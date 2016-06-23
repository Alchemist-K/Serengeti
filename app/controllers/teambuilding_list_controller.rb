class TeambuildingListController < ApplicationController
  before_action :authenticate_user!
  
  @@tags = Array.new
  
  def index
    @teams = Team.all.reverse
  end
  
  def tag_search
    tag = params[:input]
    @tag_team = Team.all
    @tag_team = @tag_team.select{|x| x.tags.include?(tag) }
  end
end
