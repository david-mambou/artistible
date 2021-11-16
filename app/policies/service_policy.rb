class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # everyone can Read every service
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end
end
