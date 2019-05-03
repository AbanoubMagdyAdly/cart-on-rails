# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user)
    user ||= AdminUser.new
    if user.role == 'admin'
      can :manage, :all
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    else
      can :manage, Product , :store_id => user.store.id
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    end
  end
end
