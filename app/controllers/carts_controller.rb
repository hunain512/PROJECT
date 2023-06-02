class CartsController < ApplicationController 
  def dashboard
   @stores = Store.all  
  end  

  def add_item
    item = Item.find(params[:item_id])
    @store = Store.find(params[:store_id])
    cart = Cart.find_or_create_by(user_id: current_user.id, store_id: @store.id, status: :active)
    cart_item = cart.cart_items.find_or_create_by(item_id: item.id)
  
    if cart_item.persisted?
      cart_item.increment!(:quantity)
    else
      cart_item.quantity = 1
      cart_item.save
    end
    @cart_items = cart.cart_items
    @total_price = calculate_total_price(cart)
  end
  
  def remove_item
    item = Item.find(params[:item_id])
    @store = Store.find(params[:store_id])
    cart = Cart.find_by(user_id: current_user.id, store_id: @store.id, status: :active)

    cart_item = CartItem.find_by(cart: cart, item: item)
    cart_item.destroy if cart_item.present?
  
    @cart_items = cart.cart_items
    @total_price = calculate_total_price(cart)
  end
  
  
  # def increase_item_quantity
  #  @item = Item.find(params[:item_id])
  #  @store = Store.find(params[:store_id])
  #  cart = Cart.find_by(user_id: current_user.id, store_id: @store.id)
  #  cart_item = cart.items.find_by(id: @item.id)
  #   if cart_item.present?
  #     cart_item.quantity += 1
  #     cart_item.save
  #   end   
  #  @cart_item = cart_item.quantity 
  #  @cart_items = cart.items 
  #  @total_price = calculate_total_price(cart)
  # end
  
  # def decrease_item_quantity
  #  @item = Item.find(params[:item_id])
  #  @store = Store.find(params[:store_id])
  #  cart = Cart.find_by(user_id: current_user.id, store_id: @store.id)
  #   if cart_item = cart.items.find_by(id: @item.id)
  #     if cart_item.quantity > 1
  #       cart_item.quantity -= 1
  #       cart_item.save
  #     end
  #   end
  #  @cart_item = cart_item.quantity 
  #  @cart_items = cart.items
  #  @total_price = calculate_total_price(cart)
  # end

 private
 
 def calculate_total_price(cart)
  total_price = 0
  cart_items = cart.cart_items.includes(:item)  
   cart_items.each do |cart_item|
     item_price = cart_item.item.price.to_i
     quantity = cart_item.quantity.to_i
     total_price += item_price * quantity
   end
  return total_price
 end

 
end   