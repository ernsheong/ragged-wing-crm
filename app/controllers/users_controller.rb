class UsersController < ApplicationController
  
  before_filter :ensure_signed_in, :ensure_admin
  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.json
  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render :action => :edit
    end
  end

  def show
    redirect_to users_path
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  
  def ensure_current_user
    head(401) unless current_user.id.to_s == params[:id]
  end
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end