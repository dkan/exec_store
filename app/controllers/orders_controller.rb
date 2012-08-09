class OrdersController < ApplicationController    
    
    def new
        @order = Order.new
    end

    def create
        if Order.count >= ExecStore::Application::HOODIE_LIMIT
            raise ('No more hoodies, but nice try.')
        else
            @order = Order.new(params[:order])
        end
        @order.hoodie = "#{session[:current_hoodie].color1} #{session[:current_hoodie].color2} #{session[:current_hoodie].size}" unless session[:current_hoodie] == nil
        if @order.save
            if @order.bill_customer
                @order.email_customer
            
                flash[:success] = "Thanks #{params[:order][:billing_name].split[0]} for purchasing a hoodie!"
                session[:current_hoodie] = nil
            
                redirect_to thanks_path
            else
               flash[:error] = "There was an error billing your credit card."
               render "new"
            end
        else
            render 'new'
        end
    end
end
