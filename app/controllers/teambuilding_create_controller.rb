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
    
    # 이미지 업로드
    picture = params[:picture]
    uploader = ImguploadUploader.new
    uploader.store!(picture)
    
    # 파일 업로드
    file = params[:uploadfile]
    upfile = FileuploadUploader.new
    upfile.store!(file)
    
    new_team = Team.new(
                  name: params[:name],
                  abstract: params[:abstract],
                  content: params[:content],
                  number: params[:number],
                  leader: current_user.id,
                  img_name: uploader.url,
                  file_name: upfile.url, 
                  origin_file_name: file.original_filename
                )
<<<<<<< HEAD
    for i in 1..3 do
      new_team.tags << params["tag".concat(i.to_s).to_sym]
    end
    
    for i in 1..3 do
      custom_tag = params["custom_tag".concat(i.to_s).to_sym]
      unless custom_tag.nil?
        new_team.customTags << custom_tag 
      end
    end
    
    picture = params[:picture]
    uploader = ImguploadUploader.new
    uploader.store!(picture)
    
    new_team.picture = uploader.url
                
=======

>>>>>>> d6221442ecc3f9328d630ecde141d27f6e5733c9
    new_team.tags << params[:tag1]
    new_team.tags << params[:tag2]
    new_team.tags << params[:tag3]
    
    
    
    new_team.save
    
    redirect_to "/teambuilding_choose/#{new_team.id}"
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
