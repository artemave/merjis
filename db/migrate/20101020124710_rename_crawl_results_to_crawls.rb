class RenameCrawlResultsToCrawls < ActiveRecord::Migration
  def self.up
    rename_table :crawl_results, :crawls
  end

  def self.down
    rename_table :crawls, :crawl_results
  end
end
