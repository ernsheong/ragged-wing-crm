class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticationHelper
  before_filter :ensure_admin
  before_filter :ensure_signed_in

  if Rails.env.test?
    prepend_before_filter :create_user
    after_filter :remove_user
    def create_user
    	user = FactoryGirl.create(:user)
    	session[:user_id] = user.id
    end
    def remove_user
    	User.destroy_all
    end
  end
end
