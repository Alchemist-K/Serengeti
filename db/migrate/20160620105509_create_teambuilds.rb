class CreateTeambuilds < ActiveRecord::Migration
  def change
    create_table :teambuilds do |t|
      
      t.integer   :user_id
      t.integer   :team_id
      t.string    :status   #changed to integer, -1 : 거절, 0 : 대기, 1 : 승인
      
      t.timestamps null: false
    end
  end
end
