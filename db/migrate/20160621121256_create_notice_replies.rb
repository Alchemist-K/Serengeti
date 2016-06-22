class CreateNoticeReplies < ActiveRecord::Migration
  def change
    create_table :notice_replies do |t|
      t.string :content
      t.integer :user_id
      t.integer :notice_id
      t.timestamps null: false
    end
  end
end
