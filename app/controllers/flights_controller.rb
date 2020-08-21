class FlightsController < ApplicationController
    
    def index
        @flights = Flight.all
    end
    
    def new
        @flight = Flight.new
        @flight.passengers.build
    end

    def create
        flight = Flight.create(flight_params)
        redirect_to flight_path(flight)
    end

    def show
        @flight = find_by(params[:id])
    end



    private

    def flight_params
        params.require(:flight).permit(:flight_number, :pilot_id, :destination_id, passengers_attributes:[:id, :name])
    end
    
    
end