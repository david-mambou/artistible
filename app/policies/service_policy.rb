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

  def edit?
    update?
  end

  def update?
    the_artist?
  end

  def delete_photo?
    the_artist?
  end

  def destroy?
    the_artist?
  end

  private

  def the_artist?
    record.user == user
  end
end
