class AdminController < ApplicationController
  def index
  end
  
  def feedback
    f = Feedback.new
		f.user = current_user
		f.text = params[:feedback][:text]
		f.save

		redirect_to :back
  end
end
