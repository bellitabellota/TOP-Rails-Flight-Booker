class PassengerMailer < ApplicationMailer
  default from: "booking-confirmation@yourflightbooker.com"

  def confirm_booking
    @user = params[:user]
    @url = root_url
    mail(to: @user.email, subject: "Your flight booking is confirmed!")
  end
end
