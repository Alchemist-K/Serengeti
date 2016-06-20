class CreateTeambuilds < ActiveRecord::Migration
  def change
    create_table :teambuilds do |t|
      
      t.integer   :user_id
      t.integer   :team_id
      t.string    :status
      
      t.timestamps null: false
    end
  end
end
