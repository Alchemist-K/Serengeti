class TeambuildingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all.reverse
    # perform a paginated query:
    @page = Team.all.paginate(:page => params[:page], per_page: 12)

    @timeevent = Team.all.order(:created_at)
    # or, use an explicit "per page" limit:

    @button_tags = Serengeti.get_all_tags
  end

=begin
  def search
    sunspot_arr = Sunspot.search(Team) do
      fulltext params[:search_key]
    end

    @tag_team = sunspot_arr.results

    respond_to do |format|
      format.js {render :action => 'tag_search.js.erb'}
    end
  end
=end

  def tag_search
    tag = params[:input]
    if params[:is_custom].nil?
      is_custom = true;
    else
      is_custom = false;
    end

    @tag_team = Team.all

    if is_custom
      @tag_team = @tag_team.select{|x| x.customTags.include?(tag)}
    else
      @tag_team = @tag_team.select{|x| x.tags.include?(tag)}
    end
  end

end
