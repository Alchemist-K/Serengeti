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

    new_team.tags << params[:tag1]
    new_team.tags << params[:tag2]
    new_team.tags << params[:tag3]
    
    custom_tag = Array.new
    custom_tag[0] = params[:custom_tag1]
    custom_tag[1] = params[:custom_tag2]
    custom_tag[2] = params[:custom_tag3]
    
    for i in 0..2 do
      unless custom_tag[i].nil?
        new_team.customTags << custom_tag[i]
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
    
    update_team = Team.find(update_id)
    update_team.name = params[:name]
    update_team.abstract = params[:abstract]
    update_team.content = params[:content]
    update_team.number = params[:number]
    
    update_team.save
    
    redirect_to "/teambuilding_choose/#{update_id}"
  end
end
