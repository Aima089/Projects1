class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    can :read, User, company_id: user.company_id if user.persisted?
    can :read, Product, company_id: user.company_id if user.persisted?
    if user.admin?
      can :manage, :all
    elsif user.accountant?
      can :manage, Product
    else
      can :read, Product
    end

    can :view, :dashboard if user.persisted?
    can :view, :products
  end
end
