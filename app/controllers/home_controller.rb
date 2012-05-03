class HomeController < ApplicationController
  skip_filter :ensure_signed_in
  skip_filter :ensure_admin
  
  def index
    if signed_in?
    	@numbers = Relationship.count_relationships
      @users = User.all
      render 'dashboard'
    else
      render 'login'
    end
  end

end
