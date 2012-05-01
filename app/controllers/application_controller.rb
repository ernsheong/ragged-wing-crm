class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env.test?
    prepend_before_filter :stub_current_user
    def stub_current_user
      session[:user_id] = 1
    end
  end

  include AuthenticationHelper
  before_filter :ensure_admin

end
