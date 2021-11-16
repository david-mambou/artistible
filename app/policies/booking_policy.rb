class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def index?
    true
  end

  def accept?
    the_artist?
  end

  def decline?
    the_artist?
  end

  private

  def the_artist?
    record.service.user == user
  end
end
