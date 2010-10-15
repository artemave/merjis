require 'spec_helper'

describe Authentication do
  before do
    @auth = Factory(:authentication)
  end
  it { should belong_to(:user) }

  it "should only allow delete through associated user" do
    lambda { @auth.destroy }.should raise_error

    lambda { @auth.user.authentications.delete(@auth) }.should_not raise_error
  end
end
