class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def private_show?
    user && user.courses.include?(record)
  end
end
