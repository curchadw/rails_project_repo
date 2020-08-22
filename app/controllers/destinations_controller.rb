class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    def new
        @destination = Destination.new
    end

    def create
        destination = Destiatnion.create(dest_params)
        redirect_to destination
    end

    

    def edit
        @destination = Destination.find_by(id: params[:id])
    end

    def update
        destination = Destination.find_by(id: params[:id])
        destination.update(dest_params)
    end

    private

    def dest_params
        params.require(:destination).permit(:id, :name)
    end
        
end