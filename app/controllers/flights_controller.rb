class FlightsController < ApplicationController
  before_action :set_airports, only: [ :index ]
  before_action :set_dates, only: [ :index ]
  def index
    if params
      @flights = Flight.where("departure_airport_id = ? AND arrival_airport_id = ? AND date = ?",
       params[:departure_airport], params[:arrival_airport], params[:flight_date])
    end
  end


  private

  def set_airports
    @airports = Airport.all.map { |airport| [ airport.name, airport.id ] }
  end

  def set_dates
    @dates = Flight.distinct.order("date asc").pluck(:date).map { |date| [ date.strftime("%d %B %Y"), date.strftime("%Y/%m/%d") ] }
  end
end
