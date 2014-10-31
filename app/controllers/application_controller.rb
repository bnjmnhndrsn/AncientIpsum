class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def sign_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    user.save!
  end
  
  def sign_out!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
    current_user.try(:save!)
  end
  
  def current_user
    User.find_by(session_token: session[:session_token])
  end
  
  helper_method :sign_in!, :sign_out!, :current_user
end
