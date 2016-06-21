class NoticeController < ApplicationController
  #공지사항 목록
  def index
    @notice = Notice.all.reverse
    @i = Notice.all.count #글 번호 매기기
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

end
