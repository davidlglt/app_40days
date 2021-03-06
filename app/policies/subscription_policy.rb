class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.user == user
  end

  def create?
    record.user == user
  end
end
