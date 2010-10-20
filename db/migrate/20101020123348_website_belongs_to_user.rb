class WebsiteBelongsToUser < ActiveRecord::Migration
  def self.up
    drop_table :users_websites
    add_column :websites, :user_id, :integer
    add_index :websites, :user_id
  end

  def self.down
    remove_index :websites, :column => :user_id
    remove_column :websites, :user_id
    create_table :users_websites, :id => false do |t|
      t.integer :user_id
      t.integer :website_id
    end
  end
end
