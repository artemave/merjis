require 'spec_helper'

describe User do
  before do
    @user = Factory(:authentication).user
  end

  it { should have_many(:authentications) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it 'should validate email format' do
    @user.email = 'asdfsdfsdfdd'
    @user.should_not be_valid
  end

  describe 'when signed in' do
    it 'should be able to only edit his profile' do
      ability = Ability.new(@user)

      ability.should be_able_to(:edit, @user)
      ability.should_not be_able_to(:edit, Factory(:user))
    end

    describe 'and edits profile' do
      it 'should not be possible to delete last openid' do
        @user.authentications << Factory(:authentication, :user => @user)

        @user.authentications.delete(@user.authentications.first)
        @user.should be_valid

        @user.authentications.delete(@user.authentications.first)
        @user.should_not be_valid
      end
    end
  end
end
