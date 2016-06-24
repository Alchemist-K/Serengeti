class TeambuildingListController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @teams = Team.all.reverse
    # perform a paginated query:
    @page = Team.all.paginate(:page => params[:page], per_page: 12)
    
    # or, use an explicit "per page" limit:
    
  end
  
  def tag_search
    tag = params[:input]
    
    @tag_team = Team.all
    @tag_team = @tag_team.select{|x| x.tags.include?(tag) }
  end
end
