class UsersController < ApplicationController
  before_action :require_admin, only: [:edit]  

  def index 
    @users = User.all  
  end 
  
  def show 
    @user = User.find(params[:id])
  end   

  def edit
    @user = User.find(params[:id]) 
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:email, :password, :password_confirmation, store_ids: []))
    flash[:notice] = "User was updated successfully "
     redirect_to users_path
    else 
      render 'edit'  
    end 
  end    
  
  private 
  def require_admin 
    if !current_user.admin? 
     flash[:alert] = "only admin can perform this task "
     redirect_to root_path
    end   
   end  
end    