class VehiclePolicy
  attr_reader :user, :vehicle

  def initialize(user, vehicle)
    @user = user
    @vehicle = vehicle
  end

  def search?
    @user.admin? || @vehicle.user_id == @user.id
  end
end
