class StaticController < ApplicationController
    skip_before_action :verified_user
    layout 'flightlayout' 
    
    def home
    end
end