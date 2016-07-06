class TeamsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @team = Team.new
  end
  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to '/'
    
    ## 이미지 업로드
    #picture = params[:picture]
    #uploader = ImguploadUploader.new
    #uploader.store!(picture)
    
    ## 파일 업로드
    #file = params[:uploadfile]
    #upfile = FileuploadUploader.new
    #upfile.store!(file)
    
    #new_team = Team.new
    #new_team.name = params[:name]
    #new_team.abstract = params[:abstract]
    #new_team.content = params[:content]
    #new_team.number = params[:number]
    #new_team.leader = current_user.id
    
    #if picture != nil 
      #new_team.img_name = uploader.url
      #new_team.file_name = upfile.url 
    #else
      
    #end
    
    #if file != nil
      #new_team.origin_file_name = file.original_filename
    #else
      
    #end

    #for i in 1..3 do
      #new_team.tags << params["tag".concat(i.to_s).to_sym]
    #end
    
    #for i in 1..3 do
      #custom_tag = params["custom_tag".concat(i.to_s).to_sym]
      #unless custom_tag.nil?
        #new_team.customTags << custom_tag 
      #end
    #end
    
    #new_team.save
    
    redirect_to "/teambuilding_choose/#{new_team.id}"
  end
  def edit
    @team = Team.find(params[:id])
  end
  def update
    
    @team = Team.find(params[:id])
    @team.update(team_params)
   
    @team.save
    
    redirect_to "/teambuilding_choose/#{params[:id]}"
  end
  def destory
    @team = Team.find(params[:id].to_i)
    @team.published = false
    @team.save

    redirect_to "/teambuilding_list/index"
  end
  private
  def team_params
    params.require(:team).permit(:name, :abstract, :content, :number, :leader, :img_name, :file_name, :origin_file_name )
  end
end
