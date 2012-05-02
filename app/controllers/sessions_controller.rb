class SessionsController < ApplicationController
  skip_filter :verify_authenticity_token
  skip_filter :ensure_signed_in
  skip_filter :ensure_admin
  
  def new
    response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        :identifier => "https://www.google.com/accounts/o8/id",
        :required => ["http://axschema.org/contact/email"],
        :return_to => session_url,
        :method => 'POST')
    head 401
  end
  
  def create
    if openid = request.env[Rack::OpenID::RESPONSE]
      case openid.status
      when :success
        ax = OpenID::AX::FetchResponse.from_success_response(openid)
        user = User.where(:identifier_url => openid.display_identifier).first
        user ||= User.create!(:identifier_url => openid.display_identifier,
                              :email => ax.get_single('http://axschema.org/contact/email'),
                              :admin => User.all.empty?)
        if user
          session[:user_id] = user.id
        else
          flash[:error] = "Invalid Username/Password"
        end
        if user.first_name.blank? || user.last_name.blank?
          redirect_to(user_additional_info_path(user))
        else
          redirect_to root_path
        end
      when :failure
        render :action => 'problem'
      else
        redirect_to root_path
      end
    else
      redirect_to new_session_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
