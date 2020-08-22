class PassengersController < ApplicationController
    
    def index
        @passengers = Passenger.all
    end
    
    def new
        @passenger = Passenger.new
        
    end

    def create
        @passenger = Passenger.create(pass_params)
    end

    def edit
        @passenger = Passenger.find_by(id: params[:id])
    end

    def update
        passenger = Passenger.find_by(id: params[:id])
        passenger.update(pass_params)
    end

    private

    def pass_params
        params.require(:passenger).permit(:id, :name)
    end
    
    
end