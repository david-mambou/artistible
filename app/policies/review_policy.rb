class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    the_customer?
  end

  def delete?
    the_customer?
  end

  private

  def the_customer?
    record.user == user
  end
end
