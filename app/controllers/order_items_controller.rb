class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: %i[update destroy]

  def create
    @order_item = current_order.order_items.find_or_create_by(product_id: params[:product_id], user: current_user)
    @order_item.update(quantity: @order_item.quantity + 1)
    session[:order_id] = current_order.id
    redirect_to :cart
  end

  def update
    @order_items = current_order.order_items
    redirect_to :cart
  end

  def destroy
    @order_item.destroy
    redirect_to :cart
  end

  private

  def set_params
    @order_item = current_order.order_items.find(params[:id])
    @order_items = current_order.order_items
  end
end
