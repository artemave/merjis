class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end

    add_index :shares, :user_id
    add_index :shares, :receiver_id
    add_index :shares, :resource_id
  end

  def self.down
    drop_table :shares
  end
end
