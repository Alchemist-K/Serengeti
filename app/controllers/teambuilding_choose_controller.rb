class TeambuildingChooseController < ApplicationController
  def choose
    if user_signed_in?
      @team_post_reply=TeamPostReply.all
    else
      redirect_to "/users/sign_in"
    end
  end

    def reply
        postreply=TeamPostReply.new
        postreply.team_post_reply=params[:team_reply]
        postreply.user_id=current_user.id
        postreply.save
        
        redirect_to :back
    end
end