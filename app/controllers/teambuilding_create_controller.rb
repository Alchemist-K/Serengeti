class TeambuildingCreateController < ApplicationController
  before_action :authenticate_user!
  before_action :ispermitted
  
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
    
    new_team = Team.new
    new_team.name = params[:name]
    new_team.abstract = params[:abstract]
    new_team.content = params[:content]
    new_team.number = params[:number]
    new_team.leader = current_user.id
    
    if picture != nil 
      new_team.img_name = uploader.url
    else
      
    end
    
    if file != nil
      new_team.file_name = upfile.url 
      new_team.origin_file_name = file.original_filename
    end

    for i in 1..3 do
      new_team.tags << params["tag".concat(i.to_s).to_sym]
    end
    
    for i in 1..3 do
      custom_tag = params["custom_tag".concat(i.to_s).to_sym]
      unless custom_tag.nil?
        new_team.customTags << custom_tag 
      end
    end
    
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
    
    # 이미지 업로드
    picture = params[:picture]
    uploader = ImguploadUploader.new
    uploader.store!(picture)
    
    # 파일 업로드
    file = params[:uploadfile]
    upfile = FileuploadUploader.new
    upfile.store!(file)
    
    update_team = Team.find(update_id)
    update_team.name = params[:name]
    update_team.abstract = params[:abstract]
    update_team.content = params[:content]
    update_team.number = params[:number]
    
    # S3 이전 이미지 삭제
    old_img_url = update_team.img_name
    old_img_name = old_img_url.split('/')[5]
    remover = ImguploadUploader.new
    remover.retrieve_from_store!(old_img_name)
    remover.remove!
    
    # S3 이전 파일 삭제
    old_file_url = update_team.file_name
    old_file_name = old_file_url.split('/')[5]
    remover = FileuploadUploader.new
    remover.retrieve_from_store!(old_file_name)
    remover.remove!
    
    if picture != nil 
      update_team.img_name = uploader.url
    end
    
    if file != nil
      update_team.file_name = upfile.url 
      update_team.origin_file_name = file.original_filename
    end
   
    update_team.save
    
    redirect_to "/teambuilding_choose/#{update_id}"
  end
end
