class TeambuildingListController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @teams = Team.all.reverse
  end
end
