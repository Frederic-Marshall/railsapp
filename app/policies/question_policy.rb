class QuestionPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.author?(record)
  end

  def destroy?
    true
  end

  def index?
    true
  end

  def show?
    true
  end
end