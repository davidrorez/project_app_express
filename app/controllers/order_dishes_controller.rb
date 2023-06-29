class OrderDishesController < ApplicationController
  before_action :set_order_dish, only: %i[ show edit update destroy ]

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
      redirect_to order_dish_url(@order_dish), notice: "Order dish was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order_dish.update(order_dish_params)
      redirect_to order_dish_url(@order_dish), notice: "Order dish was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order_dish.destroy
    redirect_to order_dishes_url, notice: "Order dish was successfully destroyed." 
  end

  private
    def set_order_dish
      @order_dish = OrderDish.find(params[:id])
    end

    def order_dish_params
      params.require(:order_dish).permit(:order_id, :dish_id, :state)
    end
end