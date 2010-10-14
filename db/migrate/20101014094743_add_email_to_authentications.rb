class AddEmailToAuthentications < ActiveRecord::Migration
  def self.up
    add_column :authentications, :email, :string
  end

  def self.down
    remove_column :authentications, :email
  end
end
