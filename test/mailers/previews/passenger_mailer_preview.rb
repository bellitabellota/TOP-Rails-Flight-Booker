# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirm_booking
    PassengerMailer.with(user: Passenger.last).confirm_booking
  end
end
