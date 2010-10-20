class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, User, :id => user.id
    can :manage, Authentication, :user_id => user.id
    can :manage, Website, :user_id => user.id
  end
end
