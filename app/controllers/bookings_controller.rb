class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show ]
  before_action :set_flight, only: [ :new ]

  def show
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def new
    @booking = Booking.new
    passengers_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.expect(booking: [ :flight_id, passengers_attributes: [  [ :name, :email ] ] ])
  end

  def passengers_count
    count = params[:passengers_count].to_i

    # (1-4) valid passengers_count range
    if count.between? 1, 4
      count
    else
      return 1 if count < 1
      4
    end
  end

  def set_flight
    @flight = Flight.find(params.expect([ :flight ]))
  end

  def set_booking
    @booking = Booking.find(params.expect([ :id ]))
  end
end
