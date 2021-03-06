class NoticeController < ApplicationController
  before_action :require_admin, only: [:write, :update, :delete]
  before_action :require_login, only: [:reply_write]

  #공지사항 목록
  def index
    @notice = Notice.all.paginate(:page => params[:page], per_page: 5)
  end
  
  #공지사항 올리기
  def write
    notice = Notice.create(title: params[:title], content: params[:content])
    notice.save
    
    redirect_to "/notice/index"
  end
  
  #공지사항 인풋
  def write_input
  end
  
  #공지사항 읽기
  def read
    @notice = Notice.find(params[:post_id])
  end
  
  #공지사항 수정 인풋
  def update_view
    @notice = Notice.find(params[:post_id])
  end
  
  #공지사항 action
  def update
    @notice = Notice.find(params[:post_id])
    @notice.title = params[:title]
    @notice.content = params[:content]
    @notice.save
    redirect_to "/notice/index"
  end
  
  #글 지우기
  def delete
    @notice = Notice.find(params[:post_id])
    @notice.delete
    redirect_to "/notice/index"
  end
  
  #댓글 달기
  def reply_write
    reply_new = NoticeReply.new(content: params[:reply], notice_id: params[:notice_id], 
                                user_id: current_user.id)
    if reply_new.save
      @notice_reply = NoticeReply.where(notice_id: params[:notice_id])
    else
      alert("No!")
    end
  end
  
  #댓글 지우기
  def reply_delete
    one_delete = NoticeReply.find(params[:notice_reply_id])
    one_delete.delete
    @notice_reply = NoticeReply.where(notice_id: params[:notice_id])
  end
  
  def require_admin
    if user_signed_in? == false
      flash[:error] = "관리자 권한이 필요합니다."
      redirect_to "/notice/index"
    elsif
      unless current_user.admin?
        flash[:error] = "관리자 권한이 필요합니다."
        redirect_to "/notice/index"
      end
    end
  end
  
  def require_login
    unless user_signed_in?
      redirect_to :back    
    end
  end
  
end
