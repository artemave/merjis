class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.string :fqdn
      t.string :name
      t.text :description
      t.boolean :main, :default => true
      t.boolean :mobile, :default => false
      t.boolean :images, :default => false
      t.boolean :video, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :websites
  end
end
