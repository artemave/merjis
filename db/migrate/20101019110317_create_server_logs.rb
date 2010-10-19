class CreateServerLogs < ActiveRecord::Migration
  def self.up
    create_table :server_logs do |t|
      t.integer :website_id

      t.timestamps
    end
  end

  def self.down
    drop_table :server_logs
  end
end
