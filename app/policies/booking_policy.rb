class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def new?
    true
  end

  def confirmation?
    true
  end

  def intervention_schedueles?
    true
  end

  def show?
    record.user == user
  end
end
