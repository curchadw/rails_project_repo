class FlightsController < ApplicationController
    before_action :verified_user, only: [:new]

    def index
        if params[:flight_number]
            @flight =Flight.where('flight_number LIKE?', "%#{params[:flight_number]}")
        else
            @flights = Flight.all
        end
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