class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    can :manage, Category, author: user if user.present?
    can :manage, Deal, author: user if user.present?
  end
end
