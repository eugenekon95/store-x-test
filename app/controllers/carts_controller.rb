class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_items = current_order.order_items
  end

  def update
    update_order_items_quantities
    current_order.update(total_price: params[:total_price].to_f, status: 'ordered')
    last_ordered_order = current_user.orders.ordered.last
    OrderMailer.complete_order_email(current_user, last_ordered_order).deliver_now
  end

  def profile
    @ordered_orders = current_user.orders.ordered.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
  end

  private

  def update_order_items_quantities
    quantities_array = params[:quantities].to_ary
    current_order.order_items.each.with_index do |item, index|
      item.update(quantity: quantities_array[index].to_i)
    end
  end
end
