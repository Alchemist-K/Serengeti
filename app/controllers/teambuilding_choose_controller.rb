class TeambuildingChooseController < ApplicationController
  before_action :require_login, only: [:replypost, :replyreply]
  before_action :ispermitted
  
  # 첫 화면(팀을 고른 이후에 나타나게 되는 화면)
  def index
    team_id = params[:id].to_i
    @each_team = Team.find(team_id)
    @team_post = TeamPost.where(team_post_id: team_id)
  end
  
  def choose
    if user_signed_in?
      @team_post=TeamPost.all
    else
      redirect_to "/users/sign_in"
    end
  end

  # 해당하는 팀에 댓글을 다는 기능
    def replypost
      replypost = TeamPost.new
      replypost.team_post = params[:reply_post]
      replypost.user_id = current_user.id
      replypost.team_post_id = params[:team_id]
      replypost.save
      
      @team_post = TeamPost.where(team_post_id: params[:team_id].to_i)
    end
    
  # 댓글을 수정하는 기능
    def destroy
      if current_user.id == TeamPost.find(params[:post_id]).user.id || current_user.admin?
        @one_post = TeamPost.find(params[:post_id])
        @one_post.destroy
        redirect_to :back
      else
        redirect_to :back
      end
    end
    
  # 대댓글(댓글의 댓글) 기능
    def replyreply
      replyreply=TeamPostReply.new
      replyreply.team_post_reply=params[:reply_reply]
      replyreply.user_id=current_user.id
      replyreply.team_post_id=params[:post_id]
      replyreply.save
      @postid = params[:post_id]
      @team_post = TeamPost.find_by(id: replyreply.team_post_id)
    end
    
  # 대댓글(댓글의 댓글) 삭제 기능
    def destroyreply
      replyid = params[:id].to_i
      @postid = params[:post_id]
      @team_post = TeamPost.find_by(id: @postid)
      if current_user.id == TeamPostReply.find(replyid).user.id || current_user.admin?
        TeamPostReply.find(replyid).destroy
        redirect_to :back
      else
        redirect_to :back
      end
    end
    
  def require_login
    unless user_signed_in?
      redirect_to :back    
    end
  end
end
