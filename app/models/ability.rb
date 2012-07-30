class Ability
  include CanCan::Ability
  
  def initialize(user)
    #user ||= User.new # guest user
    
      can :read, :all

      if(user)
        can :create, Comment
        can :manage, Post do |post|
            post.user == user
        end
      end
      # can :update, Comment do |comment|
      #   comment.try(:user) == user || user.role?(:moderator)
      # end
      # if user.role?(:author)
      #   can :create, Article
      #   can :update, Article do |article|
      #     article.try(:user) == user
      #   end
      # end
    end  
end

