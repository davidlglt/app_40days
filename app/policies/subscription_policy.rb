class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.nil? || user.subscriptions.where(course_id: record.course_id).empty?
  end
end
