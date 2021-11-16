class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # everyone can access everything
    end
  end

  def new?
    create?
  end

  def create?
    true
  end
end
