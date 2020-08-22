class PilotsController < ApplicationController
    
    def index
        @pilots = Pilot.all
    end

    def show
        @pilot = pilot.find_by(id: params[:id])
    end

    def new
        @pilot = pilot.new
    end

    def create
        pilot = pilot.create(pilot_params)
        redirect_to pilot
    end

    

    def edit
        @pilot = pilot.find_by(id: params[:id])
    end

    def update
        pilot = Pilot.find_by(id: params[:id])
        pilot.update(pilot_params)
    end

    private

    def pilot_params
        params.require(:pilot).permit(:id, :name, :rank)
    end
    
end