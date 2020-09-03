class DestinationsController < ApplicationController
    before_action :verified_user

    def index
        @destinations = Destination.order_by_name
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
            redirect_to user_destination_path(current_user,@destination.id)
        else
      # re-render the form with errors
        render :new 
        end
        
    end

    

    def edit
        @destination = Destination.find(params[:id])
    end

    def update
        @destination = Destination.find(params[:id])
        if @destination.update_attributes(dest_params)
            flash[:success] = "Destination updated"
            redirect_to @destination
        else
            render 'edit'
        end   
    end

    def destroy
        @destination = Destination.find(params[:id])
        @destination.destroy
        redirect_to user_destinations_path
    end

    private

    def dest_params
        params.require(:destination).permit(:name)
    end

    
        
end