class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.rememberable
      t.trackable
      t.string :email
      t.string :uid

      t.timestamps
    end

    add_index :users, :uid, :unique => true
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
