class StoresController < ApplicationController
  before_action :require_admin, only: [:new, :edit]  
  
  def index 
    @stores = Store.all 
  end 
  
  def show 
   @store = Store.find(params[:id])
   @categories = @store.categories 
  end 
  
  def new 
    @store = Store.new 
  end 
  
  def create 
    @store = Store.new(set_param)
    if @store.save 
      redirect_to @store 
      flash[:notice] = "Store was created successfully "
    else 
      render 'new'  
    end   
  end 

  def edit
    @store = Store.find(params[:id])
  end   

  def update 
   @store = Store.find(params[:id])
   if @store.update(set_param)
      flash[:notice] = "STORE IS UPDATED SUCCESSFULLY"
      redirect_to @store
    else
      render 'edit'   
    end   
  end 
 
  def destroy 
    @store = Store.find(params[:id])
    @store.destroy 
    redirect_to stores_path
  end   

  private 


  def set_param
    params.require(:store).permit(:name, user_ids: [])
  end

  def require_admin 
   if !current_user.admin? 
    flash[:alert] = "only admin can perform this task "
    redirect_to root_path
   end   
  end  
end 