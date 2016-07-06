class AdminController < ApplicationController
  def index
  end
  
  def feedback
    @feedback = Feedback.all
  end
end
