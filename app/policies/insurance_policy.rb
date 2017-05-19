class InsurancePolicy
  attr_reader :user, :insurance

  def initialize(user, insurance)
    @user = user
    @insurance = insurance
  end

  def create?
    @user.admin? || @insurance.user.id == @user.id
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin? || @insurance.user.id == @user.id
  end
end
