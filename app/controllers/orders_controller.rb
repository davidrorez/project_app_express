class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_clients
  before_action :set_dishes

  def index
    @orders = Order.all
    apply_filters(params[:client_id], params[:start_date], params[:end_date], params[:state])
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

      if @order.save
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render :new
      end
  end

  def update
      if @order.update(order_params)
        redirect_to order_url(@order), notice: "Order was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @order.order_dishes.destroy_all 
    @order.destroy
      redirect_to orders_url, notice: "Order was successfully destroyed."
  end


  private

    def apply_filters(client_id, start_date, end_date, state)
      @orders = @orders.where(client_id: client_id) if client_id.present?
      @orders = @orders.where("created_at >= ?", start_date.to_date.beginning_of_day) if start_date.present?
      @orders = @orders.where("created_at <= ?", end_date.to_date.end_of_day) if end_date.present?
      @orders = @orders.where(state: state) if state.present?
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def set_clients
      @clients = Client.all.map {|client| ["#{client.first_name} #{client.last_name}", client.id]} 
    end

    def set_dishes
      @dishes = Dish.all.map {|dish| ["#{dish.name} #{dish.price}", dish.id]} 
    end

    def order_params
      params.require(:order).permit(:client_id, :state)
    end
end
