class AddFavorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favor, :string
  end
end
