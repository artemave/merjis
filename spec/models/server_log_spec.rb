require 'spec_helper'

describe ServerLog do
  before do
    AWS::S3::S3Object.expects(:rename).at_least_once
    AWS::S3::S3Object.expects(:delete).at_least_once
    ServerLog.any_instance.expects(:generate_key).returns("keyname")
    @server_log = Factory(:server_log)
  end

  it { should belong_to(:website) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:filename) }

  it "should mv file after upload" do
    @server_log.s3_key.should == "keyname"
  end
end

