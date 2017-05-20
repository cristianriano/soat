class UsersMailer < ApplicationMailer

  def purchase_summary(user, insurance)
    @user = user
    @insurance = insurance
    @vehicle = @insurance.vehicle
    @rate = @insurance.rate
    mail(to: user.email,
        subject: "Compra SOAT para #{@vehicle.license}")
  end
end
