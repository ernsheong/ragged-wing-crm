class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticationHelper

  unless Rails.env.test?
    before_filter :ensure_admin
    before_filter :ensure_signed_inp
  end
end
