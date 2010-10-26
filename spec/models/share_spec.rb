require 'spec_helper'

describe Share do
  before do
    @user = Factory(:user)
    @ability = Ability.new(@user)
    Share.owner = Factory(:user)
    @website = Factory(:website, :user => Share.owner)
  end

  it "should not allow user to share with himself"
  it "should not allow to share the same resource with the same user (by the same owner)"

  describe "when created" do
    it "should give read access to sharees" do
      Share.create(:resource => @website, :receiver => @user)
      @ability.should be_able_to(:read, @website)
    end
  end

  describe "when deleted" do
    it "should revoke read access from sharees" do
      @share = Share.create(:resource => @website, :receiver => @user)
      @share.destroy
      @ability.should_not be_able_to(:read, @website)
    end
  end
end
