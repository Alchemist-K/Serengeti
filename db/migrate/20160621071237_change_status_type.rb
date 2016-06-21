class ChangeStatusType < ActiveRecord::Migration
  def self.up
    change_column :teambuilds, :status, :integer
  end
  
  def self.down
    change_column :teambuilds, :status, :string
  end
end
