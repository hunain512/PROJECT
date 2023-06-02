class ItemsController < ApplicationController
  before_action :require_admin, only: [:new, :edit]  

  def index
    @items = Item.all  
  end 
  
  def show 
    @item = Item.find(params[:id])
  end 
  
  def new 
    @item = Item.new 
  end 
  
  def create 
    @item = Item.new(item_param)   
    if @item.save 
      redirect_to @item 
      flash[:notice] = "item was created successfully "
    else 
      render 'new'  
    end     
  end 
  
  def edit
    @item = Item.find(params[:id])
  end   

  def update 
    @item = Item.find(params[:id])
    if @item.update(item_param)
       flash[:notice] = "price IS UPDATED SUCCESSFULLY"
       redirect_to @item 
    else
       render 'edit'   
    end   
  end  

  def destroy
    @item = Item.find(params[:id])
    @item.destroy 
    flash[:notice] = "item deleted successfully"
    redirect_to items_path 
  end   


  private 

  def item_param
    params.require(:item).permit(:name, :price, :category_id)
  end

  def require_admin 
   if !current_user.admin? 
    flash[:alert] = "only admin can perform this task "
    redirect_to root_path
   end   
  end  
end   