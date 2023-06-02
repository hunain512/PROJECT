class OrdersController < ApplicationController
  before_action :require_admin, only: [:index]  

  def index 
   @orders = Order.all  
  end   
  
  def checkout 
    @store = Store.find(params[:store_id])
    cart = Cart.find_or_create_by(user_id: current_user.id, store_id: @store.id, status: :active) 
    # if cart.cart_items.present?  
    @total_price = calculate_total_price(cart)
    @order = Order.new(cart_id: cart.id, user_id: current_user.id, store_id: @store.id, total:@total_price)
    if @order.save
     @new = cart.update(status: :completed)
    end   
  end
  
  private 
  def calculate_total_price(cart)
    total_price = 0  
     cart.cart_items.each do |cart_item|
       item_price = cart_item.item.price
       quantity = cart_item.quantity
       total_price += item_price * quantity
     end
    return total_price
  end

  def require_admin 
   if !current_user.admin? 
    flash[:alert] = "only admin can perform this task "
    redirect_to root_path
   end
  end      
end 