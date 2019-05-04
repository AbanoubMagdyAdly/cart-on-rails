# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user)
    user ||= AdminUser.new
    if user.role == 'admin'
      # can :manage, :all
      can :manage, Store 
      can :manage, Category
      can :manage, Brand
      can :manage, Coupon
      can :manage, AdminUser
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    else
      can [:read, :update ,:destroy], Product , :store_id => user.store.id
      can [:create] , Product 
      can [:read, :update], Order
      # can [:read, :update], Store , :id => user.store.id
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    end
  end
end
