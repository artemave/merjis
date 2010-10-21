require 'spec_helper'

describe User do
  before do
    @user = Factory(:authentication).user
  end

  it { should have_many(:authentications) }
  it { should have_many(:websites) }
  it { should have_many(:shares) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it 'should validate email format' do
    @user.email = 'asdfsdfsdfdd'
    @user.should_not be_valid
  end

  describe 'when edits profile' do
    it 'should not be possible to delete last openid' do
      @user.authentications << Factory(:authentication, :user => @user)

      @user.authentications.delete(@user.authentications.first)
      @user.should be_valid

      @user.authentications.delete(@user.authentications.first)
      @user.should_not be_valid
    end
  end

  describe 'website sharing' do
    before do
      @user = Factory(:user)
      @website = Factory(:website, :user => @user)
      @other_user = Factory(:user)
      @share_attrs = {
        :receiver => @other_user,
        :resource => @website
      }
      @ability = Ability.new(@other_user)
    end

    it "should not allow user to share with himself" do
      lambda { @user.sharings.create(@share_attrs.merge({:receiver => @user}))}.should raise_error
    end

    it "should not allow to modify sharee's shares"

    describe "when created" do
      it "should give read access to sharee's" do
        @ability.should_not be_able_to(:read, @website)
        @user.shares.create(@share_attrs)
        @ability.should be_able_to(:read, @website)
      end
    end

    describe "when deleted" do
      it "should revoke read access from sharees" do
        @share = @user.shares.create(@share_attrs)
        @ability.should be_able_to(:read, @website)

        @user.shares.delete(@share)
        @ability.should_not be_able_to(:read, @website)
      end
    end
  end

  describe 'permissions' do
    before do
      @user = Factory(:user)
      @ability = Ability.new(@user)
    end

    it 'user should be able to only edit his profile' do
      @ability.should be_able_to(:edit, @user)
      @ability.should_not be_able_to(:edit, Factory(:user))
    end

    it "user should only see his websites" do
      @ability.should be_able_to(:manage, Factory(:website, :user => @user))
      @ability.should_not be_able_to(:manage, Factory(:website, :user => Factory(:user)))
    end

    it "admin should able to manage everything" do
      @user = Factory(:admin_user)
      @ability = Ability.new(@user)
      @ability.should be_able_to(:edit, Factory(:user))
      @ability.should be_able_to(:manage, Factory(:website, :user => Factory(:user)))
    end
  end
end
