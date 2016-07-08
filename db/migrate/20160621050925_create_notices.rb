class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.text :title
      t.text :content
      t.timestamps null: false
    end
  end
end
