require 'spec_helper'

describe ServerLog do
  before do
    AWS::S3::S3Object.expects(:rename).returns(:true)
    AWS::S3::S3Object.expects(:delete).returns(:true)
    @server_log = Factory(:server_log)
  end

  it { should belong_to(:website) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:filename) }

  it "should rename file after upload"

  it "should delete file after destroy"
end
