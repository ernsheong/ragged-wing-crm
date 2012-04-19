class HomeController < ApplicationController
  skip_filter :ensure_signed_in
  
  def index
    if signed_in?
      render 'dashboard'
    else
      render 'login'
    end
  end

end
