class CreateTeamPosts < ActiveRecord::Migration
  def change
    create_table :team_posts do |t|

      t.text    :team_post
      t.integer :team_post_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
