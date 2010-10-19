class CreateCrawlResults < ActiveRecord::Migration
  def self.up
    create_table :crawl_results do |t|
      t.integer :website_id

      t.timestamps
    end
  end

  def self.down
    drop_table :crawl_results
  end
end
