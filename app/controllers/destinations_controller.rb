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
        @destination = Destination.new(dest_params)
        
            if @destination.save!
      # this route really does not need to be nested.
      # see https://guides.rubyonrails.org/routing.html#shallow-nesting
            redirect_to user_destination_path(current_user, @destination)
        else
      # re-render the form with errors
        render :new 
        end
        
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
        params.require(:destination).permit(:name,:user_id)
    end

    
        
end