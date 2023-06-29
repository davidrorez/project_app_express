module Api
  class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: %i[ show edit update destroy ]
  
    
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
      render 'api/orders/show', status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @order.update(order_params)
      render 'api/orders/show', status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @order.destroy
    render 'api/orders/show', status: :ok
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
  
    def order_params
      params.require(:order).permit(:state, :client_id)
    end
  end
end