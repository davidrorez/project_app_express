module Api
  class OrderDishesController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    before_action :set_order_dish, only: %i[ show edit update destroy ]
    after_action :change_state, only: %i[ create ]

    def index
      @order_dishes = OrderDish.all
    end

    def show; end

    def new
      @order_dish = OrderDish.new
    end

    def edit; end
      
    def create
      @order_dish = OrderDish.new(order_dish_params)
        if @order_dish.save
          render 'api/order_dishes/show', status: :created
        else
          render json: @order_dish.errors, status: :unprocessable_entity
        end
    end
      
    def update
      if @order_dish.update(order_dish_params)
        render 'api/order_dishes/show', status: :ok
      else
        render json: @order_dish.errors, status: :unprocessable_entity
      end
    end
      
    def destroy
      @order_dish.destroy
      render 'api/order_dishes/show', status: :ok
    end

    def change_state
      if @order_dish.order.state == "delivered" || @order_dish.order.state == "cancelled"
        return
      end

      if @order_dish.order && @order_dish.state == "ready"
        Thread.new do
          begin
            sleep(20.seconds)
            @order_dish.order.update(state: 1)
            sleep(40.seconds)
            @order_dish.order.update(state: 2)
          rescue StandardError => e
            Rails.logger.error("Error: #{e.message}")
          end
        end
      end
    end
    
      
    private
      def set_order_dish
        @order_dish = OrderDish.find(params[:id])
      end
      
      def order_dish_params
        params.require(:order_dish).permit(:order_id, :dish_id, :state)
      end
  end
end 
