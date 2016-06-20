class TeambuildingListController < ApplicationController
  def index
    @teams = Team.all.reverse
  end
end
