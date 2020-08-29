class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in
    helper_method :verified_user


      def verified_user
        redirect_to '/' unless logged_in
      end  
      
      def current_user
       current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
      end
      
      # def current_user
      #     User.where(id: session[:user_id]).first
      # end
      
      def logged_in
          !!current_user
        
      end
end
