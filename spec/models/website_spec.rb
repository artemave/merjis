require 'spec_helper'

describe Website do
  before do
    @website = Factory(:website, :user => Factory(:user))
  end

  it {should belong_to(:user)}
  it {should have_many(:crawls)}
  it {should have_many(:server_logs)}
  #TODO it {should have_many(:shares).as(:resource)}

  it {should validate_uniqueness_of(:fqdn).scoped_to(:user_id)}
  it {should validate_presence_of(:fqdn)}
  it {should validate_presence_of(:user)}

end
