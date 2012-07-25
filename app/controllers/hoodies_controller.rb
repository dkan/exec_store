class HoodiesController < ApplicationController

    def new
        @hoodie = Hoodie.new        
    end
    
    def create
        @hoodie = Hoodie.new(params[:hoodie])
        if @hoodie.save
            flash[:success] = "You have selected a hoodie."
            session[:current_hoodie] = @hoodie
            redirect_to purchase_path
        else
            flash.now[:error] = "Please select all fields."
            render 'new'
        end
    end
    
end
