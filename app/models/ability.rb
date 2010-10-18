class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, User, :id => user.id
    can :manage, Authentication, :user_id => user.id
    can :manage, Website do |website|
      website.users.include?(user)
    end
  end
end
