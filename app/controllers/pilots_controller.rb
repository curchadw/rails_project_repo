class PilotsController < ApplicationController
    before_action :verified_user
    layout 'flightlayout' 
    
    def index
        @pilots = Pilot.all
        
        # if params[:search]
        #     @pilots = Pilot.search(params[:search])        
        # else
        #     @pilots = Pilot.all
        # end  
        
        
    end

    def most
        @pilots = Pilot.top_pilot
    end
    
    

    def show
        @pilot = Pilot.find(params[:id])
    end

    def new
        @pilot = Pilot.new
    end

    def create
        @pilot = Pilot.create(pilot_params)
        if @pilot.save
      
            redirect_to pilot_path(current_user,@pilot.id)
        else
            flash.now[:danger] = 'Pilot Info needs to be filled to continue'
            render :new
        
        end
    end

    def search
        if params[:search].blank?
            # flash.now[:danger] = 'Empty field!'
            redirect_to(pilots_path current_user, alert: "Empty field!")
            
        else
            @parameter = params[:search].downcase
            @results = Pilot.all.where("lower(name) LIKE :search ", search: @parameter )
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
        params.permit(:id, :name, :rank, :user_id, :search)
    end
    
end