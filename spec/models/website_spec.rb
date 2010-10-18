require 'spec_helper'

describe Website do
  it {should have_and_belong_to_many(:users)}
  it {should have_many(:crawl_results)}
  it {should have_many(:server_logs)}

  it {should validate_presence_of(:fqdn)}
  it {should validate_presence_of(:users)}
  it "should validate uniqueness of fqdn scoped to user"
end
