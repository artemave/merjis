require 'spec_helper'

describe Share do
  before do
    @user = Factory(:user)
    @ability = Ability.new(@user)
    @owner = Factory(:user)
    @website = Factory(:website, :user => @owner)
    @share = Share.create(:resource => @website, :receiver => @user, :owner => @owner)
  end

  it {should belong_to(:owner)}
  it {should belong_to(:receiver)}
  it {should belong_to(:resource)}

  it {should validate_presence_of(:owner)}
  it {should validate_presence_of(:receiver)}
  it {should validate_presence_of(:resource)}

  #it {should validate_uniqueness_of(:owner_id).scoped_to(:resource_id, :resource_type, :receiver_id)}

  it "should not allow user to share with himself" do
    lambda { Share.create!(:resource => @website, :receiver => @user, :owner => @user) }.should raise_error(ActiveRecord::RecordInvalid, /not allowed.*share.*(your|him)self/)
  end

  it "should not allow to share the same resource with the same user (by the same owner)" do
    Share.create(:resource => @website, :receiver => @user, :owner => @owner)
    lambda { Share.create!(:resource => @website, :receiver => @user, :owner => @owner) }.should raise_error(ActiveRecord::RecordInvalid, /not allowed.*share.*same.*twice/)
  end

  describe "when created" do
    it "should give read access to sharees" do
      @ability.should be_able_to(:read, @website)
    end
  end

  describe "when deleted" do
    it "should revoke read access from sharees" do
      @share.destroy
      @ability.should_not be_able_to(:read, @website)
    end
  end
end
