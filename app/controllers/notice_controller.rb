class NoticeController < ApplicationController
  def index
    @notice = Notice.all
  end
  
  def write
    notice = Notice.create(title: params[:title], content: params[:content])
    notice.save
    
    redirect_to :back
    
  end
end
