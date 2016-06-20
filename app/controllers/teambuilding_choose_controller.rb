class TeambuildingChooseController < ApplicationController
    def choose
        
        @team_post=TeamPost.all
        
    end
    
    def write
        post=TeamPost.new
        post.team_post_title=params[:team_name]
        post.team_post_content=params[:team_abstact]
        post.save
        
        redirect_to :back
    end
end
