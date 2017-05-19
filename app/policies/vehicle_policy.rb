class VehiclePolicy
  attr_reader :user, :vehicle

  def initialize(user, vehicle)
    @user = user
    @vehicle = vehicle
  end

  def search?
    @user.admin? || @vehicle.user_id == @user.id
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin? || @vehicle.user_id == @user.id
  end
end
