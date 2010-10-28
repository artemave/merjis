class AddLogFormatToServerLogs < ActiveRecord::Migration
  def self.up
    add_column :server_logs, :log_format, :string
    add_column :server_logs, :filename, :string
    add_column :server_logs, :s3_key, :string
  end

  def self.down
    remove_column :server_logs, :s3_key
    remove_column :server_logs, :filename
    remove_column :server_logs, :log_format
  end
end
