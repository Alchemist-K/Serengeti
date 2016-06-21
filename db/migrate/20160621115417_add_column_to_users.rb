class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interest1, :string
    add_column :users, :interest2, :string
    add_column :users, :interest3, :string
  end
end
