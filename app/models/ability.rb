# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user)
    user ||= AdminUser.new
    if user.role == 'admin'
      # can :manage, :all
      can [:read, :update ,:create], Store 
      can [:read, :update ,:create], Category
      can [:read, :update ,:create], Brand
      can [:read, :update ,:create], Coupon
      can [:read, :update ,:create], AdminUser
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    else
      can [:read, :update ,:destroy], Product , :store_id => user.store.id
      can [:create] , Product 
      can [:read, :update], Order , :store_id => user.store.id
      # can [:read, :update], Store , :id => user.store.id
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    end
  end
end
