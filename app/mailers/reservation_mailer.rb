class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def reservation_notification(owner, reservation)
  	@owner = owner
  	@reservation = reservation

  	mail(to: @owner.email, subject: 'New Reservation')
  end
end
