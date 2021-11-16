class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.artist
        scope.joins(:service).where({services: {user: user}})
      else
        scope.where(user: user)
      end
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
