require 'spec_helper'

describe Authentication do
  before do
    @auth = Factory(:authentication)
  end

  it { should belong_to(:user) }
end
