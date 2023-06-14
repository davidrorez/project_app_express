class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    layout 'login', only: [:new, :show] # Usa el layout 'application' para las acciones index y show

    def index
      
    end
  
    def show
        
    end
  
    def new
        render layout: 'application'
    end
end
