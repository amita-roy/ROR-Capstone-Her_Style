class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin
    return if current_user

    session[:intended_url] = request.url
    redirect_to signin_path, alert: 'Please sigin first !'
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?
end
