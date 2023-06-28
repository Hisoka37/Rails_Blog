class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all # Admin has full access to all resources
    else
      can :destroy, Post, user_id: user.id # User can delete their own posts
      can :destroy, Comment, user_id: user.id # User can delete their own comments
    end
  end
end
