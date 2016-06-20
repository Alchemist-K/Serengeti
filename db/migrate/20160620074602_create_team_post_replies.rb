class CreateTeamPostReplies < ActiveRecord::Migration
  def change
    create_table :team_post_replies do |t|

      t.text    :team_post_reply
      t.integer :team_post_id

      t.timestamps null: false
    end
  end
end
