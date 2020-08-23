class PilotsController < ApplicationController
    
    def index
        @pilots = Pilot.all
    end

    def show
        @pilot = Pilot.findy(params[:id])
    end

    def new
        @pilot = Pilot.new
    end

    def create
        pilot = Pilot.create(pilot_params)
        redirect_to pilot
    end

    

    def edit
        @pilot = Pilot.find(params[:id])
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