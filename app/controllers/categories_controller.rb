class CategoriesController < ApplicationController

  before_action :require_admin, only: [:new, :edit]  

  def index 
    @categories = Category.all 
  end   
  
  def show 
    @category = Category.find(params[:id])
  end 
  
  def new 
    @category = Category.new 
  end 
  
  def create 
    @category = Category.new(set_param)   
    if @category.save 
      redirect_to @category 
      flash[:notice] = "category was created successfully "
    else 
      render 'new'  
    end     
  end 
  
  def edit
    @category = Category.find(params[:id])
  end   

  def update 
   @category = Category.find(params[:id])
    if @category.update(set_param)
      flash[:notice] = "category IS UPDATED SUCCESSFULLY"
      redirect_to @category
    else
        render 'edit'   
    end   
  end 

  def destroy 
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "category destroy successfully"
    redirect_to categories_path 
  end   
  private 

  def set_param
    params.require(:category).permit(:name, :store_id)
  end

  def require_admin 
   if !current_user.admin? 
    flash[:alert] = "only admin can perform this task "
    redirect_to root_path
   end   
  end  
  
end 