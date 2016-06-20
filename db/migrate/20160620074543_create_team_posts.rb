class CreateTeamPosts < ActiveRecord::Migration
  def change
    create_table :team_posts do |t|

      t.string :team_post_title
      t.text   :team_post_content

      t.timestamps null: false
    end
  end
end
