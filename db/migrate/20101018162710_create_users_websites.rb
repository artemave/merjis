class CreateUsersWebsites < ActiveRecord::Migration
  def self.up
    create_table :users_websites, :id => false do |t|
      t.integer :user_id
      t.integer :website_id
    end

    add_index :users_websites, :user_id
    add_index :users_websites, :website_id
  end

  def self.down
    remove_index :users_websites, :column => :website_id
    remove_index :users_websites, :column => :user_id

    drop_table :users_websites
  end
end
