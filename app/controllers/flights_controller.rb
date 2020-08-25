class FlightsController < ApplicationController
    before_action :verified_user, only: [:new]

    def index
        @flights = Flight.search(params[:search])
    end

    
    
    def new
        @flight = Flight.new
        20.times {@flight.passengers.build}
        # @flight.destinations.build
        # @flight.pilots.build
    end

    def create
        @flight = Flight.new(flight_params)
        
        if @flight.save!
  
            redirect_to flight_path(current_user,@flight)
        else
  
            render :new 
        end
    end

    def show
        @flight = Flight.find(params[:id])
    end


    def destroy
        @flight = Flight.find(params[:id])
        @flight.destroy
        redirect_to flights_path
    end



    private

    def flight_params
        params.require(:flight).permit(:flight_number, :flight_id, :destination_id, :pilot_id, :search, :pilot_id =>[], :destination_id =>[], passengers_attributes:[:id, :name])
    end
    
    
end