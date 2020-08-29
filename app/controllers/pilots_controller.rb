class PilotsController < ApplicationController
    
    def index
        @pilots = Pilot.all
    end

    def show
        @pilot = Pilot.find(params[:id])
    end

    def new
        @pilot = Pilot.new
    end

    def create
        @pilot = Pilot.new(pilot_params)
        if @pilot.save
      
            redirect_to pilot_path(current_user,@pilot.id)
        else
      
        render :new 
        end
    end

    

    def edit
        @pilot = Pilot.find(params[:id])
    end

    def update
        @pilot = Pilot.find(params[:id])
        if @pilot.update_attributes(pilot_params)
            flash[:success] = "Destination updated"
            redirect_to @pilot
        else
            render 'edit'
        end   
    end

    def destroy
        @pilot = Pilot.find(params[:id])
        @pilot.destroy
        redirect_to pilots_path
    end
    private

    def pilot_params
        params.require(:pilot).permit(:id, :name, :rank)
    end
    
end