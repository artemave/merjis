class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, User, :id => user.id
  end
end
