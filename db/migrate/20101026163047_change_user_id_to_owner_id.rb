class ChangeUserIdToOwnerId < ActiveRecord::Migration
  def self.up
    rename_column :shares, :user_id, :owner_id
  end

  def self.down
    rename_column :shares, :owner_id, :user_id
  end
end
