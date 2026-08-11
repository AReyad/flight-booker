class PassengerMailer < ApplicationMailer
  def confirmation_email(passengers, airport)
    @destination = airport.name
    passengers.each do |passenger|
      @passenger = passenger
      mail(to: passenger.email, subject: "You've successful booked a ticket to #{@destination}.")
    end
  end
end
