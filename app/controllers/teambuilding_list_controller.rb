class TeambuildingListController < ApplicationController
  def index
    @teams = Team.all
  end
end
