class AdditionalInfosController < ApplicationController
  skip_filter :ensure_admin
  
  def show
    @user = User.find(params[:user_id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @user.update_attributes(params[:user])
    redirect_to(session[:redirect_to] || root_path)
  end
  
end